import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/answers.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';

import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/modules/home/views/textfield.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'mainpage copy 2.dart';
class ExamresultAnswerSheet extends StatefulWidget {
  final lessonIds;
   ExamresultAnswerSheet({super.key ,required this.lessonIds});

  @override
  State<ExamresultAnswerSheet> createState() => _ExamresultAnswerSheetState();
}

class _ExamresultAnswerSheetState extends State<ExamresultAnswerSheet> {
  // final controller = Get.put(
  //   ExamResultController(ExamService()),
  // );
 final List<String> images = [
  'assets/use1.png',
  'assets/use2.png',
  'assets/use3.png',
  'assets/use5.png',
  'assets/use4.png',
  'assets/use7.png',
  'assets/use2.png',
  'assets/use3.png',
  'assets/use1.png',
  
];

  final List<List<String>> imageGroups = [
    ['assets/use1.png', 'assets/use2.png', 'assets/use3.png', 'assets/use5.png'],
    ['assets/use4.png', 'assets/use5.png', 'assets/use2.png', 'assets/use5.png'],
    ['assets/use7.png', 'assets/use1.png', 'assets/use2.png', 'assets/use5.png'],
  ];







final int _currentPage=0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);

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
          child: Container(
            
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
      body:GetBuilder<HomeController>(
      
      builder: (controller){return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 242, 195, 42),
              padding: const EdgeInsets.all(10),
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






            


































     SizedBox(height: 32,),SizedBox(width:isMobile?311: 1120,
     child: Column(//crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 32,
      children: [  

   Container(
            
            child:
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
            TextButton( onPressed: (){},style: 
TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  backgroundColor: Color.fromARGB(255, 6, 69, 152),padding: EdgeInsets.fromLTRB(24, 16, 24, 16)), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                
               RichText(
            text: const TextSpan( children: [

              TextSpan(text: 'سنوي/',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromARGB(255, 255, 255, 255)))
        
              ,  ])),  Text( '150',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18 ,color: Color.fromARGB(255, 255, 255, 255)),)
              ,Text('اشترك الان',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 255, 255, 255)),)],),)
       ,
             Wrap( spacing: 1,
            alignment: WrapAlignment.end,
            children: [
  // ,
                         Text('Total Questions: ${controller.result.value?.total}'),
          
            Text('True: ${controller.result.value?.truePercent}%'),
            Text('False: ${controller.result.value?.falsePercent}%'),

        //  Text('اختار الاقسام',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
         
        //  ,fontSize:isMobile?10: 16
        //  ),
         
         
        //  )
            
            
           
      
           
           
          
          
            // , 
             Container(width:isMobile?10: 18,height: 18,decoration: BoxDecoration(),      child:
             Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
             InkWell(
      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context){
          return Subjectbooks();}));},
      child:     Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 181, 181, 181),
        ),), )
            , InkWell(  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Subjecttype())),
            child: Container(width:isMobile?10: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
             ),Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
            
            ),  Container(width:isMobile?10: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181))),
           InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context){return Homeafterlogin();}));
          },
          child:  Text('الرئيسية',style: TextStyle(
          fontSize: 16,fontWeight: FontWeight.w400
          ,color: Color.fromARGB(255, 181, 181, 181)),
          ), ) ,
          ],),],)) 
      ,
      Container( decoration: BoxDecoration( 
    color: Colors.white, borderRadius: 
    BorderRadius.circular(20)), width:
    isMobile?311: 1120
     ,padding: 
     EdgeInsets.all(32),
   child: Column(
    spacing: 48,
    children: [

SizedBox(
  width:isMobile?311: 1056,
  // child:Row(
    
    // children: [
    child:   Wrap(alignment: WrapAlignment.end,children: [ 
      Text('امتحان القوة المتبادلة بين سلكين متوازيين'
    ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
    fontSize:isMobile?20: 32,fontWeight: FontWeight.w600 ),)],) 
// ,])
)
,SizedBox(
  width: isMobile?311
:  1056,


  child:Column(children: [ 
    SizedBox(width: 313,height:64,child:Row(
      spacing:isMobile?10: 32,
      children:[

      Container(child: Row(children: [
        Text('ممتاز',style: TextStyle(fontWeight:FontWeight.w600
        ,fontSize:isMobile?16: 24,color: Color.fromARGB(255, 6, 69, 152)),)
        ,Image.asset('assets/Frame_1.png',width:isMobile?30: 64,height:isMobile?30 :64,)
        
        ],),)
      ,
      Text(':نتيجة الامتحان',style: TextStyle(fontWeight:
       FontWeight.w600,fontSize:isMobile?16: 24,color: Color
       .fromARGB(255, 6, 69, 152)),)
       
       ])),
       Center(child:Column(children: [
Stack(
  alignment: Alignment.center,
  children: [
     YellowArc(startPercent:(controller.result.value?.restPercent??0.0)/ 100, percent: (controller.result.value?.restPercent??0.0)/ 100), // 15%
     RedQuarterCircle(startPercent: 0.65, percent: (controller.result.value?.falsePercent??0.0)/ 100), // 25%
    GreenHalfCircle( startPercent: 0.32,percent: (controller.result.value?.truePercent??0.0)/ 100),          // 50%
    const GreyCircle(),
     WhiteCircle(lessonIds:widget.lessonIds),
  ],
)
,
//          Stack(
//   alignment: Alignment.center,
//   children: const [
//     GreenHalfCircle(),   
//     RedQuarterCircle(),  
//     YellowArc(),         
//     GreyCircle(),
//     WhiteCircle(),
// ],
// ) , 
SizedBox(height: 32,) ,
Container(child: 
Wrap(
  alignment: WrapAlignment.center,
  spacing:isMobile?5: 10,
  children: [
Container(child: Row(
  
  spacing:isMobile?5: 10, children: [
    Text(' عدد الاجابات الصحيحة',style: TextStyle(
      fontWeight: FontWeight.w400,fontSize:isMobile?12: 16,
      color: Color.fromARGB(255, 26, 35, 46)),),
Container(width: 27,height: 13,decoration: BoxDecoration
(color: Color.fromARGB(255, 39, 114, 83),borderRadius: BorderRadius.circular(20)),)

],),),
Container(child: Wrap(
  
  spacing:isMobile?2: 10, children: [
    Text(' عدد الاجابات الفائتة',style: TextStyle(
      fontWeight: FontWeight.w400,fontSize:isMobile?12: 16,
      color: Color.fromARGB(255, 26, 35, 46)),),
Container(width:isMobile?17: 27,height: 13,decoration: BoxDecoration
(color: Color.fromARGB(255, 242, 195, 42),borderRadius: BorderRadius.circular(20)),)

],),),
Container(child: Row(
  
  spacing:isMobile?2: 10, children: [
    Text(' عدد الاجابات الخاطئة',style: TextStyle(
      fontWeight: FontWeight.w400,fontSize:isMobile?12: 16,
      color: Color.fromARGB(255, 26, 35, 46)),),
Container(width: 27,height: 13,decoration: BoxDecoration
(color: Color.fromARGB(255, 244, 67, 54),borderRadius: BorderRadius.circular(20)),)

],),),

],),),
SizedBox(height: 36,)
],)  ) ,SizedBox(width:isMobile?311: 1056,child:

Column(
  
  spacing: 16,
  children: [
  Container(
    width:isMobile?311: 1056,height: 88,decoration: 
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
    color: Color.fromARGB(255, 222, 247, 227))
    ,padding: EdgeInsets.fromLTRB(12, 22,12, 22),
    child:Column(children: [Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${controller.result.value?.trueans}',style: TextStyle(
          color: Color.fromARGB(255, 28, 125, 49),
        fontSize: 14,fontWeight: FontWeight.w400),),
      Text("عدد الاجابات الصحيحة",
      style: TextStyle(color: 
       Color.fromARGB(255, 28, 125, 49),
       fontWeight: FontWeight.w400
       ,fontSize:isMobile?10: 16
       ))],),
       
      //  Container(  width:isMobile?311: screenWidth, 
        // child:
  // Wrap( 
  // children:
  //  [
     new LinearPercentIndicator( width:isMobile?220: 1032, lineHeight: 10.0,
    barRadius: Radius.circular(18), percent: (controller.result.value?.truePercent??0.0)/ 100,///100, 
     isRTL: true, progressColor: Color.fromARGB(255, 77, 195, 44)) ,])    ,

                        //  )    
      //  ]      )
      )
 ,
  Container(
    width:isMobile?311: 1056,height: 88,decoration: 
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
    color: Color.fromARGB(255, 255, 247, 219))
    ,padding: EdgeInsets.fromLTRB(12, 22,12, 22),
    child:Column(children: [Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text('${controller.result.value?.rest}عدد الاجابات الفائتة',style: TextStyle(
          color: Color.fromARGB(255, 224, 175, 0),
        fontSize:isMobile?10: 14,fontWeight: FontWeight.w400),),
      // Text("عدد الاجابات الخائطة",
      // style: TextStyle(color: 
      //  Color.fromARGB(255, 224, 175, 0),
      //  fontWeight: FontWeight.w400
      //  ,fontSize:isMobile?10: 16
      //  ))
       ],),
       
      //  Container(  width: screenWidth, 
      //   child:
  // Wrap( 
  // children:
  //  [ 
    new LinearPercentIndicator( width:isMobile?220: 1032, lineHeight: 10.0,
    barRadius: Radius.circular(18), percent:(controller.result.value?.restPercent??0.0)/ 100, 
     isRTL: true, progressColor: Color.fromARGB(255, 224, 175, 0)) ,])    ,

                        //  )    
      //  ],
       ) //)
,  Container(
    width:isMobile?311: 1056,height: 88,decoration: 
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),
    color: Color.fromARGB(255, 254, 222, 220))
    ,padding: EdgeInsets.fromLTRB(12, 22,12, 22),
    child:Column(children: [Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${controller.result.value?.falseans}',style: TextStyle(
          color: Color.fromARGB(255, 200, 17, 4),
        fontSize: 14,fontWeight: FontWeight.w400),),
      Text("عدد الاجابات الخائطة",
      style: TextStyle(color: 
    Color.fromARGB(255, 200, 17, 4),
       fontWeight: FontWeight.w400
       ,fontSize: 16
       ))],),
       
       Container(  width: screenWidth, 
        child:
  Wrap( 
  children:
   [ new LinearPercentIndicator( width:isMobile?220:1032, lineHeight: 10.0,
    barRadius: Radius.circular(18),percent: ((controller.result.value?.falsePercent ?? 0.0) / 100),
 
     isRTL: true, progressColor: Color.fromARGB(255, 200, 17, 4)),])    ,

                         )    
       ],) ),

          answers(lessonIds:widget.lessonIds ,)

],) ,)
],)  
   ,)
  ],),    )   






          
          
            
            
            
            
















































        
        
        
        
        
              
        
        

        
        
        
        
        
        
        
        
        
        
        
        
                    
        
        
        
        
        
        
        
        
        

        
        
        
        
        ,
      
        ],
      ),
       ),  _buildFooter(context),
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
        
    ],),);
    }
    ));
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
            padding: const EdgeInsets.all(10),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
         
        ],
      ),
    )
    , Padding(
            padding: const EdgeInsets.all(10.0),
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
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/Frame_10.png', width: 43, height: 40),
          const SizedBox(height: 10),
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
                          _icon('icons/Frame14.png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame13.png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame12.png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame11.png'),
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
                      const SizedBox(height: 10),
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
      const SizedBox(width: 10),
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
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Image.asset(iconPath, width: 40, height: 40),
        const SizedBox(width: 10),
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