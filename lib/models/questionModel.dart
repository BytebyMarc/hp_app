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
  final List<String> answers;
  final List<int> rightSequence;

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
    required this.answers,
    required this.rightSequence
  });

  factory QuestionModel.fromResult(map) {
    final List<String> answers = <String>[map['answer1'], map['answer2'], map['answer3'], map['answer4'], map['answer5']];
    List<int> digits = map['right']
        .toString()
        .split('')               // ["1", "2", "3", "4", "5"]
        .map((ch) => int.parse(ch))  // [1, 2, 3, 4, 5]
        .toList();

    return QuestionModel(
      id: map['id'] as int,
      activ: map['activ'] as int,
      category: map['category'] as int,
      question: map['question'] as String,
      answer1: map['answer1'] as String,
      answer2: map['answer2'] as String,
      answer3: map['answer3'] as String,
      answer4: map['answer4'] as String,
      answer5: map['answer5']as String,
      right: map['right'] as int,
      month: map['month'] as int,
      year: map['year'] as int,
      answers: answers,
      rightSequence: digits
    );
  }
}
