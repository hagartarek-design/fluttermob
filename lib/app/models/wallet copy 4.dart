
class Exam {
  final int? id;
final  int? examprice;
final  String? exam_type;
final bool?online;
final int ?grade;
final String?startdate;
final String?seedate;
final List?questions;
  Exam({
    this.id
    ,
  this.examprice,
  this.exam_type,
   this.online,this.grade,this.seedate,this.startdate,this.questions
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
  
  
    return Exam(

      id: json['id'] as int?,
 examprice: json['examprice'] as int?,
 exam_type: json['exam_type'] as String?,
 online: json['online'] as bool?,
grade: json['grade'] as int?,
seedate: json['seedate'] as String?,
startdate: json['startdate'] as String?,
questions: json ['questions'] as List?    
    );
  }
}
