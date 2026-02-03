import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
// class Schedule el malazem extends StatefulWidget {
//   const Schedule el malazem({super.key,});

//   @override
//   State<Schedule el malazem> createState() => _Schedule el malazemState();
// }

// class _Schedule el malazemState extends State<Schedule el malazem> {
class Askteacher extends StatelessWidget {
 
   var selectedSection = Rx<String?>(null);
//  final String courseId;
//    final List<dynamic> courseInfos;
   Askteacher({super.key//,required this.courseId,required this.courseInfos
   });
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;
// final    selected=false;
final int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  @override
  Widget build(BuildContext context) {
          // print('eee${courseInfos}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, // ~1 / 4.5
initialPage: 1

);
HomeController controller=HomeController();
var g=controller.course_info.map((e)=>e.section?.length);
  void scrollToIndex(int index) {
    pageController.animateToPage(
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
            // width: screenWidth * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          // backgroundImage: NetworkImage('${controller.img}')==null
                          // ? NetworkImage('${controller.img2}'): NetworkImage('${controller.img}'),
                        ),
                      ),
                    Image.asset('icons/Vector_3.png',width: 40,height: 41,),
                    Image.asset('icons/Vector_2.png',width: 39.02,height: 40,)
                    // _buildButton('تسجيل دخول', isPrimary: true),
                    // const SizedBox(width: 12),
                    // _buildButton('انشاء حساب'),
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
      
      GetBuilder<HomeController>( //init:HomeController() ,
      builder: (controller){

          // final displayedInfos = controller.course_info.isNotEmpty 
          //     ? controller.course_info 
          //     : courseInfos;
        // print('somone${  controller.course_info.map((toElement)=>toElement.section?.length)}');
    return  LayoutBuilder(
      
        builder: (  BuildContext context, BoxConstraints constraints,) {
// HomeController controller=HomeController();
// print('rrrrrrrrr${controller}')

// controller.3(courseInfos.map((e)=>e['id']).toString());
//  print('wewewe${courseInfos!.map((e)=>e['course_info']?.map((e)=>e['id'])).toString()}');
// controller.fetchcourseinfoid(courseId);
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
          SizedBox(width: double.infinity,
           child:   Column( spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [  
              _buildTeacherInfo(isMobile,screenWidth),
            SizedBox(
              width: double.infinity,
    
            // Wrap(
            //   spacing: 16,
            //   runSpacing: 16,
            //   alignment: WrapAlignment.center,
            //   children: [
        child:SizedBox(width: 
1820,    child:Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
Container( width: 852,height: 1252,padding: EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),
// border: Border.all(width: )
)
,child:
Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [

  Text('الملف الشخصي',style: TextStyle(color:Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 36,fontWeight: FontWeight.w600
  ),
  
  
  ),
  Container(
    padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
     width: 772,child:Column(spacing: 24,crossAxisAlignment: CrossAxisAlignment.end,
  children: [

SizedBox(width: 629,child:Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [ 
  Text('الكود الخاص بك',style: TextStyle(color:Color.fromARGB(255, 6, 69, 152)
,  fontWeight: FontWeight.w500
  ,fontSize: 32
  )),])),
SizedBox(width: 629,child:Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [ 
Image.asset('assets/OIP1.png',width: 93.91,height: 90,)

],))

  ])
),SizedBox(height: 24,),
SizedBox(width: 772,

child: Column( crossAxisAlignment: CrossAxisAlignment.end,
children: [
Text('المعلومات الشخصية' ,style: TextStyle
(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600

),)
,SizedBox(width: 724,child:Column(spacing: 24,children: [
SizedBox(width: 724,
child: Row(mainAxisAlignment: MainAxisAlignment.end,
  spacing: 138,
  children: [
SizedBox(width: 259,//,height: 196,
child: Column(spacing: 24,
crossAxisAlignment: CrossAxisAlignment.end,
 children: [

  Text('الاسم المستخدم:${controller.profileData?['name']}',style: TextStyle(color: 
  Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)

,Text('البريد الاليكتروني:${controller.profileData?['email']}',
textAlign: TextAlign.end
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('الشعبه العلميه : ${controller.profileData?['coursetype']}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('رقم تليفون الاب : ${controller.profileData?['father_phone_num']}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('المدرسه :${controller.profileData?['stud_school']}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)

],),
),
SizedBox(width: 327,//,height: 196,
child: Column(spacing: 24,
crossAxisAlignment: CrossAxisAlignment.end,
 children: [

  Text('الاسم بالكامل رباعي : ${controller.profileData?['fullname']}',style: TextStyle(color: 
  Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)

,Text('رقم التليفون: ${controller.profileData?['phoneNum']}',
textAlign: TextAlign.end
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('الصف الدراسي :${controller .profileData?['semester']} ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('رقم تليفون الام : ${controller.profileData?['mother_phone_num']}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('المحافظه : ${controller.profileData?['branch']}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)

],),
)

],),

),
SizedBox(width: 394,height: 44,   child: 
TextButton(onPressed: (){},
style:TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)), child: Text('تعديل البيانات',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
,


)
//,SizedBox(height: 24,)
,SizedBox(width: 772,child: Container( child:  Column( 
  spacing: 24,crossAxisAlignment: CrossAxisAlignment.end,  children: [
    Container(child: Text('الصورة الشخصية',style: TextStyle(
      fontSize: 32,fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 6, 69, 152)),)
  ,),
SizedBox(width: 724,height: 130,child: Column(
  
  
  children: [
SizedBox(width: 676,
child:Row(
  spacing: 16,
  mainAxisAlignment: MainAxisAlignment.end
  ,
  children: [
// Container(width: 60,height: 60 ,child:  CircleAvatar(
  
//   backgroundImage: AssetImage('assets/p-image.jpg',),
  SizedBox(width: 513, child:Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('صورتك الشخصية',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontWeight:FontWeight.w500,fontSize: 24 
),)

,Text(textAlign: TextAlign.end,
  'الصورة الشخصية لازم تكون بصيغة jpg, jpeg, png و متكونش اكبر من 800px طول او عرض'
  ,style: TextStyle(color: Color.fromARGB(255, 80, 124, 181),
   fontWeight: 
   FontWeight.w400
  ,fontSize: 14
  ),
  )  ],) ,),
  SizedBox(
  width: 60,
  height: 60,
  child: ClipOval(
    child: Image.network(
      'http://localhost:3000${controller.profileData?['img']}',
      fit: BoxFit.cover, 
      width: 60,
      height: 60,
    ),
  // ),
// )
  ),
)


]))
,
SizedBox(width: 394,height: 44,   child: 
TextButton(onPressed: (){},
style:TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)), child: Text('تعديل البيانات',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
,

)
],),)
],),))






],) ,)


],),
)

,SizedBox(height: 24,)
,SizedBox(width: 772,

child: Column(spacing: 24, crossAxisAlignment: CrossAxisAlignment.end,
children: [
Text('العنوان' ,style: TextStyle
(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600

),)
,SizedBox(width: 724,child:Column(spacing: 24,children: [
SizedBox(width: 724,
child: Row(mainAxisAlignment: MainAxisAlignment.end,
  spacing: 138,
  children: [
SizedBox(width: 259,//,height: 196,
child: Column(spacing: 24,
crossAxisAlignment: CrossAxisAlignment.end,
 children: [

  Text('المنطقه السكانيه : مدينه نصر',style: TextStyle(color: 
  Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)

,Text('رقم العماره : 123',
textAlign: TextAlign.end
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('علامه مميزه : صيدليه مريم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)


],),
),
SizedBox(width: 327,//,height: 196,
child: Column(spacing: 24,
crossAxisAlignment: CrossAxisAlignment.end,
 children: [


Text('المحافظه : القاهره',
textAlign: TextAlign.end
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('رقم الشقه : 123',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)
,Text('رقم التليفون: 01234567890',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 16 ,fontWeight: FontWeight.w400
  
  ),)

],),
)

],),

),
SizedBox(width: 394,height: 44,   child: 
TextButton(onPressed: (){},
style:TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  backgroundColor: Color.fromARGB(255, 6, 69, 152)), child: Text('تعديل البيانات',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
,

)
// , Container( width: 772,child: Container( child:  Column( crossAxisAlignment: CrossAxisAlignment.end,  children: [
//     Container(child: Text('الصورة الشخصية',style: TextStyle(
//       fontSize: 32,fontWeight: FontWeight.w600,
//       color: Color.fromARGB(255, 6, 69, 152)),)
//   ,),
// Container(width: 724,height: 130,child: Column(
  
  
//   children: [
// Container(width: 676,
// child:Row(
  
//   mainAxisAlignment: MainAxisAlignment.end
//   ,
//   children: [
// // Container(width: 60,height: 60 ,child:  CircleAvatar(
  
// //   backgroundImage: AssetImage('assets/p-image.jpg',),
//   Container(width: 513, child:Column(spacing: 8,
//   crossAxisAlignment: CrossAxisAlignment.end,
//   children: [
// Text('صورتك الشخصية',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
// ,fontWeight:FontWeight.w500,fontSize: 24 
// ),)

// ,Text(textAlign: TextAlign.end,
//   'الصورة الشخصية لازم تكون بصيغة jpg, jpeg, png و متكونش اكبر من 800px طول او عرض'
//   ,style: TextStyle(color: Color.fromARGB(255, 80, 124, 181),
//    fontWeight: 
//    FontWeight.w400
//   ,fontSize: 14
//   ),
//   )  ],) ,),
//   Container(
//   width: 60,
//   height: 60,
//   child: ClipOval(
//     child: Image.asset(
//       'assets/p-image.jpg',
//       fit: BoxFit.cover, // This ensures the image covers the entire circle
//       width: 60,
//       height: 60,
//     ),
//   // ),
// // )
//   ),
// )


// ]))
// ,
// Container(width: 394,height: 44,   child: 
// TextButton(onPressed: (){}, child: Text('تعديل البيانات',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
// style:TextButton.styleFrom(
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//   backgroundColor: Color.fromARGB(255, 6, 69, 152)))
// ,

// )
// ],),)
// ],),))






],) ,)


],),
)

])
       
            
            // const SizedBox(height: 20),

     
                    ),    
       ]),
       SizedBox(width: 150,),
     RightSidebar()
       
       
       
       ])),  ),         
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
    return SizedBox(
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

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return SizedBox(
width: !isMobile?1280:screenWidth,     // padding: const EdgeInsets.all(16.0),
      child: Row(spacing: 1,
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         
        //  SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        //   ),
    
      //     Text('منافذ بيع الملازم',style: TextStyle( fontWeight: FontWeight.w400
      // ,  color: Color.fromARGB(255, 6, 69, 152)),
      //     ),
      //     SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      //     ),
      //     Text('الحق احجز ملازمك  ',style: TextStyle( fontWeight: FontWeight.w400
      // ,   color: Color.fromARGB(255, 181, 181, 181)),
      //     ),
      //     SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      //     )
      //   //   Text('مادة الفيزياء',style: TextStyle(color: Color.fromARGB(255, 181, 181, 181)),),
      //   // SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      //   //   ),Text('الصف الثالث الثانوي'),
      //    ,        Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      // ,  color: Color.fromARGB(255, 181, 181, 181),
      //   ),), Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      //   Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      // , color: Color.fromARGB(255, 181, 181, 181),
      //   ),),
      //     Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      //   Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      // , color: Color.fromARGB(255, 181, 181, 181),
      //   ),)
        
        ]
      ),
    );
  }

Widget _buildFooter(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(

    width: double.infinity,
    color: const Color.fromARGB(255, 6, 69, 152),
    // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
// SizedBox(height: 16,),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      _buildInfoRow('icons/sms (1).png', 'support@ashtar.app'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                      Row(
                mainAxisAlignment: MainAxisAlignment.end,        children: [
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child:   Wrap(
                        
                        alignment: WrapAlignment.end,
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
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
  const _MenuItem({required this.title, required this.isActive});

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
    child: Row(
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


