class QuestionModel {
  final int id;
  final int activ;
  final int category;
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String answer5;
  final int right;
  final int month;
  final int year;

  QuestionModel({
    required this.id,
    required this.activ,
    required this.category,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.answer5,
    required this.right,
    required this.month,
    required this.year,

  });

  List<String> get answers => [
    answer1,
    answer2,
    answer3,
    answer4,
    answer5,
  ];

  List<int> get correctAnswerIndices => right
      .toString()
      .split('')
      .map((ch) => int.parse(ch) - 1)
      .toList();

  bool isAnswerCorrect(int index) {
    return correctAnswerIndices.contains(index);
  }

  factory QuestionModel.fromResult(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] as int,
      activ: map['activ'] as int,
      category: map['category'] as int,
      question: map['question'] as String,
      answer1: map['answer1'] as String,
      answer2: map['answer2'] as String,
      answer3: map['answer3'] as String,
      answer4: map['answer4'] as String,
      answer5: map['answer5'] as String,
      right: map['right'] as int,
      month: map['month'] as int,
      year: map['year'] as int,
    );
  }
}
