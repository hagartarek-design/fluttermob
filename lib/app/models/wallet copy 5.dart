
class Student {
  final int? id;
final String? name;
final List?Course;

  Student({
    this.id

    ,this.name,
this. Course,

  });

  factory Student.fromJson(Map<String, dynamic> json) {
  
  
    return Student(

      id: json['id'] as int?,
 name: json['name'] as String?,
 Course: json['Course'] as List?,

    );
  }
}
