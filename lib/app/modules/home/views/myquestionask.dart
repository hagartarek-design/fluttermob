import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/trueAnswerExam.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';

import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/modules/home/views/textfield.dart';

import '../../../models/wallet.dart';
import 'exam_solve.dart';
import 'myquestions.dart';
import 'wallet_cart.dart';






class MyQuestionAsk extends StatefulWidget {
  const MyQuestionAsk({super.key});

  @override
  State<MyQuestionAsk> createState() => _MyexamState();
}

class _MyexamState extends State<MyQuestionAsk> {
bool isLoading = false;

bool isSelected=true;

bool isSelected2=false;






   var selectedSection = Rx<String?>(null);


  
  
  
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;

final int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
var selectedMethod=''.obs;
  @override 
  Widget build(BuildContext context) {
  
  final int maxLength = 500;
  final FocusNode focusNode = FocusNode();














    int currentPage=0;
  
  
          
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);  int currentIndex = 1;
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
, 


SizedBox(width: 
isMobile?343: 1820,    child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:isMobile?MainAxisAlignment.center: MainAxisAlignment.end,
            children: [ 
isMobile?Container():

RightSidebar()
 ,             
              
              
              
              
              
         Expanded(child:      
                 Container( width:!isMobile?850:343 ,height: 1252,
                 padding:
                
                
     isMobile?     EdgeInsets.fromLTRB(16, 8, 16, 8) :       EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),

)
,child: 
Wrap(alignment: WrapAlignment.start,spacing: 24,
  
  children: [
    
  SizedBox(width:!isMobile ?770:311, 
  
 
  child:Text("اسال المدرس",textAlign: TextAlign.start
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize:isMobile?26: 32,fontWeight:isMobile?FontWeight. w500: FontWeight.w600,
)
 ,),
) 

,
 SizedBox(height:isMobile?16: 24,),
 SizedBox( width:isMobile?311: 770
 ,child: 
     Column( crossAxisAlignment: CrossAxisAlignment.start,
   spacing:isMobile?16: 24,
      
      
      children: [
  SizedBox(width:isMobile?311: 770,child: Wrap(alignment: WrapAlignment.spaceBetween,
    
    children: [
   Container(width:isMobile? 122:173,
   child:    TextButton(
    
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor:  Color.fromARGB(255, 6, 69, 152),
    padding:isMobile?EdgeInsets.only(): EdgeInsets.fromLTRB(24, 10, 24, 10)
    ),
    onPressed: (){

      Navigator.push(context, MaterialPageRoute(builder: (context){return Myquestions();}));
    }, child: Text('اسال سؤالك',style: TextStyle(fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 255, 255, 255)),)),
   )

    ,SizedBox(width:isMobile?141: 414,child:
    Text('تفصيل الاساله',textAlign: TextAlign.end,style: TextStyle(
      fontSize: 24,fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 6, 69, 152)),) ,) 
  ],),) 
  
  
  
  

  
,SizedBox(width:isMobile?311: 770,child: Column(children: [
  Container(width:isMobile?311: 770,height: 60,
  
  decoration: BoxDecoration(
         boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0, 3),
          blurRadius: 13,
          spreadRadius: 0,
        ),
      ],borderRadius: BorderRadius.circular(10),
    color: Color.fromARGB(255, 212, 221, 232)),
  child: Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
Container(width:722,height: 45,decoration: BoxDecoration(borderRadius: 
BorderRadius.only(topLeft:Radius.circular(16),topRight: Radius.circular(16)
)), child:SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
children: [
Container(width:isMobile?130: 140,height: 
45,
padding:isMobile?EdgeInsets.only(left: 8,right:8,top: 10,bottom: 10) :EdgeInsets.all(10),

child: Text('التفاصيل',textAlign: TextAlign.center
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 20,fontWeight: FontWeight.w500
  )
),
),

  SizedBox(width: 10,),
  Container(width:130 ,height: 45,padding: EdgeInsets.all(10),
  child: Text('تاريخ السوال ',textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 20,fontWeight: FontWeight.w500
  ),),
  ),
  SizedBox(width: 10,),
  
Container(padding:isMobile?EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 10): EdgeInsets.all(10),width:isMobile?113: 213,height: 45,
 child: Text('الدرس',textAlign: TextAlign.center,style:TextStyle( color: Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 20,fontWeight: FontWeight.w500
 
 ),),),
   SizedBox(width: 10,)
,  Container(padding:isMobile?EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 10): EdgeInsets.fromLTRB(10, 10,9, 10),width:isMobile?140: 155,height: 45,
child: Text('الحاله',textAlign: TextAlign.center ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 20,fontWeight: FontWeight.w500
 ),),
),
 ],)))
  ],),
  )
,
Container( width: 770,
decoration: BoxDecoration(   boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0, 3),
          blurRadius: 13,
          spreadRadius: 0,
        ),      ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.all(width: 1,
        color: Color.fromARGB(255, 245, 245, 245)),
      ) ,
      
        
        child:
          
          SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child:
          
                    Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

 Container(
  child: TextButton( style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
      shape: RoundedRectangleBorder(
        side:BorderSide(width: 1,color: Color.fromARGB(255, 6, 69, 152)) ,
        borderRadius: BorderRadius.circular(8)),
      backgroundColor:  Color.fromARGB(255, 6, 69, 152)),
    onPressed: (){}, child: 
    Text('شوف سؤالك',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)
    ,fontWeight: FontWeight.w500,
    fontSize: 18
    ),)),),
   Padding(padding:EdgeInsets.fromLTRB(24, 10, 24, 10),
   child: 
   SizedBox(width: 130,height: 60,child: Wrap(
    alignment: WrapAlignment.center,
    children: [Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [Text('12102024',)
   ,Text('4:30PM')],) 
   ],),)  ),     
    Padding(padding: EdgeInsets.all(10),child:Container( width: 213,height: 60
    ,alignment: Alignment.center,
    child: Text("شحن المحفظه",),
    ) ,) ,     SizedBox(width: 155,height: 60,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
        Text('مغلق',textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 222, 61, 49)
        ,fontWeight: FontWeight.w500,fontSize: 16
        ),)
        ,Image.asset('assets/wrong.png',width: 20,height: 20,)
        ],),
        )
   
     ,
],)

           ,)


),
      


             SizedBox( width:isMobile?311: 721,
                              child: Container(
                              
                                decoration: BoxDecoration( 
                                   color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],         borderRadius: BorderRadius.circular(10),     
                 border: Border.all(width: 1 ,
                                   color:Color.fromARGB(255, 245, 245, 245)
                                   ,
                                    )
                                   ),
                                
                                
                                
                                width:isMobile?311: 721,
                                height:isMobile?44: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:isMobile?87: 116,
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
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/arrowleft.png',
                                                width:isMobile?6: 9.53, height: 20),
                                            
                                             Text(
                                              'التالي',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize:isMobile?12: 18,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                               
                                  _buildPagination(controller, currentIndex,isMobile),  
                                    
                                    SizedBox(
                                      width: isMobile?79: 116,
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
                                          if (currentIndex > 0) {
                                            setState(() {
                                              currentIndex--;
                                            });
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
                        
  
            
            
                              
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
                        
              
],),)
,  ]))
  
  
                              
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ,SizedBox(width:isMobile?311: 770,child: Column(
    spacing: 24,crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Text('جروب الدفعة',textAlign: TextAlign.start,style: TextStyle(
  fontSize: 32,fontWeight:isMobile?FontWeight.w500: FontWeight.w600,
  color: Color.fromARGB(255, 6, 69, 152)),),
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
 SizedBox( width:isMobile?311: 770,child: Column(
  spacing:isMobile?16: 12,crossAxisAlignment:CrossAxisAlignment.center,
  children: [

  SizedBox(width:isMobile?311: 770,child: Row(
    
    
    children: [
Image.asset('assets/Frame1597883416.png',width: 122,height: 122,) 
,
      SizedBox( width:isMobile?177: 636,child:Column(
        spacing: 12,
        children: [
      SizedBox(width:isMobile?177: 636,child:Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('جروب الفيسبوك',textAlign: TextAlign.start,style: TextStyle(color: 
        Color.fromARGB(255, 6, 69, 152),fontSize: 24
,fontWeight: FontWeight.w500        ),)
        ,Wrap(children: [
          Container(width: 177,child:  Text(textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
           fontWeight: FontWeight.w400, 
          color: Color.fromARGB(255, 80, 124, 181)),textAlign: TextAlign.start,
          'دلوقتي تقدر تدخل جروب الفيسبوك المدرس في اي وقت و تستفيد من اساله زميلك') ,)
        ],) 
        
          
          ],)) ,
          
          Wrap(alignment: WrapAlignment.start,children: [       
             SizedBox(width: 173,height: 44,
          
          
   child:   TextButton(
    
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)),
      backgroundColor:   Color.fromARGB(255, 6, 69, 152)),
     onPressed: (){}, child: Text('دخول',style: TextStyle(fontSize: 18
     ,fontWeight: FontWeight.w500,
color: Color.fromARGB(255, 255, 255, 255)     
     ),))
          ) ,
     ],)
   ],)),



],),),
 
  SizedBox(width:isMobile?311: 770,child: Row(mainAxisAlignment: MainAxisAlignment.center,
    spacing: 12,
    children: [

Image.asset('assets/Frame1597883415.png',width: 122,height: 122,) 
,
      SizedBox( width:isMobile?177: 636,child:Column(
        spacing: 12,
        children: [
      SizedBox(width:isMobile?177: 636,child:Column(
        spacing: 12,crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Text('جروب التليجرام',textAlign: TextAlign.end,style: TextStyle(color: 
        Color.fromARGB(255, 6, 69, 152),fontSize: 24
,fontWeight: FontWeight.w500        ),)
        ,Wrap(children: [Container(width: 177,child: Text(textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
           fontWeight: FontWeight.w400, 
          color: Color.fromARGB(255, 80, 124, 181)),textAlign: TextAlign.end,
          'دلوقتي تقدر تدخل جروب الفيسبوك المدرس في اي وقت و تستفيد من اساله زميلك'),) ],) 
        
          
          ],)) ,
          
          Wrap(alignment: WrapAlignment.start,children: [        SizedBox(width: 173,height: 44,
          
          
   child:   TextButton(
    
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)),
      backgroundColor:   Color.fromARGB(255, 6, 69, 152)),
     onPressed: (){}, child: Text('دخول',style: TextStyle(fontSize: 18
     ,fontWeight: FontWeight.w500,
color: Color.fromARGB(255, 255, 255, 255)     
     ),))
          ) ,
     ],)
   ],)),


],),),
 
  SizedBox(width:isMobile?311: 770,child: Row(
    spacing: 12,mainAxisAlignment: MainAxisAlignment.center,
    children: [
Image.asset('assets/Frame1597883415_1.png',width: 122,height: 122,) 
,

      SizedBox( width:isMobile?177: 636,child:Column(
        spacing: 12,
        children: [
      SizedBox(width:isMobile?177: 636,child:Column(
        spacing: 12,crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Text('جروب الوتساب',textAlign: TextAlign.end,style: TextStyle(color: 
        Color.fromARGB(255, 6, 69, 152),fontSize: 24
,fontWeight: FontWeight.w500        ),)
        ,Wrap(children: [
          Container(width: 177,child:Text(textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
           fontWeight: FontWeight.w400, 
          color: Color.fromARGB(255, 80, 124, 181)),textAlign: TextAlign.end,
          'دلوقتي تقدر تدخل جروب الفيسبوك المدرس في اي وقت و تستفيد من اساله زميلك') ,)
          ],) 
        
          
          ],)) ,
          
          Wrap(alignment: WrapAlignment.start,children: [        SizedBox(width: 173,height: 44,
          
          
   child:   TextButton(
    
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)),
      backgroundColor:   Color.fromARGB(255, 6, 69, 152)),
     onPressed: (){}, child: Text('دخول',style: TextStyle(fontSize: 18
     ,fontWeight: FontWeight.w500,
color: Color.fromARGB(255, 255, 255, 255)     
     ),))
          ) ,
     ],)
   ],)),


],),),
 
 
 ],),)
 
  ],),]))
  ]))

































         )
])





)








  
  



  




  



















































       
            
            
      
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
        SizedBox(
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
    return SizedBox(
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


Widget _buildPagination(HomeController controller, int currentPage,isMobile) {
    int currentIndex = 1;
  return Container(width:isMobile?135: 290,child: 
   SingleChildScrollView(scrollDirection: Axis.horizontal,
  child:  Row(spacing: 2,
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(10, (index) {
      final pageIndex = index + 1;
      return GestureDetector(
        onTap: () {
          
            currentIndex = pageIndex;
            controller.fetchCodes(page: pageIndex,); 
            controller.update();
          
        },
        child: Container(
          
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
  )));
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
    return   Container(
      width: 215, 
      height: 91, 
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
