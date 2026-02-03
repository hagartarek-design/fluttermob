
class Attachment {
  final int? id;
final String? cycle;
final  int? price;
final int ?amount;
final String? status;
final int? totalExamAssignment;
final bool ?isUsed;
  Attachment({
    this.id
    ,this.amount,
 this.price
    ,this.cycle
,this.isUsed
,this.status,this.totalExamAssignment
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
  
  print('json${json['status']}');
    return Attachment(

      id: json['id'] as int?,
      amount: json['amount'] as int?,
 price: json['price'] as int?,
 cycle: json['cycle'] as String?,
isUsed: json['isUsed'] as bool?,
 status: json['status'] as String?,
totalExamAssignment:json['totalExamAssignment'] as int?
    );
  }
}
