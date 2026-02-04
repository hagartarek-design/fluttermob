import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/addedto.dart';
import 'package:my_app/app/modules/home/views/emptycart.dart';
import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/myExam.dart';

import 'package:my_app/app/modules/home/views/mybooks.dart';
import 'package:my_app/app/modules/home/views/mycourses.dart';
import 'package:my_app/app/modules/home/views/myquestionask.dart' show MyQuestionAsk, myquestionask;
import 'package:my_app/app/modules/home/views/profile.dart';
import 'package:my_app/app/modules/home/views/MySections.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/Wallet.dart';
import 'package:my_app/app/modules/home/views/walletMobile.dart';
import 'package:my_app/app/routes/app_pages.dart';
class mennimenu extends StatefulWidget {
  const mennimenu({super.key});

  @override
  State<mennimenu> createState() => _mennimenuState();
}

class _mennimenuState extends State<mennimenu> {
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    HomeController controller=HomeController();
    
    final isSmallScreen = screenWidth < 600;
    final sidebarWidth = isSmallScreen ? screenWidth * 0.8 : 275.0;
    final sidebarHeight = isSmallScreen ? screenHeight : 747.0;
    return Dialog(
      insetPadding: const EdgeInsets.only(right: 0),
      backgroundColor: const Color.fromARGB(255, 6, 70, 152),
      alignment: Alignment.centerRight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SizedBox(
        width: 300,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            Center(
              child: Image.asset(
                'assets/logoashtarwithephase2(2).png',
                width: isSmallScreen ? 100.0 : 143.51,
                height: isSmallScreen ? 80.0 : 118.0,
                fit: BoxFit.contain,
              )
            ),
            const SizedBox(height: 20),
            
            
        InkWell(child:  _buildMenuItem(
              Icons.arrow_back_ios, 
              "الملف الشخصي", 
              Icons.person_2_outlined,
              isSmallScreen: isSmallScreen
            ) ,onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){return Profile();}));
        },),  
            
            InkWell(
              child: _buildMenuItem(
                Icons.arrow_back_ios,
                "محفظتك", 
                Icons.account_balance_wallet_outlined,
                isSmallScreen: isSmallScreen
              ),
              onTap: ()async { 
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return walletMobile();
                })); 
            await   controller. fetchCodes(page: 1);
              }
            ),  
            




  


    











               











            
            
            
            
            
            
            
            
          InkWell(child:  _buildMenuItem(
              Icons.arrow_back_ios,
              "كورساتي",
              Icons.arrow_back_outlined,
              isSmallScreen: isSmallScreen
            ),
            onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context)
            
            {
            controller.  fetchSections();
              return MySections();})); },) ,
       InkWell(child: _buildMenuItem(
              Icons.arrow_back_ios,
              "ملازمي",
              Icons.arrow_back_outlined,
              isSmallScreen: isSmallScreen
            ),
            onTap: (){
              Get.toNamed(Routes.MYBOOKS);
            //  Navigator.push(context, MaterialPageRoute(builder: (context){
            //     return myBooks();
            //   }));
            },
            )  
         ,
      InkWell(  child:       _buildMenuItem(
              Icons.arrow_back_ios,
              "امتحناتك",
              Icons.arrow_back_outlined,
              
            ),
      onTap: (){
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//   return Material(child: MyExam());
// }));
 setState(() {
      Get.toNamed(Routes.MYEXAM);    
//  controller.smartSolveNavigate(Routes.MYEXAM);
        });
            }
      
            ),
          InkWell(child:   _buildMenuItem(
              Icons.arrow_back_ios,
              "اسأل المدرس",
              Icons.arrow_back_outlined,
              isSmallScreen: isSmallScreen
            ) ,onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context){return MyQuestionAsk();}));

            },)  
         ,
            
          InkWell(
            onTap: (){
             
controller.fetchCart();
              Navigator.push(context, MaterialPageRoute(builder: (context){return Addedto();}));
              
            },
            child: _buildMenuItem(
              Icons.arrow_back_ios,
              "سلة المشتريات",
              Icons.shopping_cart_outlined,
              isSmallScreen: isSmallScreen
            ),) 
            ,
        InkWell(child:   _buildMenuItem(
              Icons.arrow_back_ios,
              "طلباتك",
              Icons.list_alt_outlined,
              isSmallScreen: isSmallScreen
            )
         ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
      controller.fetchCart();return Emptycart();   }
        ));},)    ,
            InkWell(
              
              child:_buildMenuItem(
              Icons.arrow_back_ios,
              "الإعدادات",
              Icons.settings_outlined,
              isSmallScreen: isSmallScreen
            ),onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return Material(child: settings() ,);
                }));
              },
            ),
            
            InkWell(child: _buildMenuItem(
              Icons.arrow_back_ios,
              "تسجيل خروج",
              Icons.logout_outlined,
              isSmallScreen: isSmallScreen
            ),onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return HomeView();}));
            } ,)
           
          ],
        
      )]))));
  }
  
    Widget _buildMenuItem(IconData icon, String title, IconData icons, {bool isSmallScreen = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12.0 : 16.0, 
        vertical: isSmallScreen ? 8.0 : 12.0
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: isSmallScreen ? 18.0 : 24.0),
          SizedBox(width: isSmallScreen ? 8.0 : 10.0),
          Expanded(
            child: AutoTranslateText(
           text:  title,
              
                color: Colors.white, 
                fontSize: isSmallScreen ? 14.0 : 16.0
              
              
            ),
          ),
          Icon(icons, color: Colors.white, size: isSmallScreen ? 18.0 : 24.0),
        ],
      ),
    );
  }

  }