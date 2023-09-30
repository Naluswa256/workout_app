

import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/firebase_repository.dart';
import '../data_sources/firebase_authentication_data_source.dart';
import '../models/firebase_user_model.dart';
import '../models/user_profile_model.dart';
import 'firebase_storage_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final FirebaseAuthenticationDataSource _dataSource;
  final FirestoreRepositoryImplementation _firebaseRepository;
  AuthenticationRepositoryImplementation(this._dataSource, this._firebaseRepository);

  @override
  Future<Either<String, UserModel>> signInWithEmailAndPassword(
      String email, String password) async {
    final result = await _dataSource.signInWithEmailAndPassword(email, password);
    return result.fold(
          (errorMessage) => Left(errorMessage.errorMessage),
          (userModel) => Right(userModel),
    );
  }

  @override
  Future<Either<String, UserModel>> signUpWithEmailAndPassword(
      String email, String password) async {
    final result = await _dataSource.signUpWithEmailAndPassword(email, password);
    return result.fold(
          (errorMessage) => Left(errorMessage.errorMessage),
          (userModel) async {
            final userProfile = UserProfileModel(
              profilePic: userModel.photo ?? '',
              uid: userModel.uid!,
              userWeight: '',
              userHeight: '',
              userFitnessLevel: '',
              preferences: [],
              userEmail:userModel.email!,
            );

        try {
          await _firebaseRepository.storeUserProfile(userProfile);
        } catch (e) {
          // Handle any errors that occur while storing the user profile
          print("Error storing user profile: $e");
        }

        return Right(userModel);
      },
    );
  }

  Future<Either<String, String?>> getCurrentUser() async {
    final result = await _dataSource.getCurrentUserId();
    return result.fold(
          (errorMessage) => Left(errorMessage.errorMessage),
          (userId) => Right(userId), // Convert to UserModel
    );
  }

  @override
  Future<void> signOut() async {
    await _dataSource.signOut();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await _dataSource.isUserLoggedIn();
  }
}


