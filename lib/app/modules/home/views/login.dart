import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/forgetpasswordforashtar.dart';

class Login extends StatelessWidget {
   Login({super.key});
   
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Container(

            color: const Color.fromARGB(255, 245, 245, 245),
            child:
            
            SingleChildScrollView(child: 
             Stack(
              children: [
                Container( height: 352,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(115, 21, 112, 239),
                        Color.fromARGB(255, 245, 245, 245),
                      ],
                    
                    ),
                  ),
               )
               ,
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

   Container(
  
  child:Image.asset('assets/login2.png',width: 575,height: 468,)
)
,
Container(
  
  
  child: 
Container(width: 617,
padding: EdgeInsets.fromLTRB(80, 85, 80, 52),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Image.asset('assets/ashtar.png',width: 106,height:106 ,)
,SizedBox(width: 457,
child:Column(crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 32,
  children: [
SizedBox(width: 457,child: Column(spacing: 16,
crossAxisAlignment: CrossAxisAlignment.end,children: [
  Text('تسجل دخول لحسابك',style: TextStyle(
    fontSize: 32,fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 6, 69, 152)),)
 ,SizedBox(width: 457,
 child: Column(spacing: 24, children: [
SizedBox(width: 457,

child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
Text('رقم التليفون',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
,fontSize: 16,fontWeight: FontWeight.w500

),)

,Directionality(
  textDirection: TextDirection.rtl,
  child: SizedBox(
    width: 457,height: 44,
    child: Row(
      spacing: 8,
      children: [
        Container(
          width: 76,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(
            color: Color.fromARGB(255, 154, 175, 228), 
            width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          
       child: IntlPhoneField(
          dropdownIcon:
          Icon(
             Icons.keyboard_arrow_down,size: 16,),
  disableLengthCheck: true,

  
  dropdownIconPosition: IconPosition.leading, 
  
  decoration: const InputDecoration(
    counter: SizedBox.shrink(),
    border: InputBorder.none,
    counterText: "",
    contentPadding: EdgeInsets.zero,
    isDense: true,

  ),
   dropdownTextStyle:
    TextStyle(
    fontSize: 0.0001, 
    height: 0.0001,
    color: Colors.transparent,
  ),
  
  initialCountryCode: 'EG',
  languageCode: "ar",
  obscureText: false,
  showDropdownIcon: true,
  
  
  style:
   const TextStyle(
    fontSize: 0.0001,
    color: Colors.transparent, 
    height: 0.0001, 
  ),
  onChanged: (phone) {
    
  },
  onCountryChanged: (country) {
    _maxLengthNotifier.value = country.maxLength;
  },
),
  ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 44,
            child: ValueListenableBuilder<int?>(
              valueListenable: _maxLengthNotifier,
              builder: (context, maxLength, _) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: 'ادخل رقم الهاتف',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: "",
                  ),
                  style: const TextStyle(fontSize: 16),
                  keyboardType: TextInputType.phone,
                  maxLength: maxLength,
                );
              },
            ),
          ),
        ),
      ],
    ),
  ))


],),),

Container(

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text('كلمة المرور',style: TextStyle(color: Color.fromARGB(255, 78, 78, 78)
,fontSize: 16,fontWeight: FontWeight.w500),)
,
TextField(
 textDirection: TextDirection.rtl, decoration: InputDecoration(
    
    filled: true,
    fillColor: Colors.white, 

    hintText: '****************',
    hintTextDirection: TextDirection.rtl,
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 80, 124, 181),
    ),

    prefixIcon: Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 80, 124, 181),
    ),

    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 124, 181),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 124, 181),
        width: 1,
      ),
    ),
  ),
)
,
InkWell(
  
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>Forgetpasswordforashtar()));
  },
  child: Text('نسيت كلمة المرور؟',style: TextStyle(color:Color.fromARGB(255, 6, 69, 152) 
  ,fontWeight:FontWeight.w500 ,fontSize: 16
  
   ),) ,)
 
  ],),
),
Container(

  child: 
SizedBox(width: 457,child: Column(
  spacing: 24,
  children: [
    SizedBox(width: 457,height: 44,child: 
  TextButton(onPressed:(){},style:TextButton.styleFrom(
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)
   ) , 
   child: Text(style:TextStyle(color:Colors.white ,fontWeight: FontWeight.w500,fontSize: 18)
    , 'تسجيل دخول')
   
   ,)
   
   ),


   SizedBox(
    width: 457,
    child: 
Column(children: [ 
SizedBox(
width: 457,  
child: 
Row(spacing: 16, children: [
 SizedBox(height: 44,width: 220.5, child:  TextButton(onPressed: (){},style: TextButton.styleFrom(
side: BorderSide(color: Color.fromARGB(255, 6, 69, 152),width: 1)
,shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(8))

  ),
  child:Row(
    spacing: 16,
    children: [ Image.asset('assets/facebookcircle.png',
  width: 24,height: 24.56,), Text('تسجيل دخول عبر'
 , style:TextStyle(color: Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 18,fontWeight: FontWeight.w500
 
 ))
  ]) ,
 ),),
 SizedBox(height: 44,width: 220.5, child:  TextButton(onPressed: (){},style: TextButton.styleFrom(
side: BorderSide(color: Color.fromARGB(255, 6, 69, 152),width: 1)
,shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(8))

  ),
  child:Row(
    spacing: 16,
    children: [ Image.asset('assets/Google2x_1.png',
  width: 24,height: 24.56,), Text('تسجيل دخول عبر'
 , style:TextStyle(color: Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 18,fontWeight: FontWeight.w500
 
 ))
  ]) ,
 ),),







 







 ],)
 )
  ])),]))
    
 )],),)
  ])
)]))],),)
             )],),])

  ,  ) 
));});

  }}

              
            
             