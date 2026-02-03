class Question {
  final int id;
  final String name;
  final String teacherAnswer;
  final String student_answer;
  final String type_ques;
  final String studentAnswerExam;
  final List<String> chooses;
  final bool solved;

  Question({
    required this.id,
    required this.name,
    required this.studentAnswerExam,
    required this.teacherAnswer,
    required this.chooses,
    required this.type_ques,
    required this.student_answer,
    required this.solved,

  });

  factory Question.fromJson(Map<String, dynamic> json) {
    // print('json${json['questions']}');
    return Question(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      studentAnswerExam: json['studentAnswerExam'] ?? '',
      student_answer: json['student_answer'] ?? '',
      type_ques: json['type_ques'] ?? '',
      solved: json['solved'] ?? false,
      teacherAnswer: json['teacher_answer'] ?? '',
      chooses: (json['chooses'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}
