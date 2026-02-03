import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/views/Schudle_for_the_exam%20.dart';
import 'package:my_app/app/modules/home/views/examResult_answer_sheet.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';
import 'package:my_app/app/modules/home/views/schedule_center.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'mainpage copy 2.dart';
import 'settings.dart';
class Homeafterlogin extends StatefulWidget {
  const Homeafterlogin({super.key});

  @override
  State<Homeafterlogin> createState() => _HomeafterloginState();
}

class _HomeafterloginState extends State<Homeafterlogin> {


  
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







int _currentPage=0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    
    final isMobile2 = screenWidth < 1050;
PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);

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
      body:GetBuilder<HomeController>(
      
      builder: (controller){return SingleChildScrollView(
        child: Column(
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
            Image.asset(
              'assets/teacherscover.png',
              width: screenWidth,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 20),
            
            _buildTeacherInfo(isMobile,screenWidth),
            const SizedBox(height: 20),
            
            
            
            
            
              Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
              InkWell(child: _buildClassCard('احجز ملازمك', 'assets/1stsec2x.png',context) ,onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>subjectBooks2()));
              },) ,
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ExamresultAnswerSheet(lessonIds: 1,);
                  }));
                },
                child:   _buildClassCard('المحضرات المباشرة', 'assets/2ndsec.png',context),),
            InkWell(child:  _buildClassCard('شوف محضراتك', 'assets/use7.png',context) ,onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:( context){
return Subjectbooks();
              }));

            },)  
              ],
            ),  const SizedBox(height: 20),
              Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.end,
              children: [
          InkWell(child: 
            _buildClassCard('احجز امنحنات الشامل', 'assets/1stsec2x.png',context),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SchudleForTheExam();
            }));
          },
          ) ,   
           InkWell( onTap: (){

           Navigator.push(context, MaterialPageRoute(builder: (context){return schedule_center();})); } ,child: _buildClassCard( 'احجز السنتر', 'assets/2ndsec.png',context ), )    
              ],
            ),  const SizedBox(height: 20),
            
            

        Image.asset(
              'assets/thumb4.png',
              width: screenWidth,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 20),
              Column(
                
        children: [
      SizedBox(
  height: 250,
  width:isMobile?268: 343,
  child: PageView.builder(
    reverse: true,
    controller: _pageController,
    itemCount:isMobile?images.length-2: images.length,
    onPageChanged: (index) {
      setState(() => _currentPage = index);
    },
    itemBuilder: (context, index) {
      return Container(
        width:isMobile? screenWidth:268,
        decoration: BoxDecoration(shape:BoxShape.circle),
        
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Image.asset(
              images[index],
              width:isMobile?1000:screenWidth,
              height: 180,
              
            ),
            const SizedBox(height: 8),
            const Text(
              'الصف الثاني الثانوي',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ],
        ),
      );
    },
  ),
),
 !isMobile?         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Icon(Icons.arrow_back_ios_new_outlined,color: Color.fromARGB(255, 6, 69, 152),),
              ... List.generate(
              
              imageGroups.length,
              (index) => GestureDetector(

                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  width: _currentPage == index ? 100 : 100,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    
                    
                    borderRadius: BorderRadius.circular(8),
                    color: _currentPage
                    == index ? 
                    Color.fromARGB
                    (255, 6, 69, 152)
                     : Colors.grey,
                  ),
                ),

              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined,color: Color.fromARGB(255, 6, 69, 152),),
            ]
          ):
          
          
          
          
          
                 Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Icon(Icons.arrow_back_ios_new_outlined,color: Color.fromARGB(255, 6, 69, 152),),
              ... List.generate(
              
             1,
              (index) => GestureDetector(

                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  width: _currentPage == index ? 100 : 100,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    
                    
                    borderRadius: BorderRadius.circular(8),
                    color: _currentPage
                    == index ? 
                    Color.fromARGB
                    (255, 6, 69, 152)
                     : Colors.grey,
                  ),
                ),

              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined,color: Color.fromARGB(255, 6, 69, 152),),
            ]
          ),
          SizedBox(height: 20),
       
    
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
        
    ])]));}));
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
      child: AutoTranslateText(weight: FontWeight.w400 , fontSize: 18,text: text,highlight: highlight,color:  const Color.fromARGB(255, 181, 181, 181),)
    );
  }

  Widget _buildClassCard(String title, String imagePath,context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Column(children: [ 
      Container(
      width: 343,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 180,width:343,
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
    return Container(
width: !isMobile?1120:343,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/Frame_10.png', width: 43, height: 40),
          const SizedBox(height: 8),
          const 
          AutoTranslateText(text:'الأستاذ شريف البدري',fontSize: 32,
             weight:  FontWeight.w600
          ,color:Color.fromARGB(255, 6, 69, 152) ,
         textAlign: TextAlign.right,   )
          ,
       
          
          
          
          
          
          
          
          
          
            AutoTranslateText(text:'مدرس ماده العلوم',fontSize: 20,
             weight:FontWeight.w400
          ,color:Color.fromARGB(255, 6, 69, 152),
         textAlign: TextAlign.right,   )
          ,
        
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
                      Row(
                mainAxisAlignment: MainAxisAlignment.start,        children: [
                          _storeButton('icons/Frame_16.png', 'Google play'),
                          const SizedBox(width: 8),
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
                      Wrap(
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
  return AutoTranslateText(
   text:  title,
   
      color: color,
      fontSize: fontSize,
      weight: FontWeight.w500,
    
  );
}


