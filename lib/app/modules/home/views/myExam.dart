import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/trueAnswerExam.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart' show mennimenu;

import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exam_solve.dart';
import 'wallet_cart.dart';






class MyExam extends StatefulWidget {
  const MyExam({super.key});

  @override
  State<MyExam> createState() => _MyexamState();
}

class _MyexamState extends State<MyExam> {

HomeController controller=Get.find();
@override
void initState() {
  super.initState();
  print('Mainscreen - بدء التشغيل');
  
  WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.currentScreen.value = '/Mainscreen';
    
    controller.startTokenMonitoring();
  });
}

@override
void dispose() {
  print(' Mainscreen - التخلص');
  
  
  super.dispose();
}

  Future<void> _checkTokenAndAutoLogout() async {
    print(' Mainscreen - التحقق من التوكن (بدون تجديد)');
    
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    if (token == null || token.isEmpty) {
      print(' Mainscreen - لا يوجد توكن');
      _autoLogout('لا يوجد توكن');
      return;
    }
    
    try {
      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());
      
      print(' Mainscreen - الوقت المتبقي: ${remaining.inMinutes} دقيقة و${remaining.inSeconds % 60} ثانية');
      
      if (remaining.isNegative || remaining.inSeconds < 30) {
        print(' Mainscreen - التوكن منتهي أو شبه منتهي');
        _autoLogout('التوكن منتهي الصلاحية');
        return;
      }
      
      print(' Mainscreen - لا تجديد للتوكن هنا، فقط تحقق للتسجيل الخروج');
      
      if (remaining.inMinutes < 2) {
        print(' Mainscreen - التوكن سينتهي قريباً - سيتم الخروج تلقائياً');
        
        Get.snackbar(
          'تحذير',
          'التوكن سينتهي خلال ${remaining.inMinutes} دقيقة - سيتم الخروج تلقائياً',
          duration: Duration(seconds: 5),
          backgroundColor: Colors.orange,
        );
        
        Future.delayed(Duration(minutes: 1), () {
          if (mounted && controller.currentScreen.value == '/Mainscreen') {
            _autoLogout('التوكن على وشك الانتهاء');
          }
        });
      }
      
    } catch (e) {
      print(' Mainscreen - خطأ في فحص التوكن: $e');
      _autoLogout('خطأ في فحص التوكن');
    }
  }
void _autoLogout(String reason) async {
  print(' Mainscreen - تسجيل خروج تلقائي: $reason');
  
  try {
    Get.snackbar(
      'جلسة منتهية',
      'تم تسجيل الخروج تلقائياً ($reason)',
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(20),
      borderRadius: 10,
    );
    
    await Future.delayed(Duration(seconds: 3));
    
    if (mounted && controller.currentScreen.value == '/Mainscreen') {
      print('🔄 تنفيذ تسجيل الخروج...');
      
      await safeLogout();
    }
  } catch (e) {
    print(' خطأ في _autoLogout: $e');
    
    try {
      Get.offAllNamed('/mainpage');
    } catch (e2) {
      print(' حتى المحاولة الطارئة فشلت: $e2');
    }
  }
}
Future<void> safeLogout() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
   controller. token = '';
    controller. update();
   controller.  stopAutoRefresh();
    
    await Future.delayed(Duration(milliseconds: 500));
    
    Get.offAllNamed(
      '/mainpage',
      predicate: (route) => false,
    );
  } catch (e) {
    print('❌ خطأ في safeLogout: $e');
    Get.offAllNamed('/mainpage');
  }
}
  // @override
  // Widget build(BuildContext context) {
  //  Timer? _refreshTimer;





bool isSelected=true;

bool isSelected2=false;






   var selectedSection = Rx<String?>(null);


  
  
  
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;

int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
var selectedMethod=''.obs;
  @override 
  Widget build(BuildContext context) {
    int _currentPage=0;
  
     Timer? _refreshTimer;
  
  void stopAutoRefresh() {
    print('⏹️ إيقاف التجديد التلقائي');
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }          
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
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
         SizedBox(height: 20,)  

, Container(width: 
isMobile?375: 1820, 
         child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              isMobile?Container():
RightSidebar()
              ,SizedBox(width: 10,)  ,
           Expanded(
        child: Container(
          width: !isMobile ? 852 : 375,child:
               Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container( width:!isMobile?852:343 ,
                 padding:isMobile?EdgeInsets.only():
                  EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),

)
,child: 
Column(mainAxisAlignment: MainAxisAlignment.start,
  
  children: [
    
  Container(width:!isMobile ?246:375, height: 110,
  alignment: Alignment.centerRight,
  child:Text('امتحناتك'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight:isMobile?FontWeight.w500: FontWeight.w600,
)
 ,),
) 

,
 
 Container(width:isMobile?375: 770
 ,child: 
     Column(crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      
      
      children: [
  
  Text('الامتحانات اللي عليك',style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 6, 69, 152)),)

  ,Row(children: [  Container(
              width:isMobile?343: 428,height: isMobile?71:44,
           decoration: BoxDecoration(
          color:  Color.fromARGB(255, 235, 239, 249)
           ,border:Border.all(color:  Color.fromARGB(255, 6, 69, 152),width: 1 )
,borderRadius:BorderRadius.circular(8) 
            ),
           child: Row ( children: [
        InkWell(child:   Container(
            
            
          
          width:isMobile? 169.5:210,
          height:isMobile?71: 44,
            decoration: BoxDecoration(  color:         
            isSelected==true&&isSelected2==false?
             Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152)
,
            borderRadius: BorderRadius.circular(8)
            ),child: Wrap(children: [Text('امتحنات اونلاين',
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20
           , color:  isSelected==true&&isSelected2==false?
          Color.fromARGB(255, 6, 69, 152)
          :  Color.fromARGB(255, 255, 255, 255)
            ),),Image.asset('assets/Frame.png',height: 30,width: 30,)
            
            ],),),
        onTap: (){
setState(() {
  isSelected=false;
  isSelected2=true;
});
controller.fetchExams2(online: 1);

        },),
   InkWell(child:       Container(
    
         width:isMobile?169.5: 210,
         height:isMobile?71: 44,
          
           child: Wrap(children: [

Text('امتحان في السنتر',style: TextStyle(color: 
isSelected==true&&isSelected2==false?
 Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152),
fontSize: 20,fontWeight: FontWeight.w500

),),Image.asset('assets/Group_1.png',width: 30,height: 30,)
          
         ],),
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)
       ,  color:  isSelected==false&&isSelected2==true? Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152)
         ),
        
         )
      
           ,onTap: (){
            setState(() {
              isSelected2=false;
              isSelected=true;
            });
controller.fetchExams2(online: 0);}, ) ],),
           
           )
    ],)  ,
  
     Container( width:isMobile?343: 446,height:isMobile?343: 325, 

 child:   Wrap(
  spacing: 16,
  alignment: WrapAlignment.start,children: [
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
      
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
              
  
              
  
  
  
  
  
  
              
  
  
  
  
         
  
  
  
  
  
 
    
    ...List.generate(controller.examsoffon.length, (index){
return Container( height:isMobile?325: 325,  width:isMobile?363: 215
,padding:isMobile?EdgeInsets.only():
 EdgeInsets.only(bottom: 24),  decoration: 
 BoxDecoration(color: Colors.white ,borderRadius: 
 BorderRadius.circular(16), border: Border.all(color:Color.fromARGB(255, 212, 221, 232),width: 1 ),
  boxShadow:  [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),]),
                child: 
      
      
      
      
      
      Wrap( children: [  
             ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:Stack(children: [ Image.asset(
          'assets/eg-ar-phy-g10-t1-cover1.png',
          fit: BoxFit.cover,
          width:isMobile?363: 363, 
          height: 157, 
        ),Positioned( top: 0 ,left: 0, right: 0, child:ExamCards() )
      ])),
      Container(width:isMobile?343: 215,height: 138,
      
      
      
      
      child: Column(children: [
        Container( width:isMobile?295: 167,
        child: Column(children: [
          Container(
            padding:isMobile? EdgeInsets.only(left: 24,right: 24,top: 8): EdgeInsets.only(top: 6,bottom: 6),
            child: Row(
              spacing: 8,mainAxisAlignment: MainAxisAlignment.start, children: [
              Text('${DateTime.parse(controller.examsoffon[index].startdate.toString()).day}/${DateTime.parse(controller.examsoffon[index].startdate.toString()).month}/${DateTime.parse(controller.examsoffon[index].startdate.toString()).year}' ,style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 6, 69, 152)),),
              Image.asset('assets/clock.png',width: 24,height: 24,)],),),
      Container(
            padding: EdgeInsets.only(top: 6,bottom: 6),
            child: Row(spacing: 8,mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              Text('من 5PM الي 6PM' ,style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 6, 69, 152)),),
              Image.asset('assets/clock.png',width: 24,height: 24,)],),)  
              
              ,
              
           Container(width:isMobile?295: 167,height: 50,child:TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:controller.startdate[index]==true?
                   Color.fromARGB(255, 181, 181, 181)
                 :Color.fromARGB(255, 6, 69, 152)   
         ,
                  shape: 
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                onPressed: 
              
              ()async{
              //   Navigator.push(context,MaterialPageRoute(builder:(context) {
              //   return ExamSolve(totalSeconds:  2 * 60,);
              // },)); 
            
    // );
Get.toNamed(
  Routes.EXAMSOLVE,
  arguments: {
    'totalSeconds': 2 * 60,
  },
);
      await controller.fetchUserQuestionExam(
    id: controller.examsoffon[index].id,
    
  );
            
       
              }, child: Text('ابدا دلوقتي',style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w500,
                color:
controller.startdate[index]==true?
              Color.fromARGB(255, 6, 69, 152):  
                 Color.fromARGB(255, 255, 255, 255)),)) ,)   
            ,   Text('صلاحية الامتحان : 20 ساعه',textAlign: TextAlign.start ,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Color.fromARGB(255, 181, 181, 181)),)],),),
         
        ],),
        ),
      ],),
  
    ) ;    
    })
      ])
  
 
   ), 
   

    
    
   
        
      
 ],) 

 ),
  
  
                              
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
SizedBox(height:400 ,),

 GradesTable(),
               Container( width:isMobile?343: 1120,
                              child: Container(
                              
                                decoration: BoxDecoration( 
                                   color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],         borderRadius: BorderRadius.circular(10),      border: Border.all(width: 1 ,
                                   color:Color.fromARGB(255, 245, 245, 245)
                                   ,
                                    )
                                   ),
                                
                                
                                width:isMobile?343: 1130,
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:isMobile?101: 116,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          
                                          
                                          backgroundColor: const Color.fromARGB(
                                              255, 6, 69, 152),
                                        ),
                                        onPressed: () {

   if (_currentPage > 1) {
        setState(() {
          _currentPage--;
        });
        controller.fetchCodes(page: _currentPage);
      }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/arrowleft.png',
                                                width:isMobile?10: 9.53, height:isMobile?10: 20),
                                            
                                            const Text(
                                              'التالي',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                    _buildPagination(controller, currentIndex,isMobile),
                                    
                                    Container(
                                      width:isMobile?101: 116,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          
                                          
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 6, 69, 152),
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                             if (_currentPage < 10) { 
        setState(() {
          _currentPage++;
        });
        controller.fetchCodes(page: _currentPage);
      }
                                        },
                                        child: const Text(
                                          'لاحق',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 61, 84, 110),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

  ]))

])
        ))



]))








  
  



  




  



















































       
            
            
      
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
width: !isMobile?1280:screenWidth,     
      child: Row(spacing: 1,
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
        
        
    
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


Widget _buildPagination(HomeController controller, int currentPage,isMobile) {
    int currentIndex = 1;
  return Container(width:isMobile?124: 292, child:SingleChildScrollView(scrollDirection: Axis.horizontal,child:   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(10, (index) {
      final pageIndex = index + 1;
      return   GestureDetector(
        onTap: () {
          
            currentIndex = pageIndex;
            controller.fetchCodes(page: pageIndex,); 
            // controller.update();
          
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
        
        )));
      
    }),)
  ));
}


class ExamCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String buttonText;
  final VoidCallback onPressed;

  const ExamCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.asset(
                "assets/exam.png", 
                width: 120,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.date_range, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(date, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(time, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text(buttonText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ExamCards extends StatelessWidget {
  const ExamCards({super.key});

  @override
  Widget build(BuildContext context) {
       final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
    return   Container(
      width:isMobile?343 :215, 
      height:isMobile? 138:91,
      decoration: BoxDecoration(
        
        gradient: const LinearGradient( 
          colors: [
            Color.fromRGBO(6, 69, 152, 0.884),   
            Color.fromRGBO(118, 162, 212, 0.952) 
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          
          
          
          
          
          
          
          
          
          

          const SizedBox(height: 8),

          
          const Text(
            "امتحان الشهر 8",
textDirection: TextDirection.rtl,            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 242, 195, 42),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          const Text(
            "اونلاين",
            style: TextStyle(
          fontWeight: FontWeight.w400 ,    fontSize: 14,
              color: Colors.white70,
            ),textDirection: TextDirection.rtl, 
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          
     ],
      ),
        );
  }
}
class GradesTable extends StatelessWidget {

  const GradesTable({super.key  } );

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(init: HomeController(), builder: (controller){

return 
    
     Container(
      
      
      
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "تفصيل درجاتك",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color:  Color.fromARGB(255, 6, 69, 152),
              ),
            ),
            const SizedBox(height: 12),

            SingleChildScrollView(
              
              child:Wrap (
             
              children:[ 
           Container(
              width: 770,height: 444, 
                   child: Wrap(alignment: WrapAlignment.center, children: [
   
                          Container( width: 770,height: 75,padding: EdgeInsets.fromLTRB(24, 15, 24, 15), 
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                        ,color: Color.fromARGB(255, 212, 221, 232)
                        ),
                          child:SingleChildScrollView(scrollDirection:Axis.horizontal, child: Row( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Container(width: 150,height: 45,
                        
                          child:Text('التفضيل'
                         ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
                         ,fontSize: 20,fontWeight: FontWeight.w500
                         ),
                         textAlign: TextAlign.center,) ,),  Container(width: 68,height: 45,
                        
                          child:Text('الحاله'
                         ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
                         ,fontSize: 20,fontWeight: FontWeight.w500
                         ),
                         textAlign: TextAlign.center,) ,),  
                           Container(width: 109,height: 45,
                        
                          child:Text('الدرجة'
                         ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
                         ,fontSize: 20,fontWeight: FontWeight.w500
                         ),
                         textAlign: TextAlign.center,) ,),                    
                  Container(width: 119,height: 45,
                        child:Text('التاريخ'
                         ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
                         ,fontSize: 20,fontWeight: FontWeight.w500
                         ),
                         textAlign: TextAlign.center,) ,      ),   
                             
                           
                            
                             Container(width: 124,height: 45,
                        
                          child:Text('نوع الامتحان'
                         ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
                         ,fontSize: 20,fontWeight: FontWeight.w500
                         ),
                         textAlign: TextAlign.center,) ,)    ,  
                        Container(width: 133,height: 45,
                        
                         child:Text('التدريب'
                         ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
                         ,fontSize: 20,fontWeight: FontWeight.w500
                         ),
                         textAlign: TextAlign.center,) ,)   ,  ],),
                          )  ,
),     ...List.generate(controller.examsoffon.length, (index){
      if(controller.examsoffon[index].grade!=0)
return SingleChildScrollView(scrollDirection:Axis.horizontal,child: Container(
    width: 770,
    height: 72,
  padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color.fromARGB(1, 245, 245, 245)),
      color: Color.fromARGB(255, 255, 255, 255),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0, 3),
          blurRadius: 13,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Container(
      width: 722,
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          
         
          
         
          Container(
            width: 150,
            height: 53,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 6, 69, 152),
                  ),
                ),
                backgroundColor: Color.fromARGB(255, 6, 69, 152),
              ),
              onPressed: () {
                controller.fetchUserQuestionExam2(id: controller.examsoffon[index].id);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Trueanswerexam();
              },));},
              child: Text(
                textAlign: TextAlign.center,
                'شوف امتحانك',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ) ,Container(
            width: 66,
            height: 45,
            child: Text(
              'يعاد',textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 6, 69, 152),
                fontSize: 16,
              ),
            ),
          ),Container(
            width: 93,
            height: 45,
            child: Text(
              '${controller.examsoffon[index].grade}/100',textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 6, 69, 152),
                fontSize: 16,
              ),
            ),
          ), Container(
            width: 124,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${DateTime.parse(controller.examsoffon[index].startdate.toString()).day}/${DateTime.parse(controller.examsoffon[index].startdate.toString()).month}/${DateTime.parse(controller.examsoffon[index].startdate.toString()).year}',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152),
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${DateTime.parse(controller.examsoffon[index].startdate.toString()).hour}:${DateTime.parse(controller.examsoffon[index].startdate.toString()).minute}:${DateTime.parse(controller.examsoffon[index].startdate.toString()).second} PM',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 6, 69, 152),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),Container(
            width: 90,
            height: 45,
            child: Text(
              '${controller.examsoffon[index].online==0?'اوفلاين':'اونلاين'}',textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 6, 69, 152),
                fontSize: 16,
              ),
            ),
          ),Container(
            width: 134,
            height: 45,
            child: Text(textAlign: TextAlign.center,
              '${controller.examsoffon[index].exam_type}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 6, 69, 152),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
      ));
      return Container();
      }  ),
              ])
        ),
  
        ]) ,) 

          ]
        
      
    )
     ,); 
   
    }); 
  }
}
