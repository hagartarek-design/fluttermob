import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';

import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/schedule_center.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';








class SchedualCenter2 extends StatelessWidget {
 
   var selectedSection = Rx<String?>(null);


   SchedualCenter2({super.key
   });
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;

int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 




  @override
  Widget build(BuildContext context) {
          
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);
HomeController controller=HomeController();
var g=controller.course_info.map((e)=>e.section?.length);
  void scrollToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

    return Scaffold(
      appBar:isMobile? 
      
      
       AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 6, 70, 152),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
       InkWell( onTap: (){
        showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );






       

       }, child:  Icon(Icons.menu, color:Colors.white ,))   
,
              
              Row(
                children: [
              Image.asset('assets/Group87935.png', width: 55),
                ],
              ),
            ],
          ),
        )
      


































   

   
      
      :AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 85,
        backgroundColor: const Color.fromARGB(255, 6, 69, 152),
        title: Center(
          child: Container(
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          
                          
                        ),
                      ),
                    Image.asset('icons/Vector_3.png',width: 40,height: 41,),
                    Image.asset('icons/Vector_2.png',width: 39.02,height: 40,)
                    
                    
                    
                  ],
                ),
                if (!isMobile)
                  Row(
                    children: [
                      _navText('تواصل معنا'),
                      _navText('عن أشطر'),
                      _navText('مصادري'),
                      _navText('كورساتى'),
                      _navText('مدرسينا'),
                      _navText('ذاكر'),
                      _navText('الرئيسية', highlight: true),
                      const SizedBox(width: 12),
                      Image.asset('assets/Group87935.png', width: 55),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      body:
      
      GetBuilder( init:HomeController() ,builder: (controller){

          
          
          
        
    return  LayoutBuilder(
      
        builder: (  BuildContext context, BoxConstraints constraints,) {






    double cardWidth = 160;
    
int totalSectionsLength = controller.course_info
    .where((e) => e.section != null)  
    .fold(0, (sum, e) => sum + (e.section?.length ?? 0));
    int cardsPerRow = (constraints.maxWidth / cardWidth).floor();
          return  SingleChildScrollView(
        child: 
        Column(
          children: [

            
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 242, 195, 42),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 6, 69, 152),
                      fontSize: isMobile ? 14 : 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 20,),
          Container(width: isMobile?375: 1121, child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [  
              _buildTeacherInfo(isMobile,screenWidth,context),
            Container(
              width: isMobile?375: 1121,
    
            
            
            
            
            
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, children: [
Container(
  width:isMobile?375: 1121,
  child: Wrap(alignment: WrapAlignment.center,
    runAlignment: WrapAlignment.center,
    children: [
      Text(
        'محتاجين البيانات دي لحجز السنتر',
        style: TextStyle(
          color: Color.fromARGB(255, 6, 69, 152),
          fontWeight:isMobile?FontWeight.w500: FontWeight.w600,
          fontSize: 32,
        ),
      ),
      
Container(
  width: isMobile ? 375 : 1121,
  alignment: Alignment.center,
  child: Wrap(
    alignment: WrapAlignment.center,
    spacing: isMobile ? 12 : 24, 
    runSpacing: isMobile ? 12 : 24, 
    children: [
      
      InkWell(
        onTap: () {
          selectedSection.value =
              selectedSection.value == '2' ? null : '2';
          selected3.value = !selected3.value;
        },
        child: buildCard(
          imagePath: 'assets/Frame1597883113.png',
          text: 'تاكيد التسجيل',
          isMobile: isMobile,
        ),
      ),

      
      InkWell(
        onTap: () {
          selectedSection.value =
              selectedSection.value == 'study' ? null : 'study';
          selected2.value = !selected2.value;
        },
        child: buildCard(
          imagePath: 'assets/Frame1597883116.png',
          text: 'معلومات عن السنتر',
          isMobile: isMobile,
        ),
      ),

      
      InkWell(
        onTap: () {
          selectedSection.value =
              selectedSection.value == 'center' ? null : 'center';
          selected.value = !selected.value;
        },
        child: buildCard(
          imagePath: 'assets/Frame1597883114.png',
          text: 'معلومات دراسية',
          isMobile: isMobile,
        ),
      ),

      
      InkWell(
        onTap: () {
          selectedSection.value =
              selectedSection.value == 'personal' ? null : 'personal';
        },
        child: buildCard(
          imagePath: 'assets/Frame1597883100.png',
          text: 'معلومات شخصيه',
          isMobile: isMobile,
        ),
      ),
    ],
  ),
),  ],
  ),
)




,Obx( (){ switch (selectedSection.value) {
case 'personal':
return
  
Container( width: 1121,child:Column(children: [
 Wrap( spacing: 16,alignment: WrapAlignment.start, children: [
              Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
    Text('رقم التليفون',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 154, 175, 228), width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          
                child: IntlPhoneField(
          
          
          
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
                return TextField(controller: controller.PhoneNum,
                  decoration: InputDecoration(
                    hintText: 'رقم التليفون',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
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
],

) )
                    
   ,    
Container( width: 552,child:  Column(  crossAxisAlignment: CrossAxisAlignment.start,  spacing: 16, children: [
  Text('الاسم بالكامل رباعي',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      controller: controller.fullName,
      decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل الاسم رباعي',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))

],
)
,
            Wrap( spacing: 16, children: [
Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
    Text('ادخل رقم تليفون الاب',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
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
                return TextField(controller: controller.father_phone,
                  decoration: InputDecoration(
                    hintText: '0126565484545',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
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

],

) )
,Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
    Text('رقم تليفون الام',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 154, 175, 228), width: 1),
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
               controller: controller.mother_phone,   decoration: InputDecoration(
                    hintText: '0126565484545',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
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
],

) )
                    
                  
                  
                  ],) ,
       
           Wrap( spacing: 16, children: [

              Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
  Text('رابط الفيسبوك',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      
      controller: controller.facebooklink,
      decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل رابط الفيسبوك',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],)),    Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
  Text('البريد الالكتروني',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      controller: controller.fullName,
      decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل الاسم رباعي',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),),

],)),SizedBox(height:8)
        ,Container(
          width: 173,height: 44,
          child: TextButton(onPressed: (){
        
          selectedSection.value =
              selectedSection.value == '2' ? null : '2';
          selected3.value = !selected3.value;
  
          }, 
        style:TextButton.styleFrom(backgroundColor:Color.fromARGB(255, 6, 69, 152)
       , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        child: Text('الخطوة التاليه',style: TextStyle(color: Colors.white),)) ,)
     
         ],)     
   
],) ,);
 
case '2':
return
  
      Container(width: 1073,      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
 children: [ 
          SizedBox(height: 24,),
          Container(child:  
          Text('تاكيد تسجيل السنتر',
          style: TextStyle(color: Color.fromARGB(255, 61, 84, 110),fontWeight: FontWeight.w600,fontSize: 30), )
          ,
        
        
        ),SizedBox(height: 24,),
        Container( child: Column(        children: [
       Wrap(
        alignment: WrapAlignment.start,
        children: [ Container(child: Text('المعلومات الشخصية',style: TextStyle(
            fontSize:24,fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 6, 69, 152)),
            textAlign: TextAlign.start,
            )

,), ],) ,
Wrap( spacing: 74,alignment: WrapAlignment.start, children: [

Container(width: 259, child:Column(
crossAxisAlignment: CrossAxisAlignment.start
, children: [


  Text('رقم التليفونك : ${controller.PhoneNum.text}',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,SizedBox(height: 12,),
  Text('رقم تليفون الاب : ${controller.father_phone.text}',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
   ,SizedBox(height: 12,)
    , Text('رابط الفيسبوك : ${controller.facebooklink.text}',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)

],) ,)

,        
Container(width: 298, child:Column(
crossAxisAlignment:CrossAxisAlignment.start,
 children: [


  Text('الاسم بالكامل رباعي : ${controller.fullName.text}'
  ,textAlign: TextAlign.start,style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,SizedBox(height: 12,),
  Text('رقم تليفون الام : ${controller.mother_phone.text}',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
 ,SizedBox(height: 12,)   , Text('البريد الاليكتروني  : ${controller.email.text}',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,     Container(
                    width: 173,height: 44,
                    child:  TextButton(onPressed: ()async{
                 await     controller.addanswer(context);

}, child: Text('الخطوه التاليه',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 255, 255, 255)),),style:TextButton.styleFrom(

shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)

))
                       )
],) ,)

        
],),


SizedBox(height: 24,),   Column(crossAxisAlignment: CrossAxisAlignment.center,  children: [ Container(

  width: 311,decoration: BoxDecoration
(border: Border.all(width: 2,color: Color.fromARGB(255, 80, 124, 131))),)     
        ],),
           SizedBox(height: 24,)
,   
        Container(width: 632,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(child: Text('المعلومات الدراسيه ',style: TextStyle(
            fontSize:24,fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 6, 69, 152)),
            
            )

,), SizedBox(height: 12,),],)
        ,
Wrap( spacing: 74,alignment: WrapAlignment.start, children: [

Container( width: 259, child:Column(spacing: 24,
crossAxisAlignment: CrossAxisAlignment.start
, children: [


  Text('الشعبه العلميه :${ controller. subjects.value }',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,
 
],) ,)

,        
Container(width: 298, child:Column(
crossAxisAlignment:CrossAxisAlignment.start,
 children: [


  Text('الصف الدراسي :${controller. semester.value}'
  ,textAlign: TextAlign.start,style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,SizedBox(height: 12,)
,  Text('المدرسه :${controller.schools.value}',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
   

],) ,)

        
],),


SizedBox(height: 24,),    
       
          ])
        ),
            Column( crossAxisAlignment: CrossAxisAlignment.center, 
 children: [ Container(

  width: 311,decoration: BoxDecoration
(border: Border.all(width: 2,color: Color.fromARGB(255, 80, 124, 131))),)     
  ,SizedBox(height: 24,)      ],),
           
        Container(width: 632,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container( child: Text('معلومات عن السنتر',style: TextStyle(
            fontSize:24,fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 6, 69, 152)),
            
            )

,), SizedBox(height: 12,),],)
        ,
Wrap( spacing: 74,alignment: WrapAlignment.start, children: [

Container( width: 259, child:Column(spacing: 24,
crossAxisAlignment: CrossAxisAlignment.start
, children: [


  Text('ميعاد الدرس :الاتنين من 6 الي 8',style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,
 
],) ,)

,        
Container(width: 298, child:Column(
crossAxisAlignment:CrossAxisAlignment.start,
 children: [


  Text('السنتر :${controller. center.value} '
  ,textAlign: TextAlign.start,style: 
  TextStyle(color:Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 16,fontWeight: FontWeight.w400),)
,
  
  
  
   

],) ,)

        
],),


SizedBox(height: 24,),    
            Container( width:370 ,height:44 , child:Row(
                        spacing:isMobile?8: 24,mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                   Container(
                    width: 173,height: 44,
                    child: TextButton(onPressed: (){}, child:
                         Text('الرجوع',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w500,
color: Color.fromARGB(255, 6, 69, 152)),),style:TextButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
side: BorderSide(width: 1,color:  Color.fromARGB(255, 6, 69, 152)))),
  
) ,)  ,  
                        Container(
                    width: 173,height: 44,
                    child:  TextButton(onPressed: ()async{
                 await     controller.addanswer(context);

}, child: Text('الخطوه التاليه',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 255, 255, 255)),),style:TextButton.styleFrom(

shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)

))
                       ) ],) ,

        ),  ])
        ),
           
           
             SizedBox(height: 24,),
           
                
          ],),)]));

case 'center':
return Container(
  width: 1073,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'معلومات عن السنتر',
        style: TextStyle(
          color: Color.fromARGB(255, 6, 69, 152),
          fontSize: 24,
          fontWeight: FontWeight.w500
        ),
      ),
      Wrap(
        alignment: WrapAlignment.start,
        spacing: 20,
        children: [
          _buildDropdownField(
            'الصف الدراسي',
            'ادخل الصف الدراسي',
            controller.semester,
            ['الصف الأول', 'الصف الثاني', 'الصف الثالث'],
            (newValue) {
              controller.semester.value = newValue;
              print('semester: ${controller.semester.value}');
            }
          ),
          _buildDropdownField(
            'الشعبه العلميه',
            'ادخل الشعبه العلميه',
            controller.subjects,
            ['لغة عربية', 'رياضة', 'علوم', 'فزياء'],
            (newValue) {
              controller.subjects.value = newValue;
              print('subjects: ${controller.subjects.value}');
            }
          ),
        ],
      ),
      const SizedBox(height: 16),
      Wrap(
        spacing: 20,
        alignment: WrapAlignment.start,
        children: [
          _buildDropdownField(
            'المدرسة',
            'ادخل المدرسة',
            controller.schools,
            ['school2', 'school1'],
            (newValue) {
              controller.schools.value = newValue;
              print('schools: ${controller.schools.value}');
            }
          ),
          Container(width: 505), 
        ],
      ) 
      
       ,Container(
          width: 173,height: 44,
          child: TextButton(onPressed: (){
        

          selectedSection.value =
              selectedSection.value == 'center' ? null : 'center';
          selected.value = !selected.value;
        
        
          }, 
        style:TextButton.styleFrom(backgroundColor:Color.fromARGB(255, 6, 69, 152)
       , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        child: Text('الخطوة التاليه',style: TextStyle(color: Colors.white),)) ,)
     
        
    ],
  ),
);
case 'study':
return Container(
  width: 1073,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'معلومات دراسية',
        style: TextStyle(
          color: Color.fromARGB(255, 6, 69, 152),
          fontSize: 24,
          fontWeight: FontWeight.w500
        ),
      ),
      Wrap(
        alignment: WrapAlignment.start,
        spacing: 20,
        children: [
          _buildDropdownField(
            'ميعاد الدرس',
            'ادخل ميعاد الدرس',
            controller.timeofsession,
            ['1الاتنين من 6 الي ', '7الاتنين من5 الي ', 'الاتنين من 6 الي8'],
            (newValue) {
              controller.timeofsession.value = newValue;
              print('timeofsession: ${controller.timeofsession.value}');
            }
          ),
          _buildDropdownField(
            'السنتر',
            'ادخل السنتر',
            controller.center,
            ['Center3', 'Center2', 'Center1'],
            (newValue) {
              controller.center.value = newValue;
              print('center: ${controller.center.value}');
            }
          ),
        ],
      ),
      const SizedBox(height: 16),
      Wrap(
        spacing: 20,
        alignment: WrapAlignment.start,
        children: [
          _buildDropdownField(
            'السنة',
            'ادخل السنة',
            controller.year,
            ['2025', '2026', '2027'],
            (newValue) {
              controller.year.value = newValue;
              print('year: ${controller.year.value}');
            }
          ),
          Container(width: 505), 
        ],
      ),
        Container(
                    width: 173,height: 44,
                    child:  TextButton(onPressed: ()async{
           
          selectedSection.value =
              selectedSection.value == 'study' ? null : 'study';
          selected2.value = !selected2.value;
        

}, child: Text('الخطوه التاليه',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 255, 255, 255)),),style:TextButton.styleFrom(

shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)

))
                       )

    

    ],
  ),
);      case 'confirm':
return
   Container( width: 1073,child:  Column(  crossAxisAlignment: CrossAxisAlignment.start,  children:[

Text('معلومات عن السنتر',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 24,fontWeight: FontWeight.w500
) ,


)
,
  Wrap(alignment: WrapAlignment.start,
    spacing: 20,
    children: [

    Container(
  width: 505,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 16,
    children: [
      Text(
        'الصف الدراسي',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 6, 69, 152),
        ),
      ),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  
    ],
  ),
),Container(
  width: 505,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 16,
    children: [
      Text(
        'الشعبه العلميه',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 6, 69, 152),
        ),
      ),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  
    ],
  ),
),
  ],) ]));
       


default:return
Container( width: 1121,child:Column(children: [
 Wrap( spacing: 16,alignment: WrapAlignment.start, children: [
              Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
    Text('رقم التليفون',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 154, 175, 228), width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          
                child: IntlPhoneField(
          
          
          
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
                return TextField(controller:controller.PhoneNum,
                  decoration: InputDecoration(
                    hintText: 'رقم التليفون',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
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
],

) )
                    
   ,    
Container( width: 552,child:  Column(  crossAxisAlignment: CrossAxisAlignment.start,  spacing: 16, children: [
  Text('الاسم بالكامل رباعي',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      
      controller: controller.fullName,
      decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل الاسم رباعي',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))

],
)
,
            Wrap( spacing: 16, children: [
Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
    Text('ادخل رقم تليفون الاب',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
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
                return TextField(controller: controller.father_phone,
                  decoration: InputDecoration(
                    hintText: '0126565484545',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
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

],

) )
,Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
    Text('رقم تليفون الام',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: Container(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 154, 175, 228), width: 1),
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
               controller: controller.mother_phone,   decoration: InputDecoration(
                    hintText: '0126565484545',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
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
],

) )
                    
                  
                  
                  ],) ,
       
           Wrap( spacing: 16, children: [

              Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
  Text('رابط الفيسبوك',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      
      controller: controller.facebooklink,
      decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل رابط الفيسبوك',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],)),    Container( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 16, children: [
  Text('البريد الالكتروني',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      controller: controller.fullName,
      decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل الاسم رباعي',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
         ],)    ,SizedBox(height: 8,), 
        Container(
                    width: 173,height: 44,
                    child:  TextButton(onPressed: ()async{
                 await     controller.addanswer(context);

}, child: Text('الخطوه التاليه',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 255, 255, 255)),),style:TextButton.styleFrom(

shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)

))
                       )
],) ,);
 
          }
          
          return Container();
          })])
       
            
            

     
                    ),    
                  
        SizedBox(height: 24,)
        ])),

         
            _buildFooter(context),
            const SizedBox(height: 10),
            const Text(
              'Copyright © 2023 Ashtar App | Terms of Use | Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
    ]));
    });}));
  }
  Widget _buildAppBarButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: textColor),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      child: Text(label),
    );
  }
 
   
  Widget _buildButton(String text, {bool isPrimary = false}) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:
              isPrimary ? Colors.white : Colors.transparent,
          side: isPrimary
              ? null
              : const BorderSide(color: Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isPrimary ? const Color.fromARGB(255, 6, 69, 152) : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _navText(String text, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: highlight
              ? const Color.fromARGB(255, 242, 195, 42)
              : const Color.fromARGB(255, 181, 181, 181),
        ),
      ),
    );
  }

  Widget _buildClassCard(String title, String imagePath,context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Column(children: [ 
      Container(
      width: 363,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 180,width:screenWidth,
            padding: const EdgeInsets.all(8),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
         
        ],
      ),
    )
    , Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
    ],); 
   
  }

  Widget _buildTeacherInfo(bool isMobile,screenWidth,context) {
    return Container(
width: !isMobile?1280:screenWidth,     
      child: Wrap(spacing: 1,
      alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.start,
        children: [
           InkWell(child:  Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),) , onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Homeafterlogin();
          }));
        },)
      
        
        
        ,  Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
   InkWell(
    onTap: (){Navigator .push(context,MaterialPageRoute(builder: (context){
  return Subjecttype();
}));},
    child:Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),), ),   
         Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
            
            InkWell(
              
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context){
          return Subjectbooks();
        }));},
              child:  Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 181, 181, 181),
        ),) ,)
               ,
         Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      InkWell(child:   Text('الحق احجز السنتر  ',style: TextStyle( fontWeight: FontWeight.w400
      ,   color: Color.fromARGB(255, 181, 181, 181)),
          )
          ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return schedule_center();}));},
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          ),
          Text('محتاجين البيانات دي لحجز السنتر',style: TextStyle( fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 6, 69, 152)),
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          ),
         
        
        
        
       
        
        ]
      ),
    );
  }
Widget buildCard({
  required String imagePath,
  required String text,
  required bool isMobile,
}) {
  return Container(
    width: isMobile ? 155 : 188, 
    height: isMobile ? 120 : 151,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Color.fromARGB(255, 154, 175, 228),
      ),
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: isMobile ? 48 : 78,
          height: isMobile ? 48 : 78,
        ),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 6, 69, 152),
            fontSize: isMobile ? 14 : 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooter(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(

    width: double.infinity,
    color: const Color.fromARGB(255, 6, 69, 152),
    
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

           Container(
                      padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child:    Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 24,
              spacing: 24,
              children: [
                
                SizedBox(
                  width: screenWidth < 600 ? double.infinity : 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تواصل معنا',
                        style: TextStyle(
                          color: Color.fromARGB(255, 242, 195, 42),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow('icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _icon('icons/Frame_14.png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame_13.png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame_12.png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame_11.png'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'حمل التطبيق الان',
                        style: TextStyle(
                          color: Color.fromARGB(255, 242, 195, 42),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                alignment: WrapAlignment.start,        children: [
                          _storeButton('icons/Frame_16.png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('icons/Frame_15.png', 'App Store'),
                        ],
                      )
                    ],
                  ),
                ),

                
                SizedBox(
                  width: screenWidth < 600 ? double.infinity : 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child:   Wrap(
                        
                        alignment: WrapAlignment.start,
                        spacing: 24,
                        children: [
                          
                          _navItem('عن أشطر'),
                          _navItem('مصادري'),
                          _navItem('كورساتى'),
                          _navItem('مدرسينا'),
                          _navItem('ذاكر'),
                          _navItem('الرئيسية',
                              color: Color.fromARGB(255, 242, 195, 42),
                              fontSize: 24),
                        ],
                      ),),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/Group87935.png',
                          width: 80,
                          height: 65.7,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'عن أشطر',
                        style: TextStyle(
                          color: Color.fromARGB(255, 242, 195, 42),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'أشطر معتمدة من كوجنيا واحدة من أكبر المؤسسات التعليمية الدولية فى العالم! أشطر منصة تعليم رقمي قائمة على المناهج الدراسية لطلاب المدارس وبتوفر تجربة تعليمية مخصصة لكل طالب وبتوفرلهم طريقة التعليم المناسبة ليهم',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),)
          ],
        ),
      ),
    ),
  );
}

Widget _buildInfoRow(String iconPath, String text) {
  return Wrap(
    alignment: WrapAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.right,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Image.asset(iconPath, width: 24, height: 24),
    ],
  );
}

Widget _icon(String path) {
  return Image.asset(path, width: 24, height: 24);
}
 Widget menuButton(BuildContext context, String label, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: textColor),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  
  
  
  
  
  }

class _MenuItem extends StatelessWidget {
  final String title;
  final bool isActive;
  const _MenuItem({required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
Widget _storeButton(String iconPath, String label) {
  return Container(
    width: 160,
    height: 60,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Wrap(
      children: [
        Image.asset(iconPath, width: 40, height: 40),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Get it on", style: TextStyle(fontWeight: FontWeight.w600)),
            Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    ),
  );
}

Widget _navItem(String title,
    {Color color = const Color.fromARGB(255, 181, 181, 181),
    double fontSize = 20}) {
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    ),
  );
}


Widget _buildDropdownField(
  String label,
  String hint,
  Rx<String?> value,
  List<String> items,
  Function(String?) onChanged
) {
  return Container(
    width: 505,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 6, 69, 152),
          ),
        ),
        const SizedBox(height: 16),
        Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String>(
            value: value.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 154, 175, 228),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 154, 175, 228),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            isExpanded: true,
            items: [
              
              DropdownMenuItem<String>(
                value: null,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    hint,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              
              ...items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    ),
  );
}
