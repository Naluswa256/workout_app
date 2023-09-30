import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../data/repositories/firebase_repository_implementation.dart';
import '../../../domain/repositories/firebase_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final  AuthenticationRepositoryImplementation _repository;

  AuthenticationBloc({required  AuthenticationRepositoryImplementation repository})
      : _repository = repository,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is SignInEvent) {
      yield AuthenticationLoading();
      final result =
      await _repository.signInWithEmailAndPassword(event.email, event.password);
      yield result.fold(
            (errorMessage) => AuthenticationError(errorMessage: errorMessage),
            (userModel) => AuthenticationSuccess(userModel: userModel),
      );
    } else if (event is SignUpEvent) {
      yield AuthenticationLoading();
      final result =
      await _repository.signUpWithEmailAndPassword(event.email, event.password);
      yield result.fold(
            (errorMessage) => AuthenticationError(errorMessage: errorMessage),
            (userModel) => AuthenticationSuccess(userModel: userModel),
      );
    }
  }
}
