import 'package:workout_app/src/features/authentication/data/repositories/firebase_storage_repository.dart';

import '../../data/models/quesiton_model.dart';

class FetchQuestionsUseCase {
  final FirestoreRepositoryImplementation firebaseStoreRepositoryImplementation;

  FetchQuestionsUseCase(this.firebaseStoreRepositoryImplementation);

  Stream<List<QuestionModel>> execute() {
    return firebaseStoreRepositoryImplementation.fetchQuestions();
  }
}