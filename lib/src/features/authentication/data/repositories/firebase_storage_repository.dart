import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/quesiton_model.dart';
import '../models/user_profile_model.dart';

class FirestoreRepositoryImplementation {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserProfile(UserProfileModel userProfile) async {
    try {
      await _firestore.collection('user_profiles').doc(userProfile.uid).set(userProfile.toJson());
    } catch (e) {
      // Handle errors here, you can log or throw an exception
      print("User profile creation failed: $e");
      throw e;
    }
  }
  Future<UserProfileModel?> fetchUserProfileById(String uid) async {
    try {
      final documentSnapshot = await _firestore.collection('user_profiles').doc(uid).get();

      if (documentSnapshot.exists) {
        final userData = documentSnapshot.data() as Map<String, dynamic>;
        return UserProfileModel.fromJson(userData);
      } else {
        return null; // User profile not found
      }
    } catch (e) {
      // Handle errors here, you can log or throw an exception
      print("Error fetching user profile: $e");
      throw e;
    }
  }
  Future<void> updateProfileIncrementally(String uid, Map<String, dynamic> updatedFields) async {
    try {
      final userProfileRef = _firestore.collection('user_profiles').doc(uid);

      final userProfileSnapshot = await userProfileRef.get();
      if (userProfileSnapshot.exists) {
        final userProfileData = userProfileSnapshot.data() as Map<String, dynamic>;

        // Merge the existing data with the updated fields
        final mergedData = {...userProfileData, ...updatedFields};

        // Update the document with the merged data
        await userProfileRef.update(mergedData);
      }
    } catch (e) {
      // Handle errors here, you can log or throw an exception
      print("User profile update failed: $e");
      throw e;
    }
  }

  Stream<List<QuestionModel>> fetchQuestions() {
    final collectionReference = _firestore.collection('questions');

    return collectionReference.snapshots().map((querySnapshot) {
      final List<QuestionModel> questions = [];

      querySnapshot.docs.forEach((document) {
        final data = document.data();
        final questionModel = QuestionModel.fromMap(data);
        questions.add(questionModel);
      });

      return questions;
    });
  }

}
