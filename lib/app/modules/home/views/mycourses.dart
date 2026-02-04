import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';

import 'wallet_cart.dart';
// class Schedule el malazem extends StatefulWidget {
//   const Schedule el malazem({super.key,});

//   @override
//   State<Schedule el malazem> createState() => _Schedule el malazemState();
// }
class myCourses extends StatefulWidget {
  const myCourses({super.key});

  @override
  State<myCourses> createState() => _walletState();
}

class _walletState extends State<myCourses> {

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// // class _Schedule el malazemState extends State<Schedule el malazem> {
// class myCourses extends StatelessWidget {
   var selectedSection = Rx<String?>(null);
//  final String courseId;
//    final List<dynamic> courseInfos;
  //  wallet({super.key//,required this.courseId,required this.courseInfos
  //  });
  
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;
// final    selected=false;
int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
var selectedMethod=''.obs;
  @override
  Widget build(BuildContext context) {
  // final screenWidth = MediaQuery.of(context).size.width;
  //   final isMobile = screenWidth < 600;
          // print('eee${courseInfos}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, // ~1 / 4.5
initialPage: 1

);  int currentIndex = 1;
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
              // Logo
       InkWell( onTap: (){
//  showDialog(
//       context: context,
//       barrierColor: Colors.transparent, 
//       builder: (context) => const Menuebarpaym
//       (),
//     );
       

       }, child:  Icon(Icons.menu, color:Colors.white ,))   
,
              // Buttons
              Row(
                children: [
              Image.asset('assets/Group87935.png', width: 55),
                ],
              ),
            ],
          ),
        )
      
// AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: const Color.fromARGB(255, 6, 70, 152),
//           elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Logo
//               Image.asset(
//                 'assets/logo.png',
//                 height: 40,
//               ),

//               // Buttons
//               Row(
//                 children: [
//                   _buildAppBarButton(
//                     label: 'تسجيل دخول',
//                     onPressed: () {},
//                     backgroundColor: Colors.white,
//                     textColor: const Color.fromARGB(255, 6, 70, 152),
//                   ),
//                   const SizedBox(width: 10),
//                   _buildAppBarButton(
//                     label: 'إنشاء حساب',
//                     onPressed: () {},
//                     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                     textColor: const Color.fromARGB(255, 6, 70, 152),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )
   

   
      
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
                    Container(
                        
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
      
      GetBuilder( init:HomeController() ,builder: (controller){

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
    // Sum all non-null section lengths
int totalSectionsLength = controller.course_info
    .where((e) => e.section != null)  // Filter out null sections
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
         SizedBox(height: 20,)   
, Container(width: 
1820,    child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              Column(crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container( width:!isMobile?852:screenWidth ,height: 1252,
                 padding: EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),
// border: Border.all(width: )
)
,child:
Wrap(alignment: WrapAlignment.end,
  // crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    
  Container(width:!isMobile ?246:343, height: 110,
  alignment: Alignment.centerRight,
  child:Text('كورساتي'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600,
)
 ,),
) 

,
  //    Container( width: 1120,
  //                             child: Container(
                              
  //                               decoration: BoxDecoration( 
  //                                  color: Color.fromARGB(255, 255, 255, 255),
  //                   boxShadow: [BoxShadow(
  //                 color: Colors.black.withOpacity(0.05), 
  //                 offset: Offset(0, 3), 
  //                 blurRadius: 13, 
  //                 spreadRadius: 0, 
  //               ),],         borderRadius: BorderRadius.circular(10),      border: Border.all(width: 1 ,
  //                                  color:Color.fromARGB(255, 245, 245, 245)
  //                                  ,
  //                                   )
  //                                  ),
  //                               padding: const EdgeInsets.fromLTRB(
  //                                   24, 13, 24, 13),
  //                               width: 1130,
  //                               height: 70,
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Container(
  //                                     width: 116,
  //                                     height: 44,
  //                                     child: ElevatedButton(
  //                                       style: ElevatedButton.styleFrom(
  //                                         shape: RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(8),
  //                                         ),
  //                                         padding: const EdgeInsets.fromLTRB(
  //                                             24, 10, 24, 10),
  //                                         backgroundColor: const Color.fromARGB(
  //                                             255, 6, 69, 152),
  //                                       ),
  //                                       onPressed: () {

  //  if (_currentPage > 1) {
  //       setState(() {
  //         _currentPage--;
  //       });
  //       controller.fetchCodes(page: _currentPage);
  //     }
  //                                       },
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.center,
  //                                         children: [
  //                                           Image.asset('assets/arrowleft.png',
  //                                               width: 9.53, height: 20),
  //                                           const SizedBox(width: 12),
  //                                           const Text(
  //                                             'التالي',
  //                                             style: TextStyle(
  //                                               fontWeight: FontWeight.w500,
  //                                               fontSize: 18,
  //                                               color: Color.fromARGB(
  //                                                   255, 255, 255, 255),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   const SizedBox(width: 20),
  //                                   _buildPagination(controller, currentIndex),
  //                                   const SizedBox(width: 20),
  //                                   Container(
  //                                     width: 116,
  //                                     height: 44,
  //                                     child: ElevatedButton(
  //                                       style: ElevatedButton.styleFrom(
  //                                         padding: const EdgeInsets.fromLTRB(
  //                                             24, 10, 24, 10),
  //                                         side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 6, 69, 152),
  //                                           width: 1,
  //                                         ),
  //                                         shape: RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(8),
  //                                         ),
  //                                       ),
  //                                       onPressed: () {
  //                                            if (_currentPage < 10) { // افترضنا أن هناك 10 صفحات كحد أقصى
  //       setState(() {
  //         _currentPage++;
  //       });
  //       controller.fetchCodes(page: _currentPage);
  //     }
  //                                       },
  //                                       child: const Text(
  //                                         'لاحق',
  //                                         style: TextStyle(
  //                                           color: Color.fromARGB(
  //                                               255, 61, 84, 110),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   )
  //                                 ],
  //                               ),
  //                             ),
  //                           ), 
     Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,children: [
   ...List.generate(controller.profile?['courses'].length,(index){
  var users= controller.profile?['courses'][index]['users'];
return     Stack(
   children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child:Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)
        
          ),
          child:Image.asset('assets/mlazm22x.png', width: 246,// height: 364
          
          ), ) 
      ),
      
      // Positioned(
      //   top: 1, right: 1, left: 1, bottom: 0,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(16),
      //       color: Color.fromARGB(1, 255, 255, 255),
      //     ),
      //   ),
      // ),
      
      Container(
        width: 246,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), 
            topRight: Radius.circular(16)
            
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          //  rgba(6, 70, 152, 1)
           Color.fromARGB(255, 6, 69, 152),
              Color.fromARGB(171, 118, 162, 212),
            ],
          ),
        ),
        child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),  
          width: 236, //height: 49,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              // Fix: Make sure you're accessing the correct indices
              Text( '${controller.profile?['courses'][index]['name']} \n ${controller.profile?['courses'][index]['grade']}', // Note: Using [0] for course_info and sectionIndex for section
              textAlign:  TextAlign.end,  style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Container(child: 
                  // Text(
                  //   textAlign: TextAlign.end,
                  //   'الثانوى',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 16,
                  //     color: Color.fromARGB(255, 255, 255, 255),
                  //   ),
                  // ),
                  // )
                ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [ 
                                      Text('امام سلامة',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),),
             Container(
  width: 30,
  height: 30,
  child: ClipOval(
    child: Image.network(
      '${users.map((e) => 'http://localhost:3000${e['image']}').join('\n')}',
      fit: BoxFit.cover, // This ensures the image covers the entire circle
      width: 30,
      height: 30,
    ),
  // ),
// )
  ),
)
                            
 // ),
// )
  

     ],)
     ],
          ),
        ),
      ),
      Positioned(
        top: 220, left: 24,
        child: Container(
          width: 198, height: 44,
          child: TextButton(
            style: TextButton.styleFrom(
          side: BorderSide(
        color:  Color.fromARGB(255, 6, 69, 152), // Border color
        width: 1.0,        // Border width
      ),backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // backgroundColor: Color.fromARGB(255, 6, 69, 152),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: ()async {
            // sectionIndex;
          // print('meme${controller.course_info.map((e)=>e.section?[sectionIndex]['id'].toString())}');
// await controller.fetchsectionid(
//   controller.course_info
//       .map((e) => e.section?[sectionIndex]['id'].toString())
//       .first ?? ''
// );

// final allCourseInfos = controller.section
//     .map((e) => e.section?.map((e) => e))
//     .where((c) => c?.first['id'].toString() == 
//         controller.course_info
//             .map((e) => e.section?[sectionIndex]['id'].toString())
//             .first)
    // .expand((c) => c?.map((e) => e['course']) ?? {});
// final allCourseInfos2 = controller.section
//     .map((e) => e.section?.map((e) => e))
//     .where((c) => c?.first['id'].toString() == 
//         controller.course_info
//             .map((e) => e.section?[sectionIndex]['id'].toString())
//             .first)
//     .expand((c) => c?.map((e) => e['lessons']) ?? {});

// var l = allCourseInfos.map((e)=>e?['id']?.toString()).toString();
// // Clean the ID by removing parentheses and other unwanted characters
// l = l.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');
// print('meme${allCourseInfos2}');
// await controller.initializePlayer(l);
// // controller.initializePlayer(  controller.course_info
// //       .map((e) => e.section?[sectionIndex]['id'].toString())
// //       .first ?? '');
// // controller.fetchsectionid('')
// // controller.section.map((e)=>e.course);
// // controller.initializePlayer(allCourseInfos)

//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return Lecturenotpaid(courseId:l,index:sectionIndex,lesson:allCourseInfos2);
//               }));
            },
            child: Text(
              'اشترك دلؤتي',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
        ),
      
    
  

)
] 
      
//                       Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(255, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:
//                      Color.fromARGB(255, 6, 69, 152)
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) 
//                      ),
//                     onPressed: (){}, child: Text('اشترك دلؤتي',style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color: Color.fromARGB(255, 255, 255, 255)),)) ,) ,)           ],), Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(255, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:Color.fromARGB(255, 255, 255, 255)
                   
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(width: 1,color:   Color.fromARGB(255, 6, 69, 152))) 
//                      ),
//                     onPressed: (){}, child: Text('شوف المحاضره',
//                     style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color:   Color.fromARGB(255, 6, 69, 152)),)) ,) ,)           ],),
//                     Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(255, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:
//                      Color.fromARGB(255, 6, 69, 152)
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) 
//                      ),
//                     onPressed: (){}, child: Text('اشترك دلؤتي',style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color: Color.fromARGB(255, 255, 255, 255)),)) ,) ,)           ],)
                      
                      
                      
//                       ],) 
//                ,Wrap(
//   spacing: 16,
//   runSpacing: 16,
//                   children: [
                  
//                    Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(171, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:
//                      Color.fromARGB(255, 6, 69, 152)
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) 
//                      ),
//                     onPressed: (){}, child: Text('اشترك دلؤتي',style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color: Color.fromARGB(255, 255, 255, 255)),)) ,) ,)           ],), Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(255, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:
//                      Color.fromARGB(255, 6, 69, 152)
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) 
//                      ),
//                     onPressed: (){}, child: Text('اشترك دلؤتي',style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color: Color.fromARGB(255, 255, 255, 255)),)) ,) ,)           ],), Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(255, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:Color.fromARGB(255, 255, 255, 255)
                   
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(width: 1,color:   Color.fromARGB(255, 6, 69, 152))) 
//                      ),
//                     onPressed: (){}, child: Text('شوف المحاضره',
//                     style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color:   Color.fromARGB(255, 6, 69, 152)),)) ,) ,)           ],),
//                     Stack(
                  
//                   children: [
//                   // Container(
                    
//                   // width:268 ,height:396 ,

//                   //   decoration: BoxDecoration(  
//                   //        borderRadius: BorderRadius.circular(16),
//                   //        )
//                   //        ,child: 
//               ClipRRect(
//   borderRadius: BorderRadius.circular(16), // Change 16 to your desired radius
//   child: Image.asset('assets/lecturecard.png',width: 268,height: 396,),
// ),
                  
//                   Positioned( top: 1,right: 1,left: 1,bottom: 0,
//                    child:Container(
//                     decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                     color:
//                     Color.fromARGB(1, 255, 255, 255)),) 
                    
//                     )
//                     ,  Container (

//                       width: 268,height: 73,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(16),topRight: Radius.circular(16)),
//                 gradient:
//               LinearGradient(
//                   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//                 colors: [

//               Color.fromARGB(255, 6, 69, 152),
//               Color.fromARGB(255, 118, 162, 212)
//            , ])),
//            child:Container(width: 236,height: 49,
//            child:
//              Column(children: [Text('الاسبوع الاول',
//              style: TextStyle(fontWeight: FontWeight
//              .w500,fontSize: 20,color:
//               Color.fromARGB(255, 255, 255, 255)),)],)
                   
                  
                    
                    
                    
//                      ) ,
           
//            )
//           ,Positioned(
//                     top: 326,left: 24,
//                     child:Container(width: 220,height: 50
//                    ,child:TextButton(
//                     style: TextButton.styleFrom(backgroundColor:
//                      Color.fromARGB(255, 6, 69, 152)
//                    ,  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) 
//                      ),
//                     onPressed: (){}, child: Text('اشترك دلؤتي',style: TextStyle(
                      
//                       fontSize: 18,fontWeight: FontWeight.w600,
                      
//                       color: Color.fromARGB(255, 255, 255, 255)),)) ,) ,)           ],)
                      
                      
                      
//                       ],) 
               
//               // ,Container(
//             // ,    Padding(
//             //   child:
//             // )


//               //   child:Column(children: [
//               //     Container(
                  
//               //       child:Column(children: [

//               //     ],) , width: 268,height: 73,),
               
               
//               //  ],) 
                
                
//                 // )
  
           );
   })
],)

]))])


,SizedBox(width: 100,)  ,
RightSidebar()

]))


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







       
            
            // const SizedBox(height: 20),
      
     ,
                  

         
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
            const SizedBox(height: 10),])    );
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
Widget _buildPaymentMethodCard({
  required String image,
  required String text,
  required String value,
  double imageWidth = 40,
}) {
    return Obx(() => Container(
    width: 330,
    height: 166,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 245, 245, 245),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Container(
          width: 282,
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio<String>(
                value: value,
                groupValue: selectedMethod.value,
                onChanged: (val) {
                 selectedMethod.value = val!;
                },
              ),
              Image.asset(image, height: 16, width: imageWidth),
            ],
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Color.fromARGB(255, 6, 69, 152),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ));
}
  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1280:screenWidth,     // padding: const EdgeInsets.all(16.0),
      child: Row(spacing: 1,
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
        //  SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        //   ),
    
          Text('منافذ بيع الملازم',style: TextStyle( fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 6, 69, 152)),
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          ),
          Text('الحق احجز ملازمك  ',style: TextStyle( fontWeight: FontWeight.w400
      ,   color: Color.fromARGB(255, 181, 181, 181)),
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          )
        //   Text('مادة الفيزياء',style: TextStyle(color: Color.fromARGB(255, 181, 181, 181)),),
        // SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        //   ),Text('الصف الثالث الثانوي'),
         ,        Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 181, 181, 181),
        ),), Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),),
          Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),)
        
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
                // Column: Contact Us Section
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
                      // const SizedBox(height: 16),
                      // _buildInfoRow('icons/location.png',
                      //     '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      // const SizedBox(height: 12),
                      // _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      // const SizedBox(height: 12),
                      // _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
                      // const SizedBox(height: 12),
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

                // Column: About Section
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
          // Add navigation here if needed
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


Widget _buildPagination(HomeController controller, int currentPage) {
    int currentIndex = 1;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(10, (index) {
      final pageIndex = index + 1;
      return GestureDetector(
        onTap: () {
          // setState(() {
            currentIndex = pageIndex;
            controller.fetchCodes(page: pageIndex,); // Fixed: pass pageIndex instead of currentPage
            controller.update();
          // });
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: pageIndex == currentPage
                ? const Color.fromARGB(255, 236, 238, 241)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$pageIndex',
            style: TextStyle(
              color: pageIndex == currentPage
                  ? const Color.fromARGB(255, 6, 69, 152)
                  : Colors.black,
            ),
          ),
        ),
      );
    }),
  );
}
