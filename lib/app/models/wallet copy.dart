
class student_Course {
  final int? id;
final  String? name;
final List?student_course;

  student_Course({
    this.id,
  this.name,this.student_course


  });

  factory student_Course.fromJson(Map<String, dynamic> json) {
  
  
    return student_Course(

      id: json['id'] as int?,
 name: json['name'] as String?
,
student_course:json['student_course']as List?
    );
  }
}
