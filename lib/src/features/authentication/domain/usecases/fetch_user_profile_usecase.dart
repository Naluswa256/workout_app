import '../../data/models/user_profile_model.dart';
import '../../data/repositories/firebase_storage_repository.dart';

class FetchUserProfileUseCase {
  final FirestoreRepositoryImplementation firebaseStoreRepositoryImplementation;

  FetchUserProfileUseCase(this.firebaseStoreRepositoryImplementation);

  Future<UserProfileModel?> execute(String uid) async {
    return await firebaseStoreRepositoryImplementation.fetchUserProfileById(uid);
  }
}
