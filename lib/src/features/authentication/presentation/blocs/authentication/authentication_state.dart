// lib/presentation/blocs/authentication/authentication_state.dart

import 'package:equatable/equatable.dart';

import '../../../data/models/firebase_user_model.dart';


abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String errorMessage;

  AuthenticationError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationSuccess extends AuthenticationState {
  final UserModel userModel;

  AuthenticationSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}
