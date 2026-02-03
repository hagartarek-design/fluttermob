import 'package:flutter/material.dart';

class MenuDialog extends StatelessWidget {
  const MenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 0),
      backgroundColor: const Color.fromARGB(255, 6, 70, 152),
      alignment: Alignment.centerLeft,
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,   children: [
            
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'icons/Vector.png',
                  height: 40,
                ),
              ),
            Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/Group87935.png',
                  height: 40,
                ),
              ),
              ],)  ,  
              const SizedBox(height: 30),            
              Column( children: [      
            Column(spacing: 16, children: [       
              const _MenuItem(title: "الرئيسية", isActive: true),
Container(width: 214,height: 0 ,decoration: BoxDecoration(
  borderRadius:BorderRadius.circular(0.4)
 , color: Color.fromARGB(255, 236, 238, 241),),)]) ,
              
              
              
              ],)
      
,
              const Spacer(),

           
              
              
              
            ],
          ),
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
           
          color: isActive ? Color.fromARGB(255, 247, 194, 2) : Colors.white,
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
