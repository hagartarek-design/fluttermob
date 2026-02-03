import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/forgetpassword.dart';
import 'package:my_app/app/modules/home/views/login.dart';

class Forgetpasswordforashtar extends StatelessWidget {
  Forgetpasswordforashtar({super.key});
  final _maxLengthNotifier = ValueNotifier<int?>(null); 
  
  @override 
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
        
    Color.fromARGB(114, 45, 112, 239),
    Color.fromARGB(255, 255, 255, 255),
  
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 1120,
                      child: Stack(
                        
                        
                        
                        children: [
                       Positioned(child:   SizedBox(
                            width: 1120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset('assets/ashtar.png', width: 106, height: 106),
                                SizedBox(
                                  width: 1120, 
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 1120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          spacing: 16,
                                          children: [
                                            Text(
                                              'محتاجين البيانات دي لتسجيل حساب جديد',
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 6, 69, 152),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 32
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1120,
                                              child: Row(
                                                spacing: 16,
                                                children: [
                                                  SizedBox(
                                                    width: 552,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          'الاسم الاول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                        TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'ادخل الاسم رباعي',
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            hintTextDirection: TextDirection.rtl,
                                                            hintStyle: TextStyle(
                                                              color: Color.fromARGB(255, 154, 174, 255),
                                                            ),
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                width: 552,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8),
                                                            )
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  ),
                                                  SizedBox(
                                                    width: 552,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          'الاسم الاول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                        TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'ادخل الاسم رباعي',
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            hintTextDirection: TextDirection.rtl,
                                                            hintStyle: TextStyle(
                                                              color: Color.fromARGB(255, 154, 174, 255),
                                                            ),
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                width: 552,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8),
                                                            )
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  )
                                                ]
                                              )
                                            ),
                                            SizedBox(
                                              width: 1120,
                                              child: Row(
                                                spacing: 16,
                                                children: [
                                                  SizedBox(
                                                    width: 552,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          'الاسم الاول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                        Directionality(
                                                          textDirection: TextDirection.rtl,
                                                          child: SizedBox(
                                                            width: 552,
                                                            height: 44,
                                                            child: Row(
                                                              spacing: 8,
                                                              children: [
                                                                Container(
                                                                  width: 80,
                                                                  height: 44,
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                      color: Color.fromARGB(255, 154, 175, 228),
                                                                      width: 1
                                                                    ),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    color: Colors.white,
                                                                  ),
                                                                  child: IntlPhoneField(
                                                                    dropdownIcon: Icon(
                                                                      Icons.keyboard_arrow_down,
                                                                      size: 16                                                                           
                                                                    ),
                                                                    disableLengthCheck: true,
                                                                    dropdownIconPosition: IconPosition.leading,
                                                                    decoration: const InputDecoration(
                                                                      counter: SizedBox.shrink(),
                                                                      border: InputBorder.none,
                                                                      counterText: "",
                                                                      contentPadding: EdgeInsets.zero,
                                                                      isDense: true,
                                                                    ),
                                                                    dropdownTextStyle: TextStyle(
                                                                      fontSize: 0.0001,
                                                                      height: 0.0001,
                                                                      color: Colors.transparent,
                                                                    ),
                                                                    initialCountryCode: 'EG',
                                                                    languageCode: "ar",
                                                                    obscureText: false,
                                                                    showDropdownIcon: true,
                                                                    style: const TextStyle(
                                                                      fontSize: 0.0001,
                                                                      color: Colors.transparent,
                                                                      height: 0.0001,
                                                                    ),
                                                                    onChanged: (phone) {},
                                                                    onCountryChanged: (country) {
                                                                      _maxLengthNotifier.value = country.maxLength;
                                                                    },
                                                                  ),
                                                                ),
                                                                const SizedBox(width: 8),
                                                                Expanded(
                                                                  child: SizedBox(
                                                                    height: 44,
                                                                    width: 464,
                                                                    child: ValueListenableBuilder<int?>(
                                                                      valueListenable: _maxLengthNotifier,
                                                                      builder: (context, maxLength, _) {
                                                                        return TextField(
                                                                          decoration: InputDecoration(
                                                                            hintText: 'ادخل رقمp الهاتف',
                                                                            hintStyle: TextStyle(
                                                                              color: Color.fromARGB(255, 154, 175, 228)
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: Colors.white,
                                                                            contentPadding: const EdgeInsets.symmetric(
                                                                              vertical: 18,
                                                                              horizontal: 16
                                                                            ),
                                                                            border: OutlineInputBorder(
                                                                              borderSide: const BorderSide(
                                                                                color: Color.fromARGB(255, 154, 175, 228),
                                                                                width: 1
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(
                                                                                width: 1,
                                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            counterText: "",
                                                                          ),
                                                                          style: const TextStyle(fontSize: 16),
                                                                          keyboardType: TextInputType.phone,
                                                                          maxLength: maxLength,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  ),
                                                  SizedBox(
                                                    width: 552,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          'الاسم الاول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                        TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'ادخل الاسم رباعي',
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            hintTextDirection: TextDirection.rtl,
                                                            hintStyle: TextStyle(
                                                              color: Color.fromARGB(255, 154, 174, 255),
                                                            ),
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                width: 552,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8),
                                                            )
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  )
                                                ]
                                              )
                                            ),
                                            SizedBox(
                                              width: 1120,
                                              child: Row(
                                                spacing: 16,
                                                children: [
                                                  SizedBox(
                                                    width: 552,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          'الاسم الاول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                        TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'ادخل الاسم رباعي',
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            hintTextDirection: TextDirection.rtl,
                                                            hintStyle: TextStyle(
                                                              color: Color.fromARGB(255, 154, 174, 255),
                                                            ),
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                width: 552,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8),
                                                            )
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  ),
                                                  SizedBox(
                                                    width: 552,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          'الاسم الاول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                        TextField(
                                                          decoration: InputDecoration(
                                                            hintText: 'ادخل الاسم رباعي',
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            hintTextDirection: TextDirection.rtl,
                                                            hintStyle: TextStyle(
                                                              color: Color.fromARGB(255, 154, 174, 255),
                                                            ),
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                width: 552,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8)
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(255, 154, 175, 228)
                                                              ),
                                                              borderRadius: BorderRadius.circular(8),
                                                            )
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  )
                                                ]
                                              )
                                            ),
                                            SizedBox(
                                              width: 1120,
                                              child: Column(
                                                spacing: 8,
                                                children: [
                                                  SizedBox(
                                                    width: 1120,
                                                    height: 44,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      style: TextButton.styleFrom(
                                                        backgroundColor: Color.fromARGB(255, 6, 69, 152),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8)
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'اعمل حساب جديد',
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 1220,
                                                    child: Row(
                                                      spacing: 16,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgetpassword()));
                                                        },
                                                        child:  Text(
                                                          'تسجيل دخول',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 80, 124, 181),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16
                                                          ),
                                                        ),),
                                                        Text(
                                                          'عملت حساب قبل كده ؟!',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      )
                                    ],
                                  )
                                )
                              ],
                            )
                          )
                       ) ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}