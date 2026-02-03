
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:my_app/app/modules/home/views/signup.dart';
import '../controllers/home_controller.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class Forgetpasswordotp2 extends StatelessWidget {
      Forgetpasswordotp2({super.key});
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
      
      
      width: 640,height: 832,
      child:
   Image.asset('assets/forgotpassword1.png',width: 497,height: 388,) ,)   ,                 
                  
                
            
                
                
                
                
                
                   Container(
                    width: 617,
                    height: 832,
                    padding: const EdgeInsets.fromLTRB(80, 85, 80, 52),
                    
                    child: Column(
                      
                      children: [

                       SizedBox(width: 453,
                       child: Column(
                        spacing: 16,crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                        SizedBox(
                          width: 457,height: 106,
                          child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [ Image.asset('assets/logo1.png',width: 106,height: 106,)],) 
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
                      children: [ Text('ادخل كلمه السر الجديده' ,style: TextStyle(
                        color:Color.fromRGBO(6, 69, 152, 1),fontSize: 32
                        ,fontWeight: FontWeight.w600 ),)
                       
                        ])
                         ,
            


































 



                  
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                      
                    
                  SizedBox( width: 457,
                  child:
                   Column(
                    spacing: 12,crossAxisAlignment: CrossAxisAlignment.end,
                    children: [ 
                      Container(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [  
                        Text('كلمة المرور',style: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: 16,
                        color :Color.fromARGB(255, 80, 124, 181)),)
                      ],),),
                     TextField(
 textDirection: TextDirection.rtl, decoration: InputDecoration(
    
    filled: true,
    fillColor: Colors.white, 

    hintText: '****************',
    hintTextDirection: TextDirection.rtl,
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 80, 124, 181),
    ),

    prefixIcon: Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 80, 124, 181),
    ),

    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 124, 181),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 124, 181),
        width: 1,
      ),
    ),
  ),
)
,])
                      )
                      ,
                      Row(
                        
                        children: [ 
                         Container(width: 145.67,height: 4,
                      decoration:ShapeDecoration(
                        color: Colors.transparent,
                     
                        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(4)) )
                      ),
                         Container(width: 145.67,height: 4,
                      decoration:ShapeDecoration(   color: Color.fromARGB(255, 39, 114, 83),shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(4)) )
                      ),
                         Container(width: 145.67,height: 4,
                      decoration:ShapeDecoration(   color: Color.fromARGB(255, 39, 114, 83),shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(4)) )
                      ),
                      ],)
                    
                      
                      
                      ],),
              
                  
              
                  
                          
                          
                          
                          
                          
                            
                             
                              ) 
                          ],
            ),
          ), 
          Container( child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [  
                        Text('تاكيد كلمة المرور',style: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: 16,
                        color :Color.fromARGB(255, 80, 124, 181)),)
                      ],),),
                     TextField(
 textDirection: TextDirection.rtl, decoration: InputDecoration(
    
    filled: true,
    fillColor: Colors.white, 

    hintText: '****************',
    hintTextDirection: TextDirection.rtl,
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 80, 124, 181),
    ),

    prefixIcon: Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 80, 124, 181),
    ),

    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 124, 181),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 124, 181),
        width: 1,
      ),
    ),
  ),
)
                      
              ,  SizedBox(
                width: 457,height: 23,
                child:TextButton(onPressed: (){},
              
              style: TextButton.styleFrom(

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                backgroundColor: Color.fromARGB(255, 6, 69, 152))
               ,child: Text('حفط',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),)) ,)      
                      
                      ])),
                      
                      
                      ]))
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