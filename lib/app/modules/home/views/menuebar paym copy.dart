import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/models/wallet%20copy%203.dart';
import 'package:my_app/app/models/wallet.dart';
import 'package:my_app/app/modules/home/views/toggle.dart';

import '../controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/models/wallet.dart';
import 'package:my_app/app/modules/home/views/toggle.dart';

import '../controllers/home_controller.dart';

class Menuebarpaym2 extends StatefulWidget {
final int price;  
  final String sectionId;
  final String course;
const Menuebarpaym2({super.key,required this.price,required this.sectionId,required this.course});

  @override
  State<Menuebarpaym2> createState() => _Menuebarpaym2State();
}

class _Menuebarpaym2State extends State<Menuebarpaym2> {
bool valuetoggle=false;
String ?chargeCard="كارت شحن أشطر";
  String?SelectedMethod;
  @override
  Widget build(BuildContext context) 
  {
    return 
      
      GetBuilder( init:HomeController() ,builder: (controller){

          
          
          
        
    return  LayoutBuilder(
      
        builder: (  BuildContext context, BoxConstraints constraints,) {
  return Dialog(
      insetPadding: const EdgeInsets.only(left: 0),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      alignment: Alignment.centerLeft,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SizedBox(
        width: 343,
        height: MediaQuery.of(context).size.height,
        child: 
       SizedBox(
      width: 343,
      height: constraints.maxHeight * 0.9,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
      
              Text('تفاصيل الطلب',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
             , fontSize:24,fontWeight: FontWeight.w400 
              ),),SizedBox(height: 8,),
            Container(height: 96,
                  decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(8),
                border: Border(bottom: BorderSide(width: 1,color: Color.fromARGB(255, 179, 179, 179)))),
              child: Row( mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,   children: [
          
            Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1,color: Color.fromARGB(255, 6, 69, 152))),
              
            height: 72, 
            
             width: 311,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [

Text('ج.${'${widget.price} ج.م'}')  ,      
Column(children: [Text('كورس المراجعة'),
Text('الترم التاني [الصف الثالث الثانوي]')
  ,  
],),
    Image.asset(
                  'assets/logo1.png',
                  height: 40,width: 40,
                ),        ],)
            ],),),
          
         
              ],))  ,  
              
          
        SizedBox(height: 24,),
            
            
            
            

              

           
              
              
              
           
        
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
 SizedBox(
  
  width: 343, child :Text( 'طرق الدفع' ,textAlign: TextAlign.end,style: TextStyle( fontWeight: FontWeight.w600,fontSize: 24,color: Color.fromARGB(255, 6, 69, 152)))
             ),SizedBox(height: 24,),
     SizedBox(width: 311,height: 51, child: Row(children: [
     
 SizedBox(width: 64,height: 51,
 child: Column(children: [Text('${controller.profileData!['balance']} ج .م')
 , SizedBox(width: 39,height: 20,child: DraggableToggleSwitch(
                    initialValue:false ,
                   onToggleChanged: (value) {
                setState(() {
                  valuetoggle = value; 
                });
                
              },
                  ),)
                 ])
           ),                   
     


Container( child:Column(children:[
Text('استخدم رصيد اللي في محفظتك',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 14,fontWeight: FontWeight.w500
),),
Text('تقدر تدفع او تخصم من محفظتك',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
,fontSize: 12,fontWeight: FontWeight.w500
),),


])),
      Image.asset('assets/bocket.png')

           ],) ,) 
,

            SizedBox(height: 24,)
         ,  Text('اختار الطريقة المناسبة لطرق الدفع',textAlign: TextAlign.end,
         style: TextStyle(fontSize: 18,fontWeight:
          FontWeight.w500,color: Color.fromARGB(255, 6, 69, 152))),
        SizedBox(height: 24,),
          Row(children: [ SizedBox(width: 311,
        child: 
        
        Column(spacing: 16, children: [
          
           Row(
          children: [
            Row(
          children: [
          
          
          
          
          
    
          
          
            Container( width: 147.5,height: 81,
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245),
          borderRadius:BorderRadius.circular(16)
          ),
           child:Column( spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(width: 115.5,child: 

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/Group23576.png',height: 16,width: 16,),
             Radio<String>(
                                            value: "فوري باي",
                                            groupValue: SelectedMethod,
                                            onChanged: (val) {
                                              setState(() {
                                                SelectedMethod = val;
                                              });
                                            },
                                          ),
              
            ],),),
            
            Text('فوري باي',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
            ,fontSize: 14,fontWeight: FontWeight.w500
            ),)
            ],) 
          ),
          
          ],
        
        ),SizedBox(width: 8,),
            Container( width: 147.5,height: 81,
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245),
          borderRadius:BorderRadius.circular(16)
          ),
           child:Column( spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox( width: 115.5,child: 

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/Frame_17.png',height: 16,width: 16,),
         Radio<String>(
                                            value:chargeCard.toString(),
                                            groupValue: SelectedMethod,
                                            onChanged: (val) {
                                              setState(() {
                                                SelectedMethod = val;
                                                print(SelectedMethod);
                                              });
                                            },
                                          ),
            ],),),
            
            Text('كارت شحن أشطر',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
            ,fontSize: 14,fontWeight: FontWeight.w500
            ),)
            ],) 
          ),
          
          ],
        
        ),
           Row(
          children: [
          Row(
          children: [
           Container( width: 147.5,height: 81,
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245),
          borderRadius:BorderRadius.circular(16)
          ),
           child:Column( spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(width: 115.5,child: 

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/Group87970.png',height: 16,width: 79,),
               Radio<String>(
                                            value: "بطاقة دفع اءتمان",
                                            groupValue: SelectedMethod,
                                            onChanged: (val) {
                                              setState(() {
                                                SelectedMethod = val;
                                              });
                                            },
                                          ),
              
            ],),),
            
            Text('بطاقة (دفع-ائتمان)',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
            ,fontSize: 14,fontWeight: FontWeight.w500
            ),)
            ],) 
          ),SizedBox(width: 8,),
            Container( width: 147.5,height: 81,
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245),
          borderRadius:BorderRadius.circular(16)
          ),
           child:Column( spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(width: 115.5,child: 

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/Frame203.png',height: 16,width: 76.89,)
          , Radio<String>(
                                            value: "دفع-ائتمان",
                                            groupValue: SelectedMethod,
                                            onChanged: (val) {
                                              setState(() {
                                                SelectedMethod = val;
                                              });
                                            },
                                          ),    
            ],),),
            
            Text('بطاقة (دفع-ائتمان)',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
            ,fontSize: 14,fontWeight: FontWeight.w500
            ),)
            ],) 
          ),
          
          ],
        
        ),SizedBox(width: 8,),
          
          
          
          
          
          ],
        
        ),
        ],)
       

                    ),
                    
                    
                    
                    ],)
          ,
          Container(child: Column(children: [
       valuetoggle==false||  SelectedMethod!="كارت شحن أشطر"?
            Text('ادخل كود شحن محفظتك',textAlign: TextAlign.end,style:
           TextStyle(color: Color.fromARGB(255, 80, 124, 181),fontSize: 16,fontWeight: FontWeight.w500
           
           
           ),):Container()
         ,SizedBox(height: 10,)
           ,valuetoggle==false|| SelectedMethod!="كارت شحن أشطر"?
           TextField(
            controller: controller.codebywallet,
             decoration: InputDecoration( enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 154, 175, 228),
        width: 1.0,
      ),
    ),
    
    
    
        
    
    
    
  ),):Container(),
  
  
  
  
          
        
  
  
  SizedBox(height: 24,),
  
  
  Container(height: 0,width: 311,
  decoration: BoxDecoration(border: Border.all(width: 1,color: Color.fromARGB(255, 179, 179, 179),)),
  
  ),
  SizedBox(height: 24,),
  SizedBox(width: 311,child:Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
   Text('تفاصيل الطلبيه',textAlign: TextAlign.end, 
   style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 6, 69, 152)),
   ),
   SizedBox(height: 24,) 
,Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
  Text(widget.price != null
    ? "${widget.price} ج.م"
    : "اختر كورس",style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)),),
  SizedBox(height: 24,),
  Text('تكلفه الاشتراك',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)),)



],)  
,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Text(widget.price != null
    ? "${widget.price} ج.م"
    : "اختر كورس",style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 18,fontWeight: FontWeight.w500),),
  Text('الإجمالى بعد الخصم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 18,fontWeight: FontWeight.w500),)


],),
SizedBox(height: 24,)
,SizedBox( width:311,height: 44 ,child: TextButton(onPressed:(){
  
controller.fetchcourseinfoid(widget.course);
  controller.purchaseSection(sectionId:widget.sectionId);
},style: TextButton.styleFrom(
  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(8) ) ,
backgroundColor: Color.fromARGB(255, 6, 69, 152)  
,
), child: Text('ادفع'
,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)
,fontSize: 18,fontWeight: FontWeight.w500

),
)


,
),)





  ],))
  
           ],),)
          ])

            
          
      
      ),)
    )));
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
);});}}

class _MenuItem extends StatelessWidget {
  final String title;
  final bool isActive;
  const _MenuItem({required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
           
          color: isActive ? Color.fromARGB(255, 247, 194, 2) : Colors.white,
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
