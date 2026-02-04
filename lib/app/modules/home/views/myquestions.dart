import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/wallet.dart';
import 'exam_solve.dart';
import 'wallet_cart.dart';






class Myquestions extends StatefulWidget {
  const Myquestions({super.key});

  @override
  State<Myquestions> createState() => _MyexamState();
}

class _MyexamState extends State<Myquestions> {
bool isLoading = false;

bool isSelected=true;

bool isSelected2=false;




  HomeController controller=Get.find();  
// Timer? _cartTokenTimer;
// HomeController controller=Get.find();

//  Timer? _dashboardTokenTimer;

@override
void initState() {
  super.initState();
  
  controller.currentScreen.value = '/DashboardScreen';
  controller.isaskOpen.value = true;
  controller.isaskActive.value = true;
  
  // Start Dashboard-specific token monitoring
  _startDashboardTokenMonitoring();
  
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _initializeDashboardWithRefresh();
  });
}

void _startDashboardTokenMonitoring() {
  // Stop any existing timer
  controller.dashboardTokenTimer?.cancel();
  
  // Check token every minute when in Dashboard
controller.dashboardTokenTimer = Timer.periodic(Duration(minutes: 1), (timer) {
    if (mounted) {
      controller.checkDashboardToken();
    }
  });
}

@override
void dispose() {
  // Stop the Dashboard timer
 controller.dashboardTokenTimer?.cancel();
  controller.dashboardTokenTimer = null;
  
  controller.stopAsktimer();
  controller.isaskActive.value = false;
  
  super.dispose();
}

 Future<void> _initializeDashboardWithRefresh() async {
  print('📱 DashboardScreen - Initializing with auto-refresh');
  
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  
  if (token == null || token.isEmpty) {
    print('⚠️ No token in Dashboard');
    return;
  }
  
  try {
    final expiryDate = JwtDecoder.getExpirationDate(token);
    final remaining = expiryDate.difference(DateTime.now());
    
    print('📱 Dashboard token expires in: ${remaining.inMinutes} minutes');
    
    // If token is already expired, refresh immediately
    if (remaining.isNegative) {
      print('🔄 Token already expired, refreshing now...');
      await controller.refreshAccessToken();
    } 
    // If token expires in less than 10 minutes, refresh now
    else if (remaining.inMinutes < 10) {
      print('🔄 Token expiring soon, refreshing now...');
      await controller.refreshAccessToken();
    }
    
    // Start Dashboard timer
    if (controller.isWalletActive.value) {
      controller.startAskTimer();
    }
    
  } catch (e) {
    print('❌ Error in Dashboard token initialization: $e');
  }
}
  

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
  
  final int _maxLength = 500;
  final FocusNode _focusNode = FocusNode();














    int _currentPage=0;
  
  
          
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);  int currentIndex = 1;


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
      
      GetBuilder<HomeController>( builder: (controller){

          
          
          
        
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
isMobile?343 : 1820,    child:Wrap(
  runAlignment: WrapAlignment.start,
            alignment:isMobile?WrapAlignment.center: WrapAlignment.end,
            children: [ 
              Column(crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:isMobile?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
               children: [
                 Container( width:!isMobile?852:screenWidth ,height: 1252,
                 padding: EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),

)
,child: 
Wrap(alignment: WrapAlignment.start,
  
  children: [
    
  Container(width:!isMobile ?343:246, height: 110,
  
 
  child:Text("اسال المدرس"
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600,
)
 ,),
) 

,
 
 Container(width:isMobile?263: 770
 ,child: 
     Column( crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10,
      
      
      children: [
  
  
  
  
  

  
  Wrap(alignment: WrapAlignment.start,children: [ 
     Container( width:isMobile?263: 770,
     

 child:   Wrap(
  spacing: 16,
  alignment: WrapAlignment.start,children: [
 Container( width:isMobile? 263: 552,
 child: 
Container( width: isMobile? 263: 552,

child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text('اختار الدرس',style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 80, 124, 181)),),
 _buildDropdownField(
                  controller,isMobile,
                  "ادخل المادة",
                  controller.semester,
                  controller.allcourse,
                  (newValue) {
                    controller.semester.value = newValue;
                    print("Selected course: ${controller.semester.value}");
                  },
                ),
 SizedBox(height: 24,),
 controller.semester.value!=null?
 Container(
  
   width:isMobile?343: 552, child: Column(crossAxisAlignment:
    CrossAxisAlignment.start, spacing: 16, children: [
    
Text('اسال سؤالك',style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 80, 124, 181)))
 ,
 Column(children: [
   Stack( children: [
     Container( width :isMobile?263:552,height: 370,
decoration: BoxDecoration(
  border: Border.all(width: 1,color:Color.fromARGB(255, 80, 124, 181) )
  ,borderRadius: BorderRadius.circular(8),
  color: Colors.white
  )


,child:

 InlineCounterTextFieldScreen(),) ,


  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      
                      
                        
                        
                        
                          
                          
                      
                      
                      child: Text(
                        '$_maxLength',
                        style: TextStyle(
                          fontSize: 16,color: Color.fromARGB(255, 154, 175, 228),
                          fontWeight: FontWeight.w400,
                          
                        ),
                      ),
                    ),
                  
              
      
    )])])

    ,
 
 SizedBox(height:24)  ,

































 
],),)
 :Container()
 ])
  
 
   ), 
   
   
    
    
   
        
      
     )
     
     ],) 
  ),
  controller.semester.value!=null? 
   SizedBox(
  width:isMobile? 263: 552 ,
  height: 44,
  child: TextButton(
onPressed:  () async {
 
 print('${ controller.semester.value.toString()}');
    await controller.studentQues(
      name: controller.semester.value.toString(),
      context: context,
    );

},
  style: TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 6, 69, 152),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text(
    'حفظ',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
),
)
:Container() ])
  ]))
  
  
                              
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ]))

































 
])


,SizedBox(width: 100,)  ,isMobile?
Container():RightSidebar()

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


Widget _buildDropdownField(
  controller,isMobile,
  String hint,
  Rx<String?> value,
  List<Course> items,
  Function(String?) onChanged,
)  {
  controller.fetchSAllCourses();
  return Container(
    width:isMobile?263: 552,decoration: BoxDecoration(color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 16),
       Container( 
        
        // height: 44,
        child:     Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String?>(
            value: value.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 154, 175, 228),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 154, 175, 228),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            isExpanded: true,
            items: [
              DropdownMenuItem<String?>(
                value: null,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    hint,
                    style: const TextStyle(
                      fontSize: 16,
                      color:  Color.fromARGB(255, 154, 175, 228),
                    ),
                  ),
                ),
              ),
                ...items.map((Course course) {
                return DropdownMenuItem<String?>(
                value: course.name ?? 'Unknown',
                child: Text(course.name ?? 'Unknown',
                style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 154, 175, 228),
                      ),
                    
                  ),
                );
              }).toList(),
            ],
            onChanged: (newValue) {
              onChanged(newValue);
            },
          ),
        ),
      ) 
   ],
    ),
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
      crossAxisAlignment: CrossAxisAlignment.end,
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
                      // _buildInfoRow('icons/sms (1).png', 'support@ashtar.app'),
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


Widget _buildPagination(controller, int currentPage) {
    int currentIndex = 1;
  return Row(
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
