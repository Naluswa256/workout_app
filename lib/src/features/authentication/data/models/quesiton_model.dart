class QuestionModel {
  final String question;
  final List<String> options;
  bool isExpanded;
  String selectedAnswer;
  final String uid;
  QuestionModel({
    required this.question,
    required this.options,
    required this.isExpanded,
    required this.selectedAnswer,
    required this.uid
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      isExpanded: map['isExpanded'] ?? false,
      selectedAnswer: map['selectedAnswer'] ?? '',
      uid:map['uid'] ?? ''
    );
  }
}