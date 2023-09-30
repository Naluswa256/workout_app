// lib/domain/repositories/authentication_repository.dart

import 'package:fpdart/fpdart.dart';
import '../../data/models/firebase_user_model.dart';
import "./exceptions/error_message.dart";
abstract class AuthenticationRepository {
  Future<Either<String, UserModel>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<String, UserModel>> signUpWithEmailAndPassword(
      String email, String password);

  Future<void> signOut();

  Future<bool> isUserLoggedIn();
}
