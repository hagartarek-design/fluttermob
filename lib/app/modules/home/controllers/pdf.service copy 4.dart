import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:video_player/video_player.dart';
import '../views/mainpagecopy.dart';
import '../views/videobyid.dart';
import '../views/videofullscreen.dart';
import 'home_controller.dart';

class LessonPdfViewer extends StatefulWidget {
  final int lessonId;
  final int totalPages;
final String courseId;final String section;
  final index;
  final lesson;
  const LessonPdfViewer({super.key, required this.lessonId, required this.totalPages
  ,required this.courseId,required this.section,required this.index,required this.lesson
  });

  @override
  _LessonPdfViewerState createState() => _LessonPdfViewerState();
}

class _LessonPdfViewerState extends State<LessonPdfViewer> {
  int currentIndex = 1;

  void nextPage() {
    if (currentIndex < widget.totalPages - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void prevPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }



  var allCourseInfos;
  var allCourseInfos2;
  var content;
final PageController _pageController=PageController(
    viewportFraction: 0.22, // ~1 / 4.5
initialPage: 1

);
  bool _hasNavigated = false;

  void _handlePress() async{
    if (!_hasNavigated) {
      await Navigator .push(context,MaterialPageRoute(builder: (context) 
      =>FullscreenVideoScreen())
      );
      setState(() {
      _hasNavigated=true;
      });

     
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Notice"),
          content: Text("You already visited the video screen."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
    bool selectedsection=false;
  bool selectpdf=false;
  bool selectexamsassiggnment=false;
  bool contentsection=false;
final int _currentPage=1;
bool isSelected1=true;
bool isSelected2=false;
bool isSelected3=false;
bool isSelected4=false;
List contentList=[];
int contentCount=0;
  @override
  Widget build(BuildContext context) {
List l=[];
    final imageUrl =
        'http://localhost:3000/pdf/lesson/1/image/$currentIndex';  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(1, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
  void scrollToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
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
      builder: (context) => const MenuDialog(),
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
          child: SizedBox(
            width: screenWidth * 0.95,
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
      body:GetBuilder<HomeController>(//init: HomeController()
      
      builder: (controller){return SingleChildScrollView(
        child:Container(
          
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245)
          ,borderRadius: BorderRadius.only(topLeft:Radius.circular(8) 
        ,topRight:Radius.circular(8) )),

        child:  Column(
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
           
     
            // Wrap(
    
  SizedBox(height: 24,)
        ,
          Container( child:Column(
            spacing: 24,
            children: [
          Container(child: Row(spacing: 1,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
         Text('اختار الاقسام',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
            ,
            
            Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),)
      ,
           
            Text('اختار نشاطك',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
          
          
            ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
            Text('الفيزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
            ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
             Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
            
            ),  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181))),
            Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
          ), 
          
          ],),)  
           ,
           SizedBox(width:1120,child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 12,)
           , Text('اختيار القسم',textAlign: TextAlign.end,style:
             TextStyle(fontWeight: FontWeight.w600,
           fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),),SizedBox(height: 12,)
          ,  Text('المحاضره للأسبوع الاول',textAlign: TextAlign.end,
          style: TextStyle(fontWeight: FontWeight.w400,
           fontSize: 24,color: Color.fromARGB(255, 80, 124, 181)),),SizedBox(height: 12,)
           ,SizedBox(width: 1120,child:Row(spacing: 16, children: [


           ],) ,)
           

,

          Container(
height: 60,    
        width: 275,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
          gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromRGBO(6, 70, 152, 1),
        Color.fromRGBO(118, 162, 212, 1),
      ],
    ),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الفزياء',
                  style: TextStyle(color: Colors.white),
                ),
          Container(
            height: 200,width: 251,
            child: Image.asset('assets/Frame1597882438_8.png'), 
          ),
                
              ],
            ),
          ),

          // const SizedBox(height: 16),

   
            
        
        ]
      ),
    ),
 SizedBox(
  width:1120, child:  Row(// spacing: 16,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
//     Container(
//   width: 267,
//   padding: const EdgeInsets.all(8),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12),
//     border: Border.all(color: Colors.blue.shade100),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         blurRadius: 6,
//         offset: const Offset(0, 4),
//       ),
//     ],
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Stack(
//         children: [
// ,
 Column(
  spacing: 24,
  children: [
  SizedBox(
            height: 40,  // width:1120
              width: 1120,child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
         Container(child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('مستوى التقدم فى الماده',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 16, fontWeight: FontWeight.w400),),
            Text('77% مكتمل',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 12, fontWeight: FontWeight.w400)),
       ],) ), 
SizedBox(  width: screenWidth,  child:
  Wrap( alignment: WrapAlignment.center,  children:
   [ LinearPercentIndicator( width:isMobile? screenWidth:1120, lineHeight: 8.0,
    barRadius: Radius.circular(16), percent: 0.2, alignment:
     MainAxisAlignment.end, isRTL: true, progressColor: Color.fromARGB(255, 77, 195, 44)) ,])    ,

                         )                                          ],)),

Container(width: 1120,height: 1621,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8)
    ),
  ),
  child: Stack(
    alignment: Alignment.center,
    children: [
           Container(
                               child: Image.network(width: 1120,height: 1621,
              imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image not available');
              },
            ),
                  ),

              // ),
 
       
     Positioned(
        top: 13,right: 24,bottom: 13,
        left: 24,
        child: Container(
          width: 322,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)
            )
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.forward_10, color: Colors.white, size: 60),
                onPressed: () => controller.seekBy2(const Duration(seconds: 10)),
              ),
              IconButton(
                icon: Icon(
                  controller.controllervideo2!.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 60,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    controller.controllervideo2!.value.isPlaying
                        ? controller.controllervideo2!.pause()
                        : controller.controllervideo2!.play();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.replay_10, color: Colors.white, size: 60),
                onPressed: () => controller.seekBy(const Duration(seconds: -10)),
              ),
            ],
          ),
        ),
      ),

      Positioned(
        bottom: 13,
        child: Container(padding: EdgeInsets.fromLTRB(24, 13, 24, 13),
          width: 1120,
          height: 76,
          child:       Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              
              width: 116,height: 44,
              child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape:RoundedRectangleBorder(borderRadius:  BorderRadius.circular(8)
              ),padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
              backgroundColor: Color.fromARGB(255, 6, 69, 152)
              ),
              onPressed:nextPage ,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('assets/arrowleft.png',width:9.53,height:20
              )
              ,SizedBox(width: 12,)
              ,const Text('التالي',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18,color: Color.fromARGB(255, 255, 255, 255)),),

              ],)
            ), )
          ,
            const SizedBox(width: 20),
            _buildPagination(controller, currentIndex)
           ,
            const SizedBox(width: 20),
       SizedBox(
        width: 116,height: 44,
        child: ElevatedButton(style: 
ElevatedButton.styleFrom(
  padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
  side: BorderSide(color: Color.fromARGB(255, 6, 69, 152),width: 1)
,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
),
              onPressed:prevPage ,
              child: const Text('لاحق',style: TextStyle(color: Color.fromARGB(255, 61, 84, 110)),),
            ),)     
          ],
        ),
      ),
      ),




    ],
  ),
),// ),
  

//     Container( width: 837,height: 547,
//                child:
//                 Column(children: [

// Container(child: Row(
//   spacing: 12,
//   children: [
//     InkWell(child:Container( width:200 ,height:100,decoration: BoxDecoration(  color: Color.fromARGB(255, 245, 245, 245),
//  border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
//   borderRadius: BorderRadius.circular(8)
//   ) ,child: 
// Column(
//   spacing: 8,
//   crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
// Image.asset('assets/Component 234.png',width: 32,height: 32,)
// ,Text('الامتحنات والواجبات',style: TextStyle(fontWeight: FontWeight.w500,fontSize:16,color: Color.fromARGB(255, 222, 61, 49)),)

// ],)
// ),onTap: ()async{
//   // selectpdf==false;
// //   await controller. sectionidlessontype( 
// //     //  controller.course_info
// //     //     .map((e) => e.section?[widget.index]['id'].toString())
// //     //     .first ?? '',
// //         'واجبات و امتحنات'.toString()
       
       
// //         );
// //           contentList = controller.courses_lesson
// //     .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
// //       )  ?? [])
// //     .expand((content) => content is List ? content : [content]) // Flatten nested lists
// //     .toList();

// // // Count the actual content items (not characters in a joined string)
// // controller.update();
// // contentCount = contentList.length;
// // // If you need to print the contents for debugging:
// // print('Content items: $contentList');
// //  selectedsection=false;
// // selectpdf=false;
// // selectexamsassiggnment=true;selectpdf==false;
// },),

// InkWell(
  
//   child:Container(width:200 ,height:100,decoration: BoxDecoration(  color: Color.fromARGB(255, 245, 245, 245),
//  border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
//   borderRadius: BorderRadius.circular(8)
  
// // //   }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// // //   fontWeight: FontWeight.w500,fontSize: 16
// // //   ),),

// // //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
// // //       ],));
// // //       }),
// // // Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// // // decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// // // ,borderRadius:BorderRadius.circular(12),//border: Border.all(
// // //   // width: 1,color:Color.fromARGB(255, 154, 175, 228)
// // //   // ) 
// // // ),
// // //  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// // //   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// // // // Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// // // // children: [

// // // //   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// // // //   fontWeight: FontWeight.w500,fontSize: 16
// // // //   ),),
  
// // // //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
// // //  ],),)

// // // // ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// // // // decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// // // // ,borderRadius:BorderRadius.circular(12),
// // // // //border: Border.all(
// // // // //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// // // // ),
// // // //  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// // // //   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// // // // Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// // // // children: [

// // // //   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// // // //   fontWeight: FontWeight.w500,fontSize: 16
// // // //   ),),
  
// // // //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
// //   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// //   fontWeight: FontWeight.w500,fontSize: 16
// //   ),),
  
// //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
// //  ],),)

// // ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// // decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// // ,borderRadius:BorderRadius.circular(12),
// // //border: Border.all(
// // //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// // ),
// //  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// // Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// // children: [

// //   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// //   fontWeight: FontWeight.w500,fontSize: 16
// //   ),),
  
// //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
// //  ],),)


//   ],) )
  

// ],),),
//       //  :
// Container( width: 837,height: 423 , child: Column(spacing: 8,
//   crossAxisAlignment: CrossAxisAlignment.end,

//   children: [
    
// Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// fontWeight: FontWeight.w500,fontSize: 20),)
//     ,// ,  selected==false? 
// Container( width: 837,height: 382,child:Column(
//   spacing: 14,
//   children: [ 
    
// //   ...List.generate(contentCount!,(indexcontent){  
// // return Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// // decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

// // ,borderRadius:BorderRadius.circular(12),border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// // ),
// //  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //     Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// // Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// // children: [

// //   Text('${
// // contentList[indexcontent]['name'].toString()
 
 
// //  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// //   fontWeight: FontWeight.w500,fontSize: 16
// //   ),),
// //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
// //       ],));
// //       }),
// // Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// // decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// // ,borderRadius:BorderRadius.circular(12),
// // ),
// //  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),

// //  ],),)


//   ],) )
 

  

// ],),)
       
//                ],),
//                )
     
       SizedBox( width: 1120,height: 547,
               child:
                Column(children: [

Container(child: Row(
  spacing: 12,
  children: [
    InkWell(child:Container( width:271 ,height:100,decoration: BoxDecoration(  color: Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component 234.png',width: 32,height: 32,)
,Text('الامتحنات والواجبات',style: TextStyle(fontWeight: FontWeight.w500,fontSize:16,color: Color.fromARGB(255, 222, 61, 49)),)

],)

),onTap: ()async{
    await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? '',
     title:    'واجبات و امتحنات'.toString(),
       sectionId: widget.section
    //    ,controller.courses_lesson
    // .map((e) => e.section?.map((e)=>e['id']//?//.map((lesson) => lesson['content'] ?? []) 
    //   )  ?? '').toString()
        );
          contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

// Count the actual content items (not characters in a joined string)
controller.update();
contentCount = contentList.length;
// If you need to print the contents for debugging:
print('Content items: $contentList');
 selectedsection=false;
selectpdf=false;
selectexamsassiggnment=true;selectpdf==false;
  // selectpdf==false;
  // await controller. sectionidlessontype( 
  //   //  controller.course_info
  //   //     .map((e) => e.section?[widget.index]['id'].toString())
  //   //     .first ?? '',
  //       'واجبات و امتحنات'.toString()
       
       
  //       );
//           contentList = controller.courses_lesson
//     .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
//       )  ?? [])
//     .expand((content) => content is List ? content : [content]) // Flatten nested lists
//     .toList();

// // Count the actual content items (not characters in a joined string)
// controller.update();
// contentCount = contentList.length;
// // If you need to print the contents for debugging:
// print('Content items: $contentList');
//  selectedsection=false;
// selectpdf=false;
// selectexamsassiggnment=true;selectpdf==false;
},),

InkWell(
  
  child:Container(width:271 ,height:100,decoration: BoxDecoration(  color: Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component 232 (1).png',width: 32,height: 32,)
,Text('pdf',style: TextStyle(fontWeight: FontWeight.w500,fontSize:16,
color: Color.fromARGB(255, 242, 195, 42)

),)

],)
),onTap: ()async{

 selectedsection=true;contentsection=false;
selectpdf=false;
selectexamsassiggnment=true;
  await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? '',
        title:'pdf'.toString(),sectionId:controller.courses_lesson
    .map((e) => e.section?.map((e)=>e['id']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? '').toString());controller.update();
  contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

// Count the actual content items (not characters in a joined string)
contentCount = contentList.length;

// If you need to print the contents for debugging:
print('Content items: $contentList');
//  selectedsection=true;contentsection=false;
// selectpdf=false;
// selectexamsassiggnment=true;
//   await controller. sectionidlessontype( 
//     //  controller.course_info
//     //     .map((e) => e.section?[widget.index]['id'].toString())
//     //     .first ?? '',
//         'pdf'.toString());controller.update();
//   contentList = controller.courses_lesson
//     .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
//       )  ?? [])
//     .expand((content) => content is List ? content : [content]) // Flatten nested lists
//     .toList();

// // Count the actual content items (not characters in a joined string)
// contentCount = contentList.length;

// // If you need to print the contents for debugging:
// print('Content items: $contentList');
},
 ),

InkWell(
  onTap: ()async{

selectedsection=true;
selectpdf=false;
selectexamsassiggnment=false;
       selectpdf==false;
  await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? ''
    //     ,
      title:   'المحاضرات'.toString()
        ,sectionId:  controller.courses_lesson
    .map((e) => e.section?.map((e)=>e['id']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? '').toString()
        );
  //        allCourseInfos2 = controller.course_info
  //     .map((e) => e.section?.map((e) => e))
  //     .where((c) => c?.first['id'].toString() == 
  //         controller.course_info
  //             .map((e) => e.section?[widget.index]['id'].toString())
  //             .first)
  //     .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
  // l = allCourseInfos2
  //     .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
   
    // Extract content as a list of strings first
//  contentList = controller.courses_lesson
//     .expand((e) => e.section?[widget.index]['lesson']?.map((lesson) => lesson['content'] ?? []) ?? [])
//     .toList();

// // Count the actual content items (not characters in a joined string)
//  contentCount = contentList.length;

// // If you need to print the contents for debugging:
// print('Content items: $contentList');
// print('Number of content items: $contentCount');
        contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

// Count the actual content items (not characters in a joined string)
contentCount = contentList.length;

// If you need to print the contents for debugging:
print('Content items: $contentList');
// selectedsection=true;
// selectpdf=false;
// selectexamsassiggnment=false;
//        selectpdf==false;
//   await controller. sectionidlessontype( 
//     //  controller.course_info
//     //     .map((e) => e.section?[widget.index]['id'].toString())
//     //     .first ?? ''
//     //     ,
//         'المحاضرات'.toString()
        
//         );
//   //        allCourseInfos2 = controller.course_info
//   //     .map((e) => e.section?.map((e) => e))
//   //     .where((c) => c?.first['id'].toString() == 
//   //         controller.course_info
//   //             .map((e) => e.section?[widget.index]['id'].toString())
//   //             .first)
//   //     .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
//   // l = allCourseInfos2
//   //     .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
   
//     // Extract content as a list of strings first
// //  contentList = controller.courses_lesson
// //     .expand((e) => e.section?[widget.index]['lesson']?.map((lesson) => lesson['content'] ?? []) ?? [])
// //     .toList();

// // // Count the actual content items (not characters in a joined string)
// //  contentCount = contentList.length;

// // // If you need to print the contents for debugging:
// // print('Content items: $contentList');
// // print('Number of content items: $contentCount');
//         contentList = controller.courses_lesson
//     .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
//       )  ?? [])
//     .expand((content) => content is List ? content : [content]) // Flatten nested lists
//     .toList();

// // Count the actual content items (not characters in a joined string)
// contentCount = contentList.length;

// // If you need to print the contents for debugging:
// print('Content items: $contentList');
  },
  child:Container(
  width:271 ,height:100,decoration: BoxDecoration(
  color: Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component 232.png',width: 32,height: 32,)
,Text('المحاضرات',style: TextStyle(fontWeight: FontWeight.w500,fontSize:16,color: Color.fromARGB(255, 6, 182, 141)),)

],)
), )
,
InkWell(child:Container( width:271 ,height:100,decoration: BoxDecoration(
  color: Color.fromARGB(255, 6, 69, 152),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing:8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component 233.png',width: 32,height: 32,)
,Text('محتوي الدرس',style: TextStyle(fontWeight: FontWeight.w500,fontSize:16,color: Color.fromARGB(255, 245, 245, 245)),)

],)
) ,onTap: () async{
  await controller.fetchsectionidlesson(
    controller.course_info
        .map((e) => e.section?[widget.index]['id'].toString())
        .first ?? '');

   allCourseInfos = controller.course
      .map((e) => e.section?.map((e) => e))
      .where((c) => c?.first['id'].toString() == 
          controller.course_info
              .map((e) => e.section?[widget.index]['id'].toString())
              .first)
      .expand((c) => c?.map((e) => e) ?? []);

   allCourseInfos2 = controller.course
      .map((e) => e.section?.map((e) => e))
      .where((c) => c?.first['id'].toString() == 
          controller.course_info
              .map((e) => e.section?[widget.index]['id'].toString())
              .first)
      .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
  l = allCourseInfos2
      .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
      // .map((lesson) => lesson['name'].toString()) 
      // .toList();

  print('Lesson names: $l');
selectedsection=false;
contentsection=true;
selectexamsassiggnment==false;
selectpdf==false;
//   await controller.fetchsectionidlesson(
//     controller.course_info
//         .map((e) => e.section?[widget.index]['id'].toString())
//         .first ?? '');

//    allCourseInfos = controller.course
//       .map((e) => e.section?.map((e) => e))
//       .where((c) => c?.first['id'].toString() == 
//           controller.course_info
//               .map((e) => e.section?[widget.index]['id'].toString())
//               .first)
//       .expand((c) => c?.map((e) => e) ?? []);

//    allCourseInfos2 = controller.course
//       .map((e) => e.section?.map((e) => e))
//       .where((c) => c?.first['id'].toString() == 
//           controller.course_info
//               .map((e) => e.section?[widget.index]['id'].toString())
//               .first)
//       .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
//   l = allCourseInfos2
//       .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
//       // .map((lesson) => lesson['name'].toString()) 
//       // .toList();

//   print('Lesson names: $l');
// selectedsection=false;
// contentsection=true;
// selectexamsassiggnment==false;
// selectpdf==false;
}),

],),),SizedBox(height:8),
selectedsection==false&&selectexamsassiggnment==false&&selectpdf==false&&contentsection==true?
SizedBox( width: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,SizedBox( width: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 112,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)
,
 Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox( width: 787,height: 24, 
child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)


,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)


  ],) )

],),)
:selectedsection==false&&selectexamsassiggnment==true&&selectpdf==false&&contentsection==false?
SizedBox( width: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,SizedBox( width: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(contentList.length,(indexlesson){  
return Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${
 contentList[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )

],),)
:selectedsection==false&&selectexamsassiggnment==false&&selectpdf==true&&contentsection==false?
SizedBox( width: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,SizedBox( width: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )

],),)
      :selectpdf==false &&selectexamsassiggnment==true && selectpdf==false &&contentsection==false?
SizedBox( width: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,// ,  selected==false? 
SizedBox( width: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
  ...List.generate(contentList.length,(indexcontent){
    if(contentList[indexcontent]['content'].map((e)=>e['name'])=='المحاضرات'  ) {
      return InkWell( onTap: (){},child:Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text(contentList[indexcontent]['name'].toString(),style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],)) ,) ;
    }
return  Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text(contentList[indexcontent]['name'].toString(),style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
// Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),//border: Border.all(
//   // width: 1,color:Color.fromARGB(255, 154, 175, 228)
//   // ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// // Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// // children: [

// //   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
// //   fontWeight: FontWeight.w500,fontSize: 16
// //   ),),
  
// //   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )
  

],),)
       :
SizedBox( width: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,// ,  selected==false? 
SizedBox( width: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
  ...List.generate(contentCount,(indexcontent){  
return 
InkWell(onTap: ()async{
 
await controller.initializePlayer2('${contentList[indexcontent]?['id'].toString()}');
 print('${contentList[indexcontent]?['id'].toString()}');
  Navigator.push(context,MaterialPageRoute(builder: (context){
    return Videobyid(index:widget.index,lesson: widget.lesson,courseId: widget.courseId,sectionId: widget .section,);
    }));
  // print('${contentList[indexcontent]['id']}');
  // controller.initializePlayer2(contentList[indexcontent]['id']);
  
  }
,child:Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)
,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
SizedBox(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text(contentList[indexcontent]['name'].toString(),style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],))
    ,);
   }),
// Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),

//  ],),)


  ],) )
 

  

],),)
       
               ],),
               )
              ])


  ],)
  
  
 )
              
  ,          



SizedBox(height: 24,),

      
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
        
   ]))])));}));
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

   Widget _buildClassCard(String title, String imagePath,context,bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
    
      child: Column(
        children: [
          Container(
             
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
            height: 150,width:isMobile? 362.67:300,
            padding: const EdgeInsets.all(8),
            child: Image.asset(imagePath),
          ),
          Padding(
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
        ],
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

  // Widget _buildClassCard(String title, String imagePath) {
  //   return Container(
  //     width: 362,
  //     decoration: BoxDecoration(
  //       color: const Color.fromARGB(255, 212, 221, 232),
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           height: 150,
  //           padding: const EdgeInsets.all(8),
  //           child: Image.asset(imagePath, fit: BoxFit.contain),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             title,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.w600,
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 6, 69, 152),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/Frame (10).png', width: 43, height: 40),
          const SizedBox(height: 8),
          const Text(
            'الأستاذ شريف البدري',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            textAlign: TextAlign.right,
          ),
          const Text(
            'مدرس ماده العلوم',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          const Text(
            'أستاذ العلوم المميز: حاز على شهادة التخرج من كلية الآداب والتربية بتقدير امتياز مع مرتبة الشرف، ويتمتع بخبرة واسعة تمتد لثلاثين عامًا في ميدان تدريس اللغة العربية. يتميز بتدريس مناهج الثانوية العامة بكل دقة واهتمام، وقد أُطلِق عليه لقب "صانع الأوائل" نظرًا لتفانيه الدائم وجهوده الحثيثة في تحفيز وتوجيه طلابه نحو تحقيق النجاح والتفوق. ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 80, 124, 181),
            ),
            textAlign: TextAlign.right,
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
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
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
                      const SizedBox(height: 16),
                      _buildInfoRow('icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
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

                // Column: About Section
                SizedBox(
                  width: screenWidth < 600 ? double.infinity : 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Wrap(
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
                      ),
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
            ),
          ],
        ),
      ),
    ),
  );
}
 Widget _buildPagination(HomeController controller,int currentPage ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(10, (index) {
        final pageIndex = index + 1;
        return GestureDetector(
          onTap: () {
            currentPage = pageIndex;
            
            prevPage();
            // controller.exampagination(page:controller.currentPage);
            controller.update();
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: pageIndex 
              ==currentPage
                  ?Color.fromARGB(255, 236, 238, 241)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$pageIndex',
              style: TextStyle(
                color: pageIndex == currentPage
                    ? Color.fromARGB(255, 6, 69, 152)
                    : Colors.black,
              ),
            ),
          ),
        );
      }),
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
  }}

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
 










































































  // @override
  // Widget build(BuildContext context) {
  //   final imageUrl =
  //       'http://localhost:3000/pdf/lesson/${widget.lessonId}/image/$currentIndex';

  //   return Column(
  //     children: [
  //       Expanded(
  //         child: Center(
            // child: Image.network(
            //   imageUrl,
            //   errorBuilder: (context, error, stackTrace) {
            //     return const Text('Image not available');
            //   },
            // ),
  //         ),
  //       ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       onPressed: prevPage,
        //       child: const Text('Previous'),
        //     ),
        //     const SizedBox(width: 20),
        //     // Text('${currentIndex + 1} / ${widget.totalPages}'),
        //     Text(''),
        //     const SizedBox(width: 20),
        //     ElevatedButton(
        //       onPressed: nextPage,
        //       child: const Text('Next'),
        //     ),
        //   ],
        // ),
  //     ],
  //   );
  // }
// }
