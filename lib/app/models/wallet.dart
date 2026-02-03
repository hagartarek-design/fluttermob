
class Course {
  final int? id;
final  String? path;final String? name;
final List?course_info;
final List?section;
final String? title;
final bool? isUsed;
final int? price;
final List?student_id;
  Course({
    this.id
    ,
  this.path
    ,this.name

,this.course_info,
this.section
,this.title,this.student_id
,this.isUsed,
this.price
  });

  factory Course.fromJson(Map<String, dynamic> json) {
  
  
    return Course(

      id: json['id'] as int?,
 path: json['path'] as String?,
 name: json['name'] as String?,
 course_info: json['course_info'] as List?,
 section: json['section'] as List?,
 title: json['title'] as String?,
 isUsed: json['isUsed'] as bool?,
 price: json['price'] as int?,
 student_id: ['student_id']as List?
    );
  }
}
