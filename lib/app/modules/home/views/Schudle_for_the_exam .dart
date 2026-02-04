















































      
      














       












      


































   

   
      













                        



                          

































    

























           
     





    










            



           

          
          






            




          




























            













          








          






      






           

       
          

          
          
          
          
          
          
          















                  

                  































  









       








  
  

   

   







    









      
      



      















      
      



      



      


   


  
  

  

      





    



      


    


                              































































































                        
        

          

  
      

      












        
























 
   









































         















   





























































































































































































































































































































































































































      
      














       












      


































   

   
      













                        



                          

































    

























           
     





    










            



           

          
          






            




          




























            













          








          






      






           

       
          

          
          
          
          
          
          
          















                  

                  































  









       








  
  

   

   







    









      
      



      















      
      



      



      


   


  
  

  

      





    



      


    


                              































































































                        
        

          

  
      

      












        
























 
   









































         















   






























































































































































































































































































































































































































      
      














       












      


































   

   
      













                        



                          

































    

























           
     





    










            



           

          
          






            




          




























            













          








          






      






           

       
          

          
          
          
          
          
          
          















                  

                  































  









       








  
  

   

   







    









      
      



      















      
      



      



      


   


  
  

  

      





    



      


    


                              































































































                        
        

          

  
      

      












        
























 
   









































         















   















































































































































































































































































































































































import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';
import 'package:my_app/app/modules/home/views/schedule_center.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'Schudle_for_the_exam .dart';

class SchudleForTheExam extends StatefulWidget {
  const SchudleForTheExam({super.key});

  @override
  State<SchudleForTheExam> createState() => _HomeafterloginState();
}

class _HomeafterloginState extends State<SchudleForTheExam> {
  int _currentPage = 0;
  bool isSelected = true;
  bool isSelected2 = false;

  PageController _pageController = PageController(
    viewportFraction: 0.22,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    void scrollToIndex(int index) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
    int _currentPage = 0;

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Scaffold(
      appBar: isMobile
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 6, 70, 152),
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                    showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );
                    },
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/Group87935.png', width: 55),
                    ],
                  ),
                ],
              ),
            )
          : AppBar(
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
                          Image.asset('icons/Vector_3.png',
                              width: 40, height: 41),
                          Image.asset('icons/Vector_2.png',
                              width: 39.02, height: 40)
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
      body: GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Column(
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.start,
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
                          SizedBox(height: 24),
                          Container(
                            child: Column(
                              spacing: 24,
                              children: [
                                Container(
                                  child: Wrap(
                                    spacing: 1,
                                    alignment: WrapAlignment.start,
                                    children: [
                                   
                                      Text('الرئيسية',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))), 
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Color.fromARGB(
                                                255, 181, 181, 181)),
                                      ),        Text('الصف الثالث الثانوي',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                                       Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Color.fromARGB(
                                                255, 181, 181, 181)),
                                      ),   
                                      Text('الفيزياء',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Color.fromRGBO(6, 69, 152, 1)),
                                      ),              Text('احجزامتحناتك',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                     
                               
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                    
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1120,
                                  child: Column(
                                    spacing: 24,
                                    crossAxisAlignment:isMobile?CrossAxisAlignment.start: CrossAxisAlignment.start,
                                    children: [
                                      Text('تفصيل الاسالة',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32,
                                              color: Color.fromRGBO(6, 69, 152, 1))),
                                      Container(alignment: Alignment.center,
                                        width:isMobile
                                        ?343: 428,
                                        height:isMobile?71: 44,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 235, 239, 249),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 6, 69, 152),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Wrap(
                                          children: [
                                            InkWell(
                                              child: Container(
                                                
                                                
                                                width:isMobile? 170.5: 213,
                                                height:isMobile?71: 44,
                                                decoration: BoxDecoration(
                                                  color: isSelected == true &&
                                                          isSelected2 == false
                                                      ? Color.fromARGB(
                                                          255, 235, 239, 249)
                                                      : Color.fromARGB(
                                                          255, 6, 69, 152),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Wrap(
                                                  children: [
                                                    Text('امتحنات اونلاين',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20,
                                                            // color:
                                                                // Color.fromARGB(255, 255, 250, 250)
                                                                    )),
                                                    Image.asset(
                                                        'assets/Frame.png',
                                                        height: 30,
                                                        width: 30)
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  isSelected = false;
                                                  isSelected2 = true;
                                                });
                                                controller.fetchExams(online: 1);
                                              },
                                            ),
                                            InkWell(
                                              child: Container(
                                                width:isMobile? 170.5: 213,
                                                height:isMobile?71: 44,
                                                child: Wrap(
                                                  children: [
                                                    Text('امتحان في السنتر',
                                                        style: TextStyle(
                                                            color: isSelected ==
                                                                        true &&
                                                                    isSelected2 ==
                                                                        false
                                                                ? Color.fromARGB(
                                                                    255,
                                                                    235,
                                                                    239,
                                                                    249)
                                                                : Color.fromARGB(
                                                                    255,
                                                                    6,
                                                                    69,
                                                                    152),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Image.asset(
                                                        'assets/Group_1.png',
                                                        width: 30,
                                                        height: 30)
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: isSelected == false &&
                                                          isSelected2 == true
                                                      ? Color.fromARGB(
                                                          255, 235, 239, 249)
                                                      : Color.fromARGB(
                                                          255, 6, 69, 152),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  isSelected2 = false;
                                                  isSelected = true;
                                                });
                                                controller.fetchExams(online: 0);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
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

              
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      width: isMobile ? screenWidth : 1120,
                      child: Column(
                        spacing: 2,
                        children: [
                          
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(99, 80, 124, 181),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(24),
                              width: isMobile ? 800 : 1120, 
                              height: 93,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text('الحجز',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('سعر الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('تاريخ انتهاء صلاحيه الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('تاريخ بدا الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('نوع الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 9, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          
                          
                          
                          
                            Column(
                              children:    [ SingleChildScrollView(
                            scrollDirection: Axis.horizontal,child: Row(children: [
                            ...  List.generate(controller.exams.length, (index) {
                                return Container(
                                  width: isMobile ? 800 : 1120, 
                                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          offset: Offset(0, 3),
                                          blurRadius: 13,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(255, 245, 245, 245))),
                                  child: Container(
                                    width: isMobile ? 752 : 1072, 
                                    height: 95,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 145,
                                          height: 60,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 6, 69, 152),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    side: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152),
                                                        width: 1))),
                                            onPressed: () {},
                                            child: Text('اشترك دلوقتي',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255))),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                              '${controller.exams[index].examprice} جنيه',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152))),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 10, 24, 10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('12/10/2024',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152))),
                                                Text('4:30PM',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152),
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 10, 24, 10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('12\\10\\2024',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152))),
                                                Text('4:30PM',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152))),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                              '${controller.exams[index].exam_type}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152))),
                                          decoration: BoxDecoration(),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],) 
                            ),
                          
                          
                          
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: isMobile ? 800 : 1120, 
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        offset: Offset(0, 3),
                                        blurRadius: 13,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 245, 245, 245))),
                                padding:
                                    const EdgeInsets.fromLTRB(24, 13, 24, 13),
                                width: 1130,
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 116,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 10, 24, 10),
                                          backgroundColor: const Color.fromARGB(
                                              255, 6, 69, 152),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/arrowleft.png',
                                                width: 9.53, height: 20),
                                            const SizedBox(width: 12),
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
                                    const SizedBox(width: 20),
                                    _buildPagination(controller, currentIndex),
                                    const SizedBox(width: 20),
                                    Container(
                                      width: 116,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 10, 24, 10),
                                          side: const BorderSide(
                                            color:
                                                Color.fromARGB(255, 6, 69, 152),
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
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
                                            color:
                                                Color.fromARGB(255, 61, 84, 110),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
               ])   ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
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
          backgroundColor: isPrimary ? Colors.white : Colors.transparent,
          side: isPrimary ? null : const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isPrimary
                ? const Color.fromARGB(255, 6, 69, 152)
                : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildClassCard(String title, String imagePath, context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: 363,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 212, 221, 232),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 180,
                width: screenWidth,
                padding: const EdgeInsets.all(8),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ],
          ),
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

  Widget _buildTeacherInfo(bool isMobile, screenWidth) {
    return Container(
      width: !isMobile ? 1120 : screenWidth,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                        // const SizedBox(height: 16),
                        // _buildInfoRow('icons/location.png',
                        //     '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                        // const SizedBox(height: 12),
                        // _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                        // const SizedBox(height: 12),
                        // _buildInfoRow(
                        //     'icons/sms (1).png', 'support@ashtar.app'),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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

  Widget _buildPagination(HomeController controller, int currentPage) {
    int currentIndex = 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(10, (index) {
        final pageIndex = index + 1;
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = pageIndex;
              controller.fetchExams(page: pageIndex);
              controller.update();
            });
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

  Widget menuButton(
      BuildContext context, String label, Color bgColor, Color textColor) {
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