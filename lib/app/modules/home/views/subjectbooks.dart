import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/views/Schudle_for_the_exam%20.dart';
import 'package:my_app/app/modules/home/views/aboutashtar.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart' show mennimenu;
import 'package:my_app/app/modules/home/views/profile.dart';
import 'package:my_app/app/modules/home/views/schedule_center.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/routes/app_pages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '';
class Subjectbooks extends StatefulWidget {
  const Subjectbooks({super.key});

  @override
  State<Subjectbooks> createState() => _HomeafterloginState();
}

class _HomeafterloginState extends State<Subjectbooks> {




PageController _pageController=PageController(
    viewportFraction: 0.22, // ~1 / 4.5
initialPage: 1

);
int _currentPage=0;
  @override
  Widget build(BuildContext context) {


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
              // Logo
       InkWell( onTap: (){
 showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => mennimenu(),
    );
       

       }, child:  Icon(Icons.menu, color:Colors.white ,))   
,
              // Buttons
              Row(
                children: [
              Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group87935.png', width: 55),
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
//               Image.network(
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
                        child:InkWell(
                          onTap: (){
                            HomeController controller=Get.find();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.currentScreen.value = '/Profile';
    
    controller.startTokenMonitoring();
  });   Get.toNamed(Routes.PROFILE);
                            // Navigator.push(context, MaterialPageRoute(builder: (context){return Profile();}));
                          },
                          child:  CircleAvatar(
                          
                          radius: 24,
                          // backgroundImage: NetworkImage('${controller.img}')==null
                          // ? NetworkImage('${controller.img2}'): NetworkImage('${controller.img}'),
                        ),
                      ),
                     ), Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector_3.png',width: 40,height: 41,),
                    Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector_2.png',width: 39.02,height: 40,)
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
                      Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group87935.png', width: 55),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      body:GetBuilder(init: HomeController()
      ,builder: (controller){return SingleChildScrollView(
        child: Column(
          children: [
          Wrap(
  spacing: 16,
  runSpacing: 16,
  alignment: WrapAlignment.center,
  children: [     Container(
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
            //   spacing: 16,
            //   runSpacing: 16,
            //   alignment: WrapAlignment.center,
            //   children: [
    
  SizedBox(height: 24,)
        ,
          Container(child:Column(
            spacing: 24,
            children: [
          Container(child: Row(spacing: 1,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
         Text('اختار نشاطك',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('اختيار نشاطك',textAlign: TextAlign.start,textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.w600,
           fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),)
           ,SizedBox(width: 1120,child:Row(spacing: 16, children: [
            // Image.network('assets/')
           ],) ,)
           
           ],)),
            SizedBox(
              // width:1120
              width: 1120,child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
         Container(child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('مستوى التقدم فى الماده',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 16, fontWeight: FontWeight.w400),),
            Text('77% مكتمل',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 12, fontWeight: FontWeight.w400)),
       ],) ), 
Container(  width: screenWidth,  child:
  Wrap( alignment: WrapAlignment.center,  children:
   [ new LinearPercentIndicator( width:isMobile? screenWidth:1120, lineHeight: 8.0,
    barRadius: Radius.circular(16), percent: 0.2, alignment:
     MainAxisAlignment.end, isRTL: true, progressColor: Color.fromARGB(255, 77, 195, 44)) ,])    ,

                         )                                          ],)),
     Container(width: 1123, child: Column(children: [
Wrap(
                 spacing: 16, 
                  alignment:WrapAlignment.center,
                  children: [ 
                    
                    
                InkWell(child:       _buildClassCard('احجز ملازمك', 'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/use4.png',context),
                onTap: (){  //Navigator.push(context, MaterialPageRoute(builder: (context){return subjectBooks2();}));
                Get.to(subjectBooks2());
                }, ), _buildClassCard('المحاضرات المباشره', 'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/use5.png',context),
             InkWell( onTap: (){
              Get.toNamed(Routes.SUBJECTTYPE);
//               Navigator.push(context, MaterialPageRoute(builder: (context){
// controller.fetchcourseinfo();
//               return Subjecttype();
//              }));
             }, child: _buildClassCard('شوف محاضراتك', 'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/use7.png',context),)  
                ],),
Wrap(
                 spacing: 16, 
                  alignment: WrapAlignment.center,
                  children: [
           InkWell(child:      _buildClassCard('احجز امتحانك الشامل', 'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/use1.png',context),
                   onTap: () {Get.to( SchudleForTheExam());
                    //  Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return SchudleForTheExam();
                    //  }));
                   }, ), InkWell(child: _buildClassCard('احجز السنتر','https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/use3.png',context),onTap:
                    (){
                Get.to(schedule_center());                
                  //  Navigator.push(context, MaterialPageRoute(builder: (context){return schedule_center();}));
                  },) ,
                
                ],),
            SizedBox(height: 24,)
          ],),)
          ],) ,width: 1123, ),
      
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
            child: Image.network(imagePath, fit: BoxFit.contain),
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

 Widget _navText(String text, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AutoTranslateText(weight: FontWeight.w400 , fontSize: 18,text: text,highlight: highlight,color:  const Color.fromARGB(255, 181, 181, 181),)
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
  //           child: Image.network(imagePath, fit: BoxFit.contain),
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
          Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Frame_10.png', width: 43, height: 40),
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
                      _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/sms_1.png', 'support@ashtar.app'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_14.png'),
                          const SizedBox(width: 12),
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_13.png'),
                          const SizedBox(width: 12),
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_12.png'),
                          const SizedBox(width: 12),
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_11.png'),
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
                          _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_16.png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_15.png', 'App Store'),
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
                         InkWell(onTap: (){
                          Get.to(Aboutashtar());
                          // Navigator.push(context, MaterialPageRoute(builder: (context){return Aboutashtar(); }));
                         },child:_navItem('عن أشطر') ,) ,
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
                        child: Image.network(
                          'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group87935.png',
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
      Image.network(iconPath, width: 24, height: 24),
    ],
  );
}

Widget _icon(String path) {
  return Image.network(path, width: 24, height: 24);
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
        Image.network(iconPath, width: 40, height: 40),
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
    {
      Color color = const Color.fromARGB(255, 181, 181, 181),
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


