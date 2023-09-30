import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/exceptions/error_message.dart';
import '../models/firebase_user_model.dart';


class FirebaseAuthenticationDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<Either<ErrorMessage, UserModel>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel(uid: userCredential.user?.uid,photo: userCredential.user?.photoURL, email: userCredential.user?.email, isEmailVerified: userCredential.user?.emailVerified );
      return Right(userModel);
    } catch (e) {
      final errorMessage = e.toString();
      return Left(ErrorMessage("Sign-in failed: $errorMessage"));
    }
  }

  // Sign up with email and password
  Future<Either<ErrorMessage, UserModel>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel(uid: userCredential.user?.uid,photo: userCredential.user?.photoURL, email: userCredential.user?.email, isEmailVerified: userCredential.user?.emailVerified );
      return Right(userModel);
    } catch (e) {
      final errorMessage = e.toString();
      return Left(ErrorMessage(errorMessage));
    }
  }
  Future<Either<ErrorMessage, String?>> getCurrentUserId() async {
    try {
      final user = _firebaseAuth.currentUser;
      final userId = user?.uid;
      if (userId != null) {
        return Right(userId);
      } else {
        return Left(ErrorMessage("User is not logged in."));
      }
    } catch (e) {
      final errorMessage = e.toString();
      return Left(ErrorMessage("Failed to get current user ID: $errorMessage"));
    }
  }
  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Check if a user is logged in
  Future<bool> isUserLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    return user != null;
  }
}
