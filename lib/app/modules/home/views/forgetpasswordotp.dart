
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:my_app/app/modules/home/views/forgetpasswordotp2.dart';
import 'package:my_app/app/modules/home/views/signup.dart';
import '../controllers/home_controller.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class Forgetpasswordotp extends StatelessWidget {
      Forgetpasswordotp({super.key});
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  final TextEditingController phoneNumberController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      
      builder: (controller) {
        return Scaffold(
          body: Container(
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

                
                
                  
                  
                  
                  
                  


Container(
  
  
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      
      
      width: 617,height: 832,
      child:SizedBox(width: 497,height: 388, child:  Image.asset('assets/forgot password 1.png',) ,)
 )   ,                 
                  
                
            
                
                
                
                
                
                   Container(
                    width: 613,
                    height: 832,
                    padding: const EdgeInsets.fromLTRB(80, 85, 80, 52),
                    
                    child: Column(
                      
                      children: [

                       SizedBox(width: 453,height: 426,
                       child: Column(
                        spacing: 16,
                        children: [
                        SizedBox(
                          width: 457,height: 106,
                          child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [ Image.asset('assets/logo 1.png',width: 106,height: 106,)],) 
                          ,)
                     ,
                     SizedBox(
                      width: 453,
                      child:Column(
                        spacing: 32,
                        children: [
                      SizedBox( width: 457,child:Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 16, children: [
                      Row( mainAxisAlignment: MainAxisAlignment.end, 
                      children: [ Text('ادخل كود' ,style: TextStyle(
                        color:Color.fromRGBO(6, 69, 152, 1),fontSize: 32
                        ,fontWeight: FontWeight.w600 ),)
                       
                        ])
                        ,Text('ادخل كود التفعيل الموجود فى الرسائل الخاصة بك',textAlign: TextAlign.end
                        ,style: TextStyle(color:
                         Color.fromARGB(255, 80, 124, 181)
                        ,fontWeight: FontWeight.w400
                          ,fontSize: 18,
                        ),) ,
            


































 



                  
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                      
                    
                  
                  
                   Column(
                    spacing: 16,
                    children: [ 
                SizedBox( width: 457,height: 96, 
                child:
                SizedBox(width:457 ,child: 
                
                Column(children: [
                     Container( child:Row(
            spacing: 8,mainAxisAlignment: MainAxisAlignment.end,
            children: [
          SizedBox( width:62.17 ,height:60, child: TextField( 
            maxLength: 1,
            decoration:InputDecoration(
           counterText: "",   
            filled: true,fillColor: Colors.white,
                    border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),)
                  
                  
                  
                  

                ),),
          SizedBox( width:62.17 ,height:60, child: TextField(
            maxLength: 1,
             decoration:InputDecoration(
           counterText: "",    filled: true,fillColor: Colors.white,     border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),)
                  
                  
                  
                  

                ),),
          SizedBox( width:62.17 ,height:60, child: TextField(
       maxLength: 1,
             decoration:InputDecoration(
           counterText: "", 
                filled: true ,fillColor: Colors.white,    border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),)
                  
                  
                  
                  

                ),),
          SizedBox( width:62.17 ,height:60, child: TextField(    maxLength: 1,
             decoration:InputDecoration(
           counterText: "", 
                filled: true,fillColor: Colors.white,    border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),)
                  
                  
                  
                  

                ),),
          SizedBox( width:62.17 ,height:60, child: TextField(    maxLength: 1,
             decoration:InputDecoration(
           counterText: "", 
             filled: true,fillColor: Colors.white,       border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),)
                  
                  
                  
                  

                ),),
          SizedBox( width:62.17 ,height:60, child: TextField(    maxLength: 1,
             decoration:InputDecoration(
           counterText: "", 
              filled: true,fillColor: Colors.white,      border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),)
                  
                  
                  
                  

                ),),
                
                
                ],) ,)  ,Container(
              alignment: Alignment.centerRight,
              child: Text('59:00',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
              ,fontSize: 16,
              fontWeight: FontWeight.w400
              
              ),
              
              
              ) )
              
              
              
              ],)
                
        
           
           
           
             )  )

             ,Row(mainAxisAlignment: MainAxisAlignment.end,
              spacing: 12,
              children: [
              Container(
                
                child:Row(children: [  
                Text('اعادة الارسال',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 16,fontWeight: FontWeight.w500)
                ),
              Image.asset('icons/Group.png',width: 20,height: 20,),],))
            ,
            InkWell(child:Text('لم يصلك الكود؟',style: TextStyle(color:
               Color.fromARGB(255, 6, 69, 152),
              fontSize: 16,fontWeight:FontWeight.w500 ), ) ,onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgetpasswordotp2())))  

             ],)
             ],),
              
                  
              
                  
                          
                          
                          
                          
                          
                            ])    ) 
                          ],
            ),
          ),
                      ]))]))
                      ]))],)));
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
            leading: Text(country.flag),
            title: Text(country.name),
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