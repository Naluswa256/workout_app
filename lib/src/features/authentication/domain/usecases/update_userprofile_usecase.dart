import 'package:flutter/material.dart';

import '../../data/repositories/firebase_storage_repository.dart';
import 'package:go_router/go_router.dart';
class UserProfileUseCases {
  final FirestoreRepositoryImplementation _firestoreRepo = FirestoreRepositoryImplementation();
  Future<void> updateAndNavigateToScreen({
    required BuildContext context,
    required String uid,
    required Map<String, dynamic> updatedFields,
    required String routePath,
  }) async {
    try {
      // Call the updateProfileIncrementally function to update the user profile
      await _firestoreRepo.updateProfileIncrementally(uid, updatedFields);

      // Navigate to the destination screen
      context.go(routePath);
    } catch (e) {
      // Handle errors here, you can show an error message or log the error
      print("Error updating user profile and navigating: $e");
    }
  }
}
