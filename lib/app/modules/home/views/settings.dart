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
import 'package:translator/translator.dart';

import '../../../models/wallet.dart';
import 'exam_solve.dart';
import 'toggle.dart';
import 'toggle2.dart';
import 'translatorservice.dart';
import 'wallet_cart.dart';







class AutoTranslateText extends StatefulWidget {
  final String text;
  final bool highlight;
  final bool isPrimary;
  final double? fontSize;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const AutoTranslateText({
    super.key,
    required this.text,
    this.highlight = false,
    this.isPrimary = false,
    this.fontSize,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  State<AutoTranslateText> createState() => _AutoTranslateTextState();
}

class _AutoTranslateTextState extends State<AutoTranslateText> {
  final TranslatorService _translator = TranslatorService();
  String? _translatedText;

  @override
  void initState() {
    super.initState();
    _translate();
  }

  @override
  void didUpdateWidget(covariant AutoTranslateText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _translate();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translate(); 
  }

  void _translate() async {
    final lang = Get.locale?.languageCode ?? 'ar';
    final result = await _translator.translateText(widget.text, lang);
    if (mounted) {
      setState(() {
        _translatedText = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   setState(() {
     
   });
    final displayText = _translatedText ?? widget.text;

    return Text(
      displayText,
      textAlign: widget.textAlign,
      style: TextStyle(
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.weight ?? FontWeight.normal,
        color: widget.highlight
            ? const Color.fromARGB(255, 242, 195, 42)
            : widget.isPrimary
                ? const Color.fromARGB(255, 6, 69, 152)
                :widget. color,
      ),
    );
  }
}














































  
      












class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {


bool isSelected=true;


bool isSelected2=false;



 final GoogleTranslator translator = GoogleTranslator();
  final TextEditingController _controller = TextEditingController();

  String translatedText = '';
  bool isLoading = false;
  String targetLang = 'en';

  
  void _changeLanguage(String langCode) {
setState(() {
  var locale = Locale(langCode);
  Get.updateLocale(locale);
});  
}


  
  Future<void> _translate() async {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() => isLoading = true);

    try {
      final translation = await translator.translate(input, to: targetLang);
      setState(() {
        translatedText = translation.text;
      });
    } catch (e) {
      setState(() {
        translatedText = 'Error: $e';
      });
    }

    setState(() => isLoading = false);
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
    int _currentPage=0;
  
  
          
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
                      _navText(  'الرئيسية', highlight: true),
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
                AutoTranslateText(
                fontSize:isMobile ? 14 : 18,weight:  FontWeight.w500,color:const Color.fromARGB(255, 6, 69, 152) ,
                text:'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%')
                 
                ],
              ),
            ),
         SizedBox(height: 5,)   
, Container(width: 
1820,    child:Row(
  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              isMobile?Container():
RightSidebar()

,SizedBox(width: 30,)  ,
              Expanded(child:               
                 Container(
          width: !isMobile ? 852 : 375,child:
               Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                  
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),

)
,child: 
Wrap(
  alignment: WrapAlignment.center,
  
  children: [
    
  Container( width:!isMobile ?676:311
,child: 
Column(
  
  
  

  children:[
   Container( width:!isMobile ?676:311,child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
      AutoTranslateText(text:'الاعدادات',
      color: Color.fromARGB(255, 6, 69, 152),
      weight:FontWeight.w600 ,fontSize: 32,
       )
     ],))
    ,Column(
  crossAxisAlignment: CrossAxisAlignment.start
  ,mainAxisAlignment: MainAxisAlignment.center,
  children: [

    Container(
       width:isMobile?311: 770,height: 78,child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      Container(width: 58.42,height: 30,child: DraggableToggleSwitch2(
                    initialValue:false, onToggleChanged: (bool ) {  } ,), ) , 
     
     AutoTranslateText(text:'الاشعارات'
     ,fontSize:24 ,weight:FontWeight.w500 
     ,color: Color.fromARGB(255, 6, 69, 152),
      )
      
      
      
    ],),),
   Container(width:isMobile?311: 770,
  child: 
  Column(spacing: 24,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    
    AutoTranslateText(text:'تغيير كلمة المرور',
color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 24,weight: FontWeight.w500,
  
  )
  ,Container(
    
    decoration: BoxDecoration(),
  width:isMobile?311: 722,child: 
  Column( 
spacing: 24,    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

     Container(width:isMobile?311: 457,child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           AutoTranslateText(text:'كلمة المرور القديمه',color: Color.fromARGB(255, 80, 124, 181)
            ,weight:FontWeight.w500,fontSize: 16 
          ),
                  Container(width:isMobile?311: 457,
          
          
          
          
          
          
          
          height: 44,
          child:        TextField( decoration: InputDecoration(
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
            
              
              
              

              
              
            ),)
   ,)  
     
     ],),
     )
 , 
     Container(width:isMobile?311: 457,child: Column(spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

           AutoTranslateText(text:'كلمة المرور الجديدة',color: Color.fromARGB(255, 80, 124, 181)
            ,weight:FontWeight.w500,fontSize: 16 
            ),
         Container(width:isMobile?311: 457,
          
          
          
          
          
          
          
          
          child:        TextField( decoration: InputDecoration(
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
            
              
              
              

              
              
            ),)
   ,)  , Container(width:isMobile?311: 457,height: 44,
   
   child: Wrap(
    spacing: 8,
    children: [
    Container(width:isMobile?75.33 :145.67,height: 4,
    decoration: BoxDecoration( color: Color.fromARGB(255, 232, 232, 232)
    ,borderRadius: BorderRadius.circular(4)
    ),
    ),
    Container(width:isMobile?75: 145.67,height: 4,
    decoration: BoxDecoration( color: Color.fromARGB(255, 39, 114, 83)
    ,borderRadius: BorderRadius.circular(4)
    ),
    ),
    Container(width:isMobile?75: 145.67,height: 4,
    decoration: BoxDecoration( color: Color.fromARGB(255, 39, 114, 83)
    ,borderRadius: BorderRadius.circular(4)
    ),
    ),
   ],),
   )
         ],),
     )
 , 
     Container(
  
      width:isMobile?311 :457,child: Column(spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           AutoTranslateText(text:'كلمة المرور القديمه',color: Color.fromARGB(255, 80, 124, 181)
            ,weight:FontWeight.w500,fontSize: 16 
            
            ),
          Container(width:isMobile?311: 457,
          
          
          
          
          
          
          
          child:        TextField( decoration: InputDecoration(
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
            
              
              
              

              
              
            ),)
   ,)  
   ,
  Container(
    width: 220,decoration: BoxDecoration(
    color: Color.fromARGB(255, 6, 69, 152),borderRadius: BorderRadius.circular(8)),
    height: 44,child:TextButton(onPressed: (){}, child: AutoTranslateText(text:'حفظ',
            fontSize: 18,weight:FontWeight.w500 ,
            color:
           Color.fromARGB(255, 255, 255, 255),)) ,)  ],),
     )
  
  ],),
  )
 ,
 Container( width:isMobile?311: 770,
 child: Column(spacing: 16,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  AutoTranslateText(text:'تغيير اللغة',color:Color.fromARGB(255, 6, 69, 152),
  fontSize: 24,weight: FontWeight.w500
    ),Container(width:isMobile?311: 722,child: Column(spacing: 16,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(width:isMobile?311: 457,child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,  spacing: 16,
      children: [AutoTranslateText(text:'اللغه',
        color: Color.fromARGB(255, 80, 124, 181),
        fontSize: 16,weight: FontWeight.w500)

        ,
       
        
     Container(
  width:isMobile?311: 457,
  height: 44,
  child: Directionality(
    textDirection: Get.locale?.languageCode == 'ar'
        ?TextDirection.ltr
        :  TextDirection.rtl,
    child: DropdownButtonFormField<String>(
      value:
    
       Get.locale?.languageCode == 'ar' ? 'Arabic' : 'English',
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
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
      items: const [
        DropdownMenuItem(value: 'English', child: Text('English')),
        DropdownMenuItem(value: 'Arabic', child: Text('العربية')),
      ],
      onChanged: (newValue) {
        if (newValue == 'Arabic') {
    setState(() {
    _changeLanguage('ar');
    });      
        } else {
          setState(() {
        _changeLanguage('en');
          });
         
        }
      },
    ),
  ),

)

        ],),)


,  Container(
    width: 220,decoration: BoxDecoration(
    color: Color.fromARGB(255, 6, 69, 152),borderRadius: BorderRadius.circular(8)),
    height: 44,child:TextButton(onPressed: (){
      void _changeLanguage(String langCode) {
  final locale = Locale(langCode);
  Get.updateLocale(locale);
}
 Navigator.push(context,MaterialPageRoute(builder: (context){return settings();}));

    }, child: AutoTranslateText(text:'حفظ',
            fontSize: 18,weight:FontWeight.w500 ,
            color:
           Color.fromARGB(255, 255, 255, 255))) ,)
 , 

   ],),)
 ,
 Container( width:isMobile?311: 770,child:
 
 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  Container(width: 255,child: Column(children: [
    Container(width: 255,height: 44,child: TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)
        
        )
        
        ),
        backgroundColor: Color.fromARGB(255, 244, 67, 54)),
      
      onPressed: (){}, child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        AutoTranslateText(text:'مسح الحساب',color:Color.fromARGB(255, 255, 255, 255) 
        ,fontSize: 18,weight: FontWeight.w500
        
        ),
        Icon(Icons.delete_outline,color:Color.fromARGB(255, 255, 255, 255) ,size: 24,),
        ],) ),)
  ],),)

,
AutoTranslateText(text:'احنا زعلانين لمغاده حسابك نتمني نشوفك تاني !!',
  fontSize: 14,weight: FontWeight.w400,
  color: Color.fromARGB(255, 244, 67, 54),)

 ],)
  ,)
 ],),)
 ],)
  ,)
],),


 
 
  ]) 
,)  
,
 
 Container(width:isMobile?311: 770






  


























            












          






          






      






           











  




























      



















              

              






              




         





 




























      



















              

              









              











       







         







  
 




                              












































































































   




 ),
  
  
                              
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 

  ]))

              
            ]
            
            ))    )

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
      child: AutoTranslateText(
        text:text,highlight: highlight
        
        
        
        
        
        
        
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
                      const SizedBox(height: 16),
                      _buildInfoRow('icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms (1).png', 'support@ashtar.app'),
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


Widget _buildPagination(HomeController controller, int currentPage) {
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
class GradesTable extends StatelessWidget {

  const GradesTable({super.key  } );

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(init: HomeController(), builder: (controller){

return 
    
     Container(
      
      
      
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                          child: Row( 
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
    ...List.generate(controller.examsoffon.length, (index){
      if(controller.examsoffon[index].grade!=0)
return Container(
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
      );
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