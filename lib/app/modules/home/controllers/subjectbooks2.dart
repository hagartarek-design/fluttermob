import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/pdf.service%20copy.dart' show LessonPdfViewer3;

import 'package:my_app/app/modules/home/views/addedto.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/schedule_el_malazem.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';








class subjectBooks2 extends StatefulWidget {
  const subjectBooks2({super.key});

  @override
  State<subjectBooks2> createState() => _suState();
}

class _suState extends State<subjectBooks2> {
 
 var searchText = ''.obs;
  
  
  var selectedSection = Rx<String?>(null);


final int _currentPage=0;
  @override
  Widget build(BuildContext context) {
TextEditingController searchController=TextEditingController();
          
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
bool isSelected=false;
bool isSelected1=false;
bool isSelected2=true;
PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);
 @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {}); 
    });
  }
  
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
      
      GetBuilder<HomeController>(  builder: (controller){
  
  
  
        TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;
  
  


          
          
          
        
    return  LayoutBuilder(
      
        builder: (  BuildContext context, BoxConstraints constraints,) {




final filteredList = controller.attachment.where((item) {
  final searchText = controller.searchText.value.toLowerCase();
  final cycleText = item.cycle.toString().toLowerCase();
  return cycleText.contains(searchText);
}).toList();



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
            _buildTeacherInfo(isMobile,screenWidth,context),
            const SizedBox(height: 20),
            
            
            
            
            
           
       
            
            

     
            const SizedBox(height: 20),



           SizedBox(width:screenWidth * 0.95 ,
           child: Column(
            spacing: 32,
            children: [
              SizedBox( width:isMobile?343: screenWidth * 0.95,height: 40,
              child:Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
              SizedBox(
                width: 173,height: 44,
                child:   TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Schedule_el_malazem();
                  }));
                },
                style:TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 6, 69, 152),
                  shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(8))) ) , child: Text('منافذ البيع',style:
                 TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                ),

              ),
                Text('احجز ملازمك',style: 
              TextStyle(color: Color.fromARGB(255, 6, 69, 152)
              ,fontSize: 32,fontWeight: FontWeight.w600
              ),textAlign: TextAlign.start,

        
              )],)
            
             ,
               
              )
          ,
                  
                  Wrap( alignment: WrapAlignment.start, children: [     
                     Container(width:isMobile?343: 642,height:isMobile?72: 44,
             decoration: BoxDecoration(
             
             color: 
              Color.fromARGB(255, 235, 239, 249),
              border: 
             Border.all(width: 1,color: Color
             .fromARGB(255, 6, 69, 152)),borderRadius:
              BorderRadius.all(Radius.circular(8))),
             child:
             
             
             Wrap( spacing:isMobile? 14:0,
              alignment: WrapAlignment.start,
              children: [
          
           InkWell(child:    Container(
              width:isMobile?103.67: 213,
              height:isMobile?70: 44,
              padding: EdgeInsets.fromLTRB(15, 4,15, 4)
            ,
             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))
            ,color:selectedSection.value!='offline'?
              Color.fromARGB(255, 235, 239, 249): Color.fromARGB(255, 6, 69, 152),
            )
             ,child: Wrap(
          alignment: WrapAlignment.center,
             children: [
                   Text(isMobile? 'الاوفلاين':'الملازم الاوفلاين ',style: TextStyle(
                  
                    color:  selectedSection.value!='offline'?
             Color.fromARGB(255, 6, 69, 152):  Color.fromARGB(255, 235, 239, 249)
                    ,fontSize: 20,fontWeight: FontWeight.w500
                    ),
                    
                    )
              ,Image.asset('assets/Group_1.png',width: 29,height: 29,)
             ],),),onTap: ()async{
              selectedSection.value = selectedSection.value == 'offline' ? null : 'offline';
              await controller.attachments(status: 'offline');
             },)
           ,  
            InkWell(child:Container(  width:isMobile?103.67: 213,
              height:isMobile?70: 44
              ,padding: EdgeInsets.fromLTRB(15, 4, 15, 4)
            , decoration: BoxDecoration(
              color: selectedSection.value=='online'?  Color.fromARGB(255, 6, 69, 152):Color.fromARGB(255, 235, 239, 249),
              borderRadius: BorderRadius.all(Radius.circular(8))
            
            )
             ,child:
  Wrap(
             alignment: WrapAlignment.start,
             children: [
                   Text(isMobile?'الاونلاين' :'الملازم الاوملاين',style: TextStyle(
                  
                    color:selectedSection.value=='online'? Color.fromARGB(255, 235, 239, 249): Color.fromARGB(255, 6, 69, 152)
                    ,fontSize: 20,fontWeight: FontWeight.w500
                    ),
                    
                    )
              ,Image.asset('assets/Frame.png',width: 29,height: 29,)
             ],),) ,onTap: ()async{
selectedSection.value = selectedSection.value == 'online' ? null : 'online';
            await  controller.attachments(status: 'online');
             }, )  
             ,  InkWell(child:   Container(
                width:isMobile?103.67: 213,
              height:isMobile?70: 44,
              padding: EdgeInsets.fromLTRB(25, 4, 25, 4)
            , decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))
            ,color: selectedSection.value=='all'? Color.fromARGB(255, 6, 69, 152):Color.fromARGB(255, 235, 239, 249)
            )
             ,child: Wrap(
             alignment: WrapAlignment.center,
             children: [
                   Text(isMobile?'الكل': 'كل الملازم',style: TextStyle(
                    
                    color:  selectedSection.value=='all'?  Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152)
                    ,fontSize: 20,fontWeight: FontWeight.w500
                    ),
                    
                    )
              ,Image.asset('assets/Group.png',width: 29,height: 29,)
             ],),),onTap: ()async{await controller.attachments();
             selectedSection.value = selectedSection.value == 'all' ? null : 'all';
             },)
             ,
             ],) ,
            
             ),


          Column(
           children: [
    Padding(
      padding: const EdgeInsets.only(top:  8.0,bottom: 8.0),
      child: TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: '',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {setState(() {
          controller.updateSearch(value);
        });} 
      ),
    ),
  ],
)
               ,
         Wrap(
      spacing: 10,
      runSpacing: 10,
      
       
  
  
    
      
      
      
    children:  [     
  
  
  
    
    
    

    
    
    
    
    ListView.builder(
        shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(), 
  itemCount: filteredList.length,
              itemBuilder: (context, index) {final item = filteredList[index];
return 

Column(

  children: [
    Wrap(alignment: WrapAlignment.center,spacing: 8, children: [
  
     Stack(
 
   children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/malazm.jpg', width: 268, height: 396),
      ),
      
      Positioned(
        top: 1, right: 1, left: 1, bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(1, 255, 255, 255),
          ),
        ),
      ),
      
      Container(
        width: 268, height: 128,
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
              Color.fromARGB(255, 6, 69, 152),
              Color.fromARGB(171, 118, 162, 212),
            ],
          ),
        ),
        child: SizedBox(
          width: 236, height: 49,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              
              Text(
                item.cycle.toString(), 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    ' فيديوهات-${item.totalExamAssignment}\n PDF 2-\n${item.totalExamAssignment} - امتحانات و واجبات',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 326, left: 24,
        child: SizedBox(
          width: 220, height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:item.isUsed==true? Color.fromARGB(255, 6, 69, 152):Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            onPressed: ()async {
            
          












    
























       item.isUsed==true? Navigator.push(context, MaterialPageRoute(
        builder: (context){
          controller.fetchCart();
    controller.      addattachtocart( id: item.id!);
    print(item.id!);
        return Addedto();
       })):
       Navigator.push(context,MaterialPageRoute(builder: (context){
        return LessonPdfViewer3(lessonId: 1, totalPages: 1,  index: index, lesson: 1);
       }))  ;
        },
            child: Text(
            item.isUsed==true?  'اضف للسله':'شوف الpdf',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color:item.isUsed==true? Color.fromARGB(255, 255, 255, 255): Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
        ),
      
    
  

)
] 
      

                  


                    










                  






                    























                   
                  
                    
                    
                    

           










                      

                      

                  


                    










                  






                    























                   
                  
                    
                    
                    

           






                   




                      

                      


                  


                    










                  






                    























                   
                  
                    
                    
                    

           










                      

                      

                      
                      
                      





                  

                  


                    










                  






                    























                   
                  
                    
                    
                    

           










                      

                      

                  


                    










                  






                    























                   
                  
                    
                    
                    

           










                      

                      

                  


                    










                  






                    























                   
                  
                    
                    
                    

           






                   




                      

                      


                  


                    










                  






                    























                   
                  
                    
                    
                    

           










                      

                      

                      
                      
                      

               








                  



               
               

                
                

  
           )])
   , SizedBox(height: 8,)],);
})
],),
          
        
    ])])),
     const SizedBox(height: 24,),
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
    return Column(
      
      children: [ 
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
    return SizedBox(
width: !isMobile?1280:343,     
      child: Wrap(spacing: 1,
      runAlignment:WrapAlignment .center,
        alignment: WrapAlignment.start,
        children: [
          InkWell(child: Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),)  ,onTap:(){ 
          Navigator.push(context,MaterialPageRoute(builder: (context){
          return Homeafterlogin();
        }));})
          , 
        
           Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      
        InkWell(
          
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return Subjecttype();}));
          },
          child: Text('الصف الثالث الثانوي',style: 
        TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),),),
       
          Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
      InkWell(
        onTap: (){
         Navigator.push(context,MaterialPageRoute(builder: (context){
          return Subjectbooks();
        }));
        },
        child: Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 181, 181, 181),
       ) ),),
        
        
          Text('احجز ملازمك',style: TextStyle( fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 6, 69, 152)),
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          )
        
        
        
         ,     
        
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


