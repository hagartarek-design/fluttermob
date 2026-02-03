import 'questions.dart';

class Lesson {
  final int id;
  final String name;
  final List<Question> questions;

  Lesson({
    required this.id,
    required this.name,
    required this.questions,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      questions: (json['questions'] as List<dynamic>? ?? [])
          .map((e) => Question.fromJson(e))
          .toList(),
    );
  }
}
