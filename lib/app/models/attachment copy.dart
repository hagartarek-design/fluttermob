
class Code {
  final int? id;
final String? rechargeCode;
final  String? createddate;

final String? updateddate;
final int?amount;
final int ?balance;
  Code({
    this.id
    ,
 this.createddate
    ,this.updateddate

,this.rechargeCode,
this.amount,this.balance

  });

  factory Code.fromJson(Map<String, dynamic> json) {
  
  print('json${json['status']}');
    return Code(

      id: json['id'] as int?,
 rechargeCode: json['rechargeCode'] as String?,
 createddate: json['createddate'] as String?,

 updateddate: json['updateddate'] as String?,
   amount: json['amount'] as int ?,
   balance:json['balance']as int? );
  }
}
