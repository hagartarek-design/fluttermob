import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import '../controllers/home_controller.dart';
class Mainpage extends StatelessWidget {
   Mainpage({super.key});
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  final TextEditingController phoneNumberController = TextEditingController();
  String? _hint;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); 
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isMobile2 = screenWidth < 1050;

   
    return GetBuilder<HomeController>(
      
      builder: (controller) {
        return Scaffold(
          body:SingleChildScrollView( child: Wrap(children: [Container(
alignment: Alignment.center,           
color: const Color.fromARGB(255, 245, 245, 245),
            child: Stack(
              children: [
                Container(
                  height: 352,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(115, 21, 112, 239),
                        Color.fromARGB(255, 245, 245, 245),
                      ],
                    ),
                  ),
                ),
                 !isMobile&&!isMobile2?  Container(
                    width: 704,
                    height: 832, 
 child :Stack(children: [  Positioned(top: 276,left: 32, 
 child:Wrap(children: [Image.asset('assets/sign up 22 1.png')],)                      
                 ,width: 641, )]),
              ):Container(),
          
              !isMobile&&!isMobile2 ?  Positioned(
                 left:0, top: 2,
                  right: 662,
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                        Container(
                          margin: EdgeInsets.only(bottom: isMobile ? 20 : 32),
                          child: Image.asset(
                            'assets/logo 1.png',
                            width: isMobile ? double.infinity  : 106,
                            height: isMobile ? screenWidth * 0.25 : 106,
                            fit: BoxFit.contain,
                          ),
                        ),

                        
                        Container(
                          width:isMobile? 343:457,
                          
                          child:InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return Homeafterlogin();}));},
                            child: AutoTranslateText(
                            text: 'تسجيل دخول',
                            color: Color.fromARGB(255, 6, 69, 152),
                            fontSize:  28 ,
                            weight: FontWeight.w600,
                            textAlign: TextAlign.start,
                          ),) 
                        ),

                        
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: isMobile ? 343 : 457,
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              
                              _buildTextField(
                                label: 'البريد الالكتروني',
                                hintText: 'ادخل البريد الالكتروني',
                                controller: controller.emailController,
                                isMobile: isMobile,
                              ),

                              SizedBox(height: isMobile ? 20 : 24),

                              
                              _buildTextField(
                                label: 'كلمة المرور',
                                hintText: 'ادخل كلمة المرور',
                                controller: controller.passwordController,
                                isMobile: isMobile,
                                isPassword: true,
                              ),

                              SizedBox(height: isMobile ? 32 : 40),

                              
                              Container(
                                width: double.infinity,
                              padding: EdgeInsets.all(10),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 6, 69, 152),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    
                                  ),
                                  onPressed: () {
                                    
                                    Navigator.push(context, MaterialPageRoute(builder: (context){return Homeafterlogin();}));
                                  },
                                  child: AutoTranslateText(
                                    text: 'تسجيل دخول',
                                    color: Colors.white,
                                    fontSize: isMobile ? 18 : 16,
                                    weight: isMobile ?FontWeight.w500: FontWeight.w600,
                                  ),
                                ),
                              ),

                              SizedBox(height: isMobile ? 24 : 32),

                              
                              Container(
                                margin: EdgeInsets.only(bottom: isMobile ? 16 : 20),
                                child:Row(
                                  
                                  children: [
                                    AutoTranslateText(
                                  text: 'ماعندكش حساب ؟',
                                  color: Colors.black,
                                  fontSize: isMobile ? 16 : 14,
                                  textAlign: TextAlign.center,weight: FontWeight.w400,
                                ),
                                    AutoTranslateText(
                                  text: ' دوس هنا والحق اشترك ببلاش',
                                  color: Color.fromARGB(255, 80, 124, 181),
                                  fontSize: isMobile ? 16 : 14,weight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                                ],) 
                              ),

                              
                              if (isMobile)
                                Column(
                                  children: [
                                    
                                    _buildSocialButton(
                                      icon: 'assets/facebook circle.png',
                                      text: 'تسجبل دخول عبر',
                                      onPressed: () {},
                                      isMobile: isMobile,
                                    ),
                                    SizedBox(height: 12),
                                    
                                    _buildSocialButton(
                                      icon: 'assets/Google@2x (1).png',
                                      text: 'سجل دخول عبر',
                                      onPressed: () {},
                                      isMobile: isMobile,
                                    ),
                                  ],
                                )
                              else
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildSocialButton(
                                        icon: 'assets/facebook circle.png',
                                        text: 'تسجيل دخول عبر',
                                        onPressed: ()async {
                                        },
                                        isMobile: isMobile,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: _buildSocialButton(
                                        icon: 'assets/Google@2x (1).png',
                                        text: 'تسجيل دخول عبر',
                                        onPressed: () {},
                                        isMobile: isMobile,
                                      ),
                                    ),
                                  ],
                                ),

                              SizedBox(height: isMobile ? 32 : 40),

                              
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoTranslateText(
                                      text: 'ماعندكش حساب ؟',
                                      fontSize: isMobile ? 16 : 14,
                                      color: Colors.black87,
                                    ),
                                    SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: AutoTranslateText(
                                        text: 'سجل هنا',
                                        fontSize: isMobile ? 16 : 14,
                                        color: Color.fromARGB(255, 6, 69, 152),
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
             ):  Center(
                    
                    
                    
                    
                    child: Column(
                      
                      children: [

                       Container( width:!isMobile||!isMobile2? 457:343,
                       child: Column(
                        spacing: 24,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                          child:Wrap(
                          alignment: WrapAlignment.start,
                          children: [ Image.asset('assets/logo 1.png',width: 106,height: 106,)],) 
                          ,width: 457,height: 106,)
                     ,
                     Container(
                      width: 457,
                      child:Column(
                        spacing: 32,
                        children: [
                      Container( width: 457,child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16, children: [
                      Wrap( alignment: WrapAlignment.start, 
                      children: [ AutoTranslateText(text:'تسجيل انشاء حساب',
                        color:Color.fromARGB(255, 6, 69, 152),fontSize: 32
                        ,weight: FontWeight.w600 ,)])
                        ,
          
Container( width: 457, child:Column(
  spacing: 8,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
AutoTranslateText( text:'البريد الالكتروني',
weight: FontWeight.w500,
fontSize: 16,color: Color.fromARGB(255, 80, 124, 181)),
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:
  
  Container(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
 
    
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 50,
              child:
              
              
              TextField(
                controller: controller.emailController,          
              decoration: InputDecoration(
            
                label:AutoTranslateText(text:'ادخل البريد الالكتروني' , color: Colors.grey,) ,
                
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: "", 
              ),
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.phone,
              maxLength: maxLength,
             ) );
          },
        ),
      ),
  
    ],
  ),
) 
  )

])
                        
                        
                        
                        )   ,                     
                        
Container( width: 457, child:Column(
  spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
AutoTranslateText(text:'كلمة المرور',
weight: FontWeight.w500,
fontSize: 16,color: Color.fromARGB(255, 80, 124, 181),),
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:
  
  Container(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
 
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 44,
              child:
              
              
              TextField(
                       controller: controller.passwordController,
              decoration: InputDecoration(
            
                hintText: 'ادخل كلمة المرور',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: "", 
              ),
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.phone,
              maxLength: maxLength,
             ) );
          },
        ),
      ),
  
    ],
  ),
) 
  )

])
                        
                        
                        
                        )   ,                  
    
                      
                    
                  Container(width: 457,
                  child: Column(
                    spacing: 24,
                    children: [
                Container( width: 457,height: 50, child:     TextButton(
                     style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                 backgroundColor:MaterialStateProperty.all( Color.fromARGB(255, 6, 69, 152)
      ),  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          
                                    ))),
      
                      onPressed:()async{ 
                        


          
                        
                      }
                        
                      , child: AutoTranslateText(
      text: 'تسجيل دخول',
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 16,
    ), 
          )
                  )
                  
                  ,
                  
         Wrap(
  spacing: 16,
  runSpacing: 16,
  children: [
    Container(
      width:!isMobile? 220.5:343,
      height: 50,
      child: TextButton(
  onPressed:() async {
  
  } ,style : ButtonStyle(
        
       side:MaterialStateProperty.all<BorderSide>(BorderSide(color:Color.fromARGB(255, 6, 69, 152) ,width: 1)) ,       shape: MaterialStateProperty
       .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          )
          
          )
                                    )
 , child:  Row(
  spacing: 16,mainAxisAlignment: MainAxisAlignment.center,
  children: [ 
  Image.asset('assets/facebook circle.png',width: 24,height: 44,),
    AutoTranslateText(text:'تسجبل دخول عبر',weight: FontWeight.w500,
    color:Color.fromARGB(255, 6, 69, 152))

  ]) )
                  
                  
                  
                        )  ,
        
        
          Container(
       width:!isMobile? 220.5:343,  height: 50,   child: 
          
TextButton(
  onPressed: ()async{

 
 try {
              final userCredential = await controller.  signInWithGoogle();

if (userCredential != null) {
  final user = userCredential.user;
  print("✅ Login Success:");
  Navigator.push(context,MaterialPageRoute(builder: (context){return Homeafterlogin(); }));
  print("Name: ${user?.displayName}");
  print("Email: ${user?.email}");
  
  
} else {
  print("ser cancelled sign-in");

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sign-in cancelled")),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: $e")),
              );
              print('eee$e');
            }         

  },style : ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
       side:MaterialStateProperty.all<BorderSide>(BorderSide(color:Color.fromARGB(255, 6, 69, 152) ,width: 1)) ,       shape: MaterialStateProperty
       .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          )
          
          )
                                    )
 , child:Row(mainAxisAlignment: MainAxisAlignment.center,
  spacing: 16,
  children: [ 
  Image.asset('assets/Google@2x (1).png',width: 24,height: 44,),
  AutoTranslateText(text:'تسجبل دخول عبر',weight: FontWeight.w500,fontSize: 18,
    color:Color.fromARGB(255, 6, 69, 152))]))),
          
                                      
                                   
                                   Container(width: 457,height: 20,child: 
                                   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                    AutoTranslateText(text:' دوس هنا والحق اشترك ببلاش' ,color:Color.fromARGB(255, 80, 124, 181)  ,)
                                    ,InkWell(
                                      onTap: ()async{
                                  
                                  
                                  

                                  
                                  }    ,
                                      child:  AutoTranslateText(text:'ماعندكش حساب ؟'
                                      ,weight: FontWeight.w400,
                                      color:Color.fromARGB(255, 12, 12, 12) ),)
                                     ],),)
                                            ],)    ],),
              
                  ) 
              
                        ])  ) ],
            ),
          ),
                      ]))]))
                      ]))],) ) );
      },
    );
  }
final ValueNotifier<Country>selectedCountry=ValueNotifier(countries.firstWhere((c)=>c.code=='EG'));

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView(
        children: countries.map((country) {
          return ListTile(
            leading:AutoTranslateText(text: country.flag),
            title: AutoTranslateText(text:"${country.name}"),
            onTap: () {
              
                selectedCountry.value = country;
              
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  
}
 
 Widget _buildTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool isMobile,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: AutoTranslateText(
            text: label,
            fontSize: isMobile ? 16 : 14,
            color: Color.fromARGB(255, 80, 124, 181),
            weight: FontWeight.w500,
          ),
        ),

        
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: isMobile ? 56 : 50,
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: isMobile ? 16 : 14,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isMobile ? 16 : 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 154, 175, 228),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 154, 175, 228),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 6, 69, 152),
                    width: 2,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: isMobile ? 16 : 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
 Widget _buildSocialButton({
    required String icon,
    required String text,
    required VoidCallback onPressed,
    required bool isMobile,
  }) {
    return Container(
      height: isMobile ? 56 : 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: Color.fromARGB(255, 6, 69, 152),
            width: 1,
          ),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Image.asset(
              icon,
              width: isMobile ? 24 : 24,
              height: isMobile ? 24 : 24,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12),
            AutoTranslateText(
              text: text,
              fontSize: isMobile ? 18 : 18,
              color: Color.fromARGB(255, 6, 69, 152),
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }