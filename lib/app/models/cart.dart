
class Cart {
  final int? id;
final Map?attachment;
final Map?section;
final Map?course;
  Cart({
    this.id
    ,this.attachment
    ,this.course,
    this.section

  });

  factory Cart.fromJson(Map<String, dynamic> json) {
  
  
    return Cart(

      id: json['id'] as int?,
attachment: json['attachment']as Map? ,
course: json['course']as Map? ,section: json['section']as Map?
);
  }
}
