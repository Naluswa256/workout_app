import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../src/features/authentication/data/models/quesiton_model.dart';
import '../src/features/authentication/data/repositories/firebase_storage_repository.dart';
import '../src/features/authentication/domain/usecases/fetch_question_usecase.dart';
import '../style/styling.dart';
import '../style/text.dart';
import '../widget/about_button.dart';
import 'app.dart';
import 'package:go_router/go_router.dart';


class QuestionScreen extends StatefulWidget {
  final String uid;
  QuestionScreen({required this.uid});
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Stream<List<QuestionModel>> _questions;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FetchQuestionsUseCase fetchQuestionsUseCase = FetchQuestionsUseCase(FirestoreRepositoryImplementation());
  @override
  void initState() {
    super.initState();
    _fetchQuestionsFromFirestore();
  }

  Stream<List<QuestionModel>>  _fetchQuestionsFromFirestore(){
     final questions = fetchQuestionsUseCase.execute();
      setState(() {
        _questions = questions;
      });

      return questions;

  }


  Future<void> _updateQuestion(QuestionModel question) async {
    try {
      await firestore
          .collection('questions')
          .doc(question.uid)
          .set({
        'isExpanded': question.isExpanded,
        'selectedAnswer': question.selectedAnswer,
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error updating question in Firestore: $e');
    }
  }

  Future<void> _refreshQuestions() async {
    setState(() {
      _questions = _fetchQuestionsFromFirestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.sColor.withOpacity(0.8),
      body: RefreshIndicator(
        onRefresh: _refreshQuestions,
        child: StreamBuilder<List<QuestionModel>>(
          stream: _questions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No questions available.');
            } else {
              final questions = snapshot.data!;
              return Column(
                children: [
                  const SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Tell us something about yourself',
                      style: AppTextStyle.headline32.copyWith(fontSize: 23),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];
                        return ExpansionPanelList(
                          elevation: 1,
                          expandedHeaderPadding: EdgeInsets.only(left: 16),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              question.isExpanded = !isExpanded;
                              _updateQuestion(question); // Update Firestore when expanded state changes
                            });
                          },
                          children: [
                            ExpansionPanel(
                              backgroundColor: AppColor.tColor,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text(
                                    question.question,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                              body: Column(
                                children: question.options.map((option) {
                                  return RadioListTile<String>(
                                    title: Text(option),
                                    value: option,
                                    groupValue: question.selectedAnswer,
                                    onChanged: (String? value) {
                                      setState(() {
                                        question.selectedAnswer = value ?? '';
                                        _updateQuestion(question); // Update Firestore when selection changes
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                              isExpanded: question.isExpanded,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right:16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AboutButton(
                            text: abody8,
                            onPress: () =>
                                context.go('/home/${widget.uid}')
                          ),
                          AboutButton(isColoredButton: true, text: abody7, onPress: () {
                                  context.go('/home/${widget.uid}');
                          })
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height:25),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}




