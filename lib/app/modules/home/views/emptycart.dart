import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';








class Emptycart extends StatelessWidget {
 
   var selectedSection = Rx<String?>(null);


   Emptycart({super.key
   });
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;

final int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  @override
  Widget build(BuildContext context) {
          
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
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
              Image.asset('assets/Group 87935.png', width: 55),
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
                    Image.asset('icons/Vector (3).png',width: 40,height: 41,),
                    Image.asset('icons/Vector (2).png',width: 39.02,height: 40,)
                    
                    
                    
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
                      Image.asset('assets/Group 87935.png', width: 55),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      body:
      
      GetBuilder<HomeController>( 
      builder: (controller){

          
          
          
        
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
            
            const SizedBox(height: 50,),
        
          SizedBox( width: double.infinity,
           child:   Column(
            crossAxisAlignment:isMobile?CrossAxisAlignment.center: CrossAxisAlignment.end,
            children: [  
              _buildTeacherInfo(isMobile,screenWidth),
            SizedBox(
              width:isMobile?375: double.infinity,
    
            
            
            
            
            
        child:controller.cart.isNotEmpty? SizedBox( width: 
 1820,    child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
         isMobile?Container():     RightSidebar()
              ,
              SizedBox(width: 10,)
              ,Expanded(child: 
Container(
          width: !isMobile ? 756 : 375,child:
               Column(crossAxisAlignment:isMobile?CrossAxisAlignment.center: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
               children: [
                 Container(padding:isMobile?EdgeInsets.only(bottom: 24,left: 16,right: 16,top: 24): EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),

)
,child:
Column(
  spacing: 16,
  crossAxisAlignment:isMobile?CrossAxisAlignment.center: CrossAxisAlignment.start,
  children: [
SizedBox(width:isMobile?311: 771,child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 
  
   Text(textAlign: TextAlign.start,'طلباتك',style:
TextStyle(color:Color.fromARGB(255, 6, 69, 152)
,fontSize: 36,fontWeight: FontWeight.w600
  ),
  
  
  ),
  
  TextButton(onPressed: (){},style: TextButton.styleFrom(

    backgroundColor: Color.fromARGB(255, 236, 238, 241),
    shape:RoundedRectangleBorder
    (
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color:Color.fromARGB(255, 6, 69, 152)
    ,width: 1)
  
  ) ),
   child: Text('مشاركت تتبع الطلب',style: 
  TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontWeight: FontWeight.w500,fontSize: 18
  ),

  ))
  
 
  
  ],) 
   ),
 
 

SizedBox( width: 311,child: Column(
  
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

  Text('تتبع طلبك',textAlign: TextAlign.start,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
 ,fontWeight: FontWeight.w500 ,fontSize: 20  
  ),),
  Text('رقم الطلب: #165278',textAlign: TextAlign.start,
  style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
 ,fontWeight: FontWeight.w500 ,fontSize: 20  
  ),),
  Text('تاريخ الطلب:1ديسمبر2024',textAlign: TextAlign.start
  ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
 ,fontWeight: FontWeight.w500 ,fontSize: 20  
  ),)
],),)
,

SizedBox( width: 771,child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

  Row( crossAxisAlignment: CrossAxisAlignment.center,spacing: 258,

  mainAxisAlignment: MainAxisAlignment.center
  , children: [
  Container(decoration: BoxDecoration( color: Color.fromARGB(255, 235, 239, 249),
  borderRadius: BorderRadius.circular(8)
  ),
   
    width:isMobile?311: 771,height: 65,
  child:Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center, children: [
    Container(width:isMobile?77.75: 169, height: 65,     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color.fromARGB(255, 6, 69, 152)),
  padding:isMobile? EdgeInsets.only(): EdgeInsets.fromLTRB(24, 4, 24, 4),
  child:Column(
    
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Container(
        width: 77.75,
        child:Wrap(children: [Text('تم استلام طلبك',
  
  textAlign: TextAlign.center,style: TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),fontSize: 12),) ],)    ,)
  ]) ,
  ),
    Container(

  padding:isMobile?EdgeInsets.all(8): EdgeInsets.fromLTRB(24, 4, 24, 4),
  width:isMobile?77.75: 169,child:Wrap(children: [ 
  Text('طلبك في الطريق اليك',textAlign: TextAlign.center,style: TextStyle(
    
    fontSize: 12,
  color: Color.fromARGB(255, 6, 69, 152)),),],),

  ),
  
    Container( width:isMobile?77.75: 169,
  padding:isMobile?EdgeInsets.all(8) :EdgeInsets.fromLTRB(24, 4, 24, 4),
  child:Wrap(children: [ Text('طلبك علي قيد التجهيز',textAlign: TextAlign.center,style: TextStyle(
fontSize: 12,  color: Color.fromARGB(255, 6, 69, 152)),),],)
  ),
    Container(width:isMobile?77.75: 169,
  padding:isMobile?EdgeInsets.all(8): EdgeInsets.fromLTRB(24, 4, 24, 4),
  child:Wrap(children: [Text('تم استلام طلبك',textAlign: 
  TextAlign.center,style: TextStyle(fontSize: 12,
  color: Color.fromARGB(255, 6, 69, 152)),),],) 
  ),
  ],) 
  ),

    



]
  ,) 

,SizedBox(width:isMobile?311: 771,child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

  Text('تفصيل طلبك',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontSize: 24,fontWeight: FontWeight.w500),

  
  
  ),
  SizedBox(width:isMobile?311: 771,height: 104,child:

   Wrap(
    alignment: WrapAlignment.spaceBetween,
    children: [
SizedBox  (width:isMobile?311: 214.67, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

  Text('عنوانك',style: TextStyle(color:Color.fromARGB(255, 6, 69, 152)
  ,fontWeight: FontWeight.w500,fontSize:20
  ),
  
  )
 , SizedBox(width:isMobile?311: 218,child: Wrap(alignment: WrapAlignment.start, children: [Text(
  style: TextStyle(color: Color.fromARGB(255, 80, 124, 181),),textAlign: TextAlign.start,
  '134-شارع محمد احمد -مدينه نصر -بجانب صيدليه مريم  القاهره')],),)
],),)
 ,
SizedBox  (width:isMobile?311: 214.67, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

  Text('الحاله',textAlign: TextAlign.start,style: TextStyle(
  
    color:Color.fromARGB(255, 6, 69, 152)
  ,fontWeight: FontWeight.w500,fontSize:20
  ),
  
  )
 , SizedBox(width:isMobile?311: 218,child: Wrap(alignment: WrapAlignment.start,children: [Text(textAlign: TextAlign.start,
  style: TextStyle(color: Color.fromARGB(255, 80, 124, 181),),
  'جاهز للتسليم إلى الشريك اللوجستي')],),)
],),)
 ,
SizedBox  (width:isMobile?311: 214.67, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

  Text('الخط الزمني',style: TextStyle(color:Color.fromARGB(255, 6, 69, 152)
  ,fontWeight: FontWeight.w500,fontSize:20
  ),
  
  )
 , SizedBox(width:isMobile?311: 218,child: Wrap(alignment: WrapAlignment.start,children: [Text(textAlign: TextAlign.start,
  style: TextStyle(color: Color.fromARGB(255, 80, 124, 181),),
'تم الاستلام يوم الاربعاء 5 ديسمبر 2024 ')],),)
],),)
 ,
  ],)
  ,)
  
,SizedBox(height: 100,),
Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  SizedBox(width:isMobile?311: 231,height: 44,
child: TextButton( onPressed: (){

 Emptycart();
  controller.fetchCart();controller.clearCart();controller.update();

},style: 
TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 6, 69, 152)
,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
), child: Text('الغي الطلب'

,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)
,fontSize: 18,fontWeight: FontWeight.w500
),
),
) ,
)],)

,
],))

],)

,),

SizedBox(width:isMobile?311: 771,child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [Text('المعاملات',style: TextStyle(
  color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 24,fontWeight: FontWeight.w500
  ),)
  ,])),
    
     ...List.generate(controller.cart.length,(index){
      controller.fetchCart();
       return    Container( 
    padding:isMobile?EdgeInsets.only(): EdgeInsets.fromLTRB(24, 16, 24, 16),
    width:isMobile?311: 768,decoration: BoxDecoration
  (border: Border.all(width: 2,color
  :Color.fromARGB(255, 6, 69, 152) 
  )
  ,borderRadius: BorderRadius.circular(8)

  
  ),
   child: Column(
   spacing: 8,
   children: [
Wrap(alignment: WrapAlignment.spaceBetween,
 children: [
  
   SizedBox(width:isMobile?250: 680,child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [ 
         Image.asset('assets/ashtarlogo.png',width: 40,height: 40,) ,
SizedBox(child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('ملازمة المراجعة'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)

,fontSize: 24,fontWeight: FontWeight.w500
),
)

,Text('الترم التاني (الصف الثالث الثانوي) ',
style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 14,fontWeight: FontWeight.w400


),),

],),),

  ],),),
SizedBox(
  height: 57,
  child:
  Column(spacing: 8,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
     Container( decoration: BoxDecoration
    (
      color: Color.fromARGB(255, 235, 239, 249),
      borderRadius: BorderRadius.circular(50)
    
    ),
      width: 32,height: 32,
      child:InkWell(child:Icon(Icons.delete_outline,color
  :Color.fromARGB(255, 6, 69, 152) ,size:18 ,)  ,
  onTap: (){
    controller. deletefromcart(controller.cart[index].id.toString());
 controller.fetchCart();

  
  
    


  
  },
  ) ,)
   
],))

],)


,
 SizedBox ( width:isMobile?311: 720,child:Wrap(
  alignment: WrapAlignment.start,
  children: [
  
  Text('250 ج .م',style: TextStyle(color:
 Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 20,fontWeight: FontWeight.w600)
 ),
   Text(' ج .م950}'

,style: TextStyle(color:Color.fromARGB(255, 80, 124, 181)


 ),


),


],))
    
   ],) );
})
  ],),)])) )


       
            
            

     
                        
      
    
    
       
       
       
       ])): SizedBox(width:isMobile?375: 851,    child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:isMobile?MainAxisAlignment.center: MainAxisAlignment.start,
            children: [
           isMobile?Container():   
RightSidebar()
,SizedBox(width: 10,)  ,
 
                 Expanded(child: 
Container(alignment: Alignment.center,
          width: !isMobile ? 756 : 375,child:
               Column(crossAxisAlignment:isMobile?CrossAxisAlignment.center:
                CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(padding:isMobile?
                 EdgeInsets.only(): EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),

),child: 
Wrap(
  alignment:isMobile?WrapAlignment.center: WrapAlignment.start,
  
  children: [
    
  SizedBox( width:!isMobile ?676:343
,child: 
Column(
  
  
  

  children:[
   SizedBox( width:!isMobile ?676:343,child:  Column(
      crossAxisAlignment:isMobile?CrossAxisAlignment.center: CrossAxisAlignment.start,
      children: [Text('طلباتك',textAlign:isMobile?TextAlign.center: TextAlign.start
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600,
)
   ,)],))
    ,Column(
  crossAxisAlignment: CrossAxisAlignment.center
  ,mainAxisAlignment: MainAxisAlignment.center,
  children: [Image.asset("assets/Frame (3).png",width: 249,height: 246,)],),
  Wrap(
    alignment: WrapAlignment.center,
    children: [ Text('مفيش طلب ليك دلوقتي',style: TextStyle(
  fontSize: 36,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 6, 69, 152)),)],)

 ,  Wrap(
    alignment: WrapAlignment.center,
    children: [ 
 Text('يلا شوف ايه اللي محتاجه في المنهج و الحق اشتريه !!!',style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 6, 69, 152)),)])
 
 
  ]) 
,)  
,
 
 Container(width:isMobile?311: 770






  


























            












          






          






      






           











  




























      



















              

              






              




         





 




























      



















              

              









              











       







         







  
 




                              












































































































   




 ),
  
  
                              
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
 SizedBox(width:isMobile?311: 676, 
 
 child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  
  Text('المعاملات السابقة',style:
  TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontWeight: FontWeight.w500,
  fontSize: 24
  ),)
  ],),)
 ,
 SizedBox(width:isMobile?311: 673,
 child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ...List.generate( controller.attach.length,(index){return
 Container(width:isMobile?311: 673,
 padding:isMobile?EdgeInsets.only(): EdgeInsets.all(24),
 child: Wrap(alignment:WrapAlignment.start,  children: [
 
 
  SizedBox(width:isMobile?311:358,height:101,
  child:SizedBox(width:isMobile?311:358,height: 82,child:
 Row(
  
  mainAxisAlignment: MainAxisAlignment.start, spacing: 24
  ,crossAxisAlignment: CrossAxisAlignment.center, children:[
    Image.asset('assets/mybooks.png',width: 77,height: 79,)
    ,
    Column(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
     children: [
      Text('ملازمة المراجعه',style: TextStyle(
        fontSize: 24,fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 6, 69, 152)),
      ),
      Text('الترم التاني (الصف الثالث الثانوي)',style: TextStyle(
        fontSize: 14,fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 6, 69, 152)),
      )
      
      
      ],),
      
    ])))
 
  ,SizedBox(width: 47,),
   
   SizedBox(width:isMobile?311: 220,
 child: Column(
  spacing:18,
  children: [
Row(
  mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
  children: [

  Text('ج.م',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 24,fontWeight: FontWeight.w500,
  ),
   ),
  Text('255',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 24,fontWeight: FontWeight.w500,
  ),
   ),
   Stack(children:[Container(child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text('ج.م',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 15,fontWeight: FontWeight.w400,
  ),
   ),  Text('950',style: TextStyle(
    fontSize: 20,fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 80, 124, 181)),)
   ],),) 
    ,Positioned(top: 15,right: 0, child: Container(width: 100,height: 1,
    color: Colors.black,
    ))
    
    ])
],)
,Container(width:isMobile?311: 220,height: 44,decoration: BoxDecoration(
  color: Color.fromARGB(255, 6, 69, 152)
  ,borderRadius: BorderRadius.circular(8)
  ),child: TextButton(onPressed: (){
     controller.      addattachtocart( id: controller.attach[index].id!);
    print(controller.attach[index].id!);
        
       controller.fetchCart();
  }, child: 
  Text('اضف للسلة',style:
   TextStyle(color: Colors.white,
   fontSize:18 ,fontWeight: FontWeight.w500
   ),
   
   )),
  )
 ]))
  
  

 
  ]) );
    })
  ],),
 )
  ]))
               ])
)

                 )
]))

,  ),         
        
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
width: !isMobile?1280:375,     
      child: Row(spacing: 1,
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
        
        
    
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
        
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
                      const SizedBox(height: 16),
                      _buildInfoRow('icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms (1).png', 'support@ashtar.app'),
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
                      Row(
                mainAxisAlignment: MainAxisAlignment.start,        children: [
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
                          'assets/Group 87935.png',
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


