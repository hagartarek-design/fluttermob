import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/assignment2.dart';
import 'package:my_app/app/modules/home/views/home.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';

import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/signup.dart';

import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
   HomeView({super.key});
  @override
  bool  value=true;
  Widget build(BuildContext context) {
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
        try{
           showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const MenuDialog(),
    );
      
        }catch(e){

        }
 

       }, child:  Icon(Icons.menu, color:Colors.white,))   
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
            width: screenWidth * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                   _buildButton('تسجيل دخول',context, isPrimary: true)
                    
                    ,const SizedBox(width: 12),
                _buildButton('انشاء حساب',context),  
                  ],
                ),
                if (!isMobile)
                  Row(
                    children: [
                      _navText('الرئيسية', highlight: true),
                      _navText('ذاكر'),
                      _navText('مدرسينا'),
                      _navText('كورساتى'),
                      _navText('مصادري'),
                      _navText('عن أشطر'),
                      _navText('تواصل معنا'),
                      const SizedBox(width: 12),
                      Image.asset('assets/Group87935.png', width: 55),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                _buildClassCard2('الصف الأول الثانوي', 'assets/1stsec2x.png',context,isMobile),
                _buildClassCard2('الصف الثاني الثانوي', 'assets/2ndsec.png',context,isMobile),
                _buildClassCard('الصف الثالث الثانوي', 'assets/3rdsec2.png',context,isMobile),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/thumb4.png',
              width: screenWidth,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 20),
            
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
      // Transform.scale(
              
      //         scale: ,
      //        child:  
             Switch.adaptive(
              splashRadius: 50,
              // inactiveThumbColor: ,
              value:value, onChanged:(value)=>this.value=value 
             ,activeColor: Colors.blueAccent,activeTrackColor:Colors.blue .withOpacity(0.4),
             ),
            // ),SizedBox(height: 10,)
        //  buildSwitch()
          ],
        ),
      ),
    );
  }
  // Widget buildSwitch()=>Switch.adaptive(value: value, onChanged: (value){}); 
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
 



   
  Widget _buildButton(String text,context, {bool isPrimary = false}) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: () {

          isPrimary?  
      Navigator.push(context, MaterialPageRoute(builder: (context) {return Mainpage();})):
      Navigator.push(context, MaterialPageRoute(builder: (context) {return Signup();}));
        },
        style: TextButton.styleFrom(
          backgroundColor:
              isPrimary ? Colors.white : Colors.transparent,
          side: isPrimary
              ? null
              : const BorderSide(color: Colors.white), 
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child:
        AutoTranslateText(text:text,isPrimary: isPrimary,color:Colors.white ,fontSize:18 ,
        weight: FontWeight.w500 ,
         )
        
        
        
        
        
        
        
        
      ),
    );
  }

  Widget _navText(String text, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:
      
        AutoTranslateText(weight: FontWeight.w400 , fontSize: 18,text: text,highlight: highlight,color:  const Color.fromARGB(255, 181, 181, 181),)   
      
      
      
      
      
      
      
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
            child: Text(title
            
              
            
            
            
              
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildClassCard2(String title, String imagePath,context,bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
    
      child: Column(
        children: [
          Container(
             
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
            height: 150,width:!isMobile? 362.67:163.5,
            padding: const EdgeInsets.all(8),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoTranslateText(
              text:title,
                  weight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/Frame_10.png', width: 43, height: 40),
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
                      // _buildInfoRow('icons/location.png',
                      //     '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      // const SizedBox(height: 12),
                      // _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      // const SizedBox(height: 12),
                      // _buildInfoRow('icons/sms (1).png', 'support@ashtar.app'),
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
    alignment: WrapAlignment.end,
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
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    ),
  );
}


