import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
// import 'package:my_app/app/modules/home/views/wallet.dart' show wallet;
import 'package:my_app/app/modules/home/views/walletMobile.dart';

import 'settings.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
HomeController controller=Get.find();
@override
void initState() {
  super.initState();
  controller.  dashboardTokenTimer?.cancel();
 controller.dashboardTokenTimer = null;
  
  controller.stopCentertimer();
  controller.isCenterActive.value = false;
}



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

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
                    onTap: () { showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );},
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  Image.asset('assets/Group87935.png', width: 55),
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
                            child: CircleAvatar(radius: 24),
                          ),
                          Image.asset('icons/Vector_3.png', width: 40, height: 41),
                          Image.asset('icons/Vector_2.png', width: 39.02, height: 40)
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
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Promo Banner
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

                    // Mobile Menu Bar
                    if (isMobile)
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 6, 69, 152),
                          ),
                          child: Scrollbar(
                            controller: controller.scrollController,
                            thumbVisibility: true,
                            thickness: 4,
                            radius: const Radius.circular(8),
                            child: SingleChildScrollView(
                              controller: controller.scrollController,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 120,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: InkWell(
                                      child: _buildMenuItem(
                                        Icons.person_2_outlined,
                                        'الملف الشخصي',
                                        textcolor: const Color.fromARGB(255, 6, 69, 152),
                                        color: const Color.fromARGB(255, 6, 69, 152),
                                      ),
                                      // onTap: () {
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      //     return Profile();
                                      //   }));
                                      // },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 85,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 6, 69, 152),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: InkWell(
                                      child: _buildMenuItem(
                                        Icons.account_balance_wallet_outlined,
                                        'محفظتك',
                                        textcolor: const Color.fromARGB(255, 255, 255, 255),
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        //   return walletMobile();
                                        // }));
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 85,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 6, 69, 152),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: _buildMenuItem(
                                      Icons.folder_copy_outlined,
                                      'محتواي',
                                      textcolor: const Color.fromARGB(255, 255, 255, 255),
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 85,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 6, 69, 152),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: _buildMenuItem(
                                      Icons.question_answer_sharp,
                                      'اساله الطالب',
                                      textcolor: const Color.fromARGB(255, 255, 255, 255),
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 80,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 6, 69, 152),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: _buildMenuItem(
                                      Icons.book_sharp,
                                      'كورساتي',
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      textcolor: const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 80,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 6, 69, 152),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: _buildMenuItem(
                                      Icons.quiz_outlined,
                                      'امتحناتي',
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      textcolor: const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    // Main Content
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sidebar for desktop
                          if (!isMobile) RightSidebar(),

                          if (!isMobile) const SizedBox(width: 20),

                          // Profile Content
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              width: isMobile ? double.infinity : 852,
                              padding: isMobile 
                                  ? EdgeInsets.fromLTRB(16, 24, 16, 24)
                                  : EdgeInsets.fromLTRB(40, 48, 40, 48),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: _buildProfileContent(controller, isMobile),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Footer
                    _buildFooter(context),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProfileContent(HomeController controller, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Header
        AutoTranslateText(
          text: 'الملف الشخصي',
          color: Color.fromARGB(255, 6, 69, 152),
          fontSize: isMobile ? 24 : 36,
          weight:isMobile?FontWeight.w500: FontWeight.w600,
          textAlign: TextAlign.start,
        ),

        SizedBox(height: isMobile ? 16 : 24),

        // User Code Section
        Container(
          width: isMobile ? double.infinity : 772,
          // padding: EdgeInsets.fromLTRB(isMobile ? 16 : 24, isMobile ? 16 : 24, isMobile ? 16 : 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: isMobile ? double.infinity : 629,
                child: AutoTranslateText(
                  text: 'الكود الخاص بك',
                  color: Color.fromARGB(255, 6, 69, 152),
                  fontSize: isMobile ? 18 : 36,
                  weight: FontWeight.w400,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Container(alignment: Alignment.centerRight,
                width: isMobile ? double.infinity : 629,
                child: Image.asset('assets/OIP1.png', 
                    width: isMobile ? 70 : 93.91, 
                    height: isMobile ? 67 : 90),
              ),
            ],
          ),
        ),

        SizedBox(height: isMobile ? 16 : 24),

        // Personal Information
        _buildPersonalInfoSection(controller, isMobile),

        SizedBox(height: isMobile ? 16 : 24),

        // Profile Image Section
        _buildProfileImageSection(controller, isMobile),

        SizedBox(height: isMobile ? 16 : 24),

        // Address Section
        _buildAddressSection(isMobile),
      ],
    );
  }

  Widget _buildPersonalInfoSection(HomeController controller, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 772,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المعلومات الشخصية',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 69, 152),
              fontSize: isMobile ? 24 : 32,
              fontWeight:isMobile?FontWeight.w500: FontWeight.w600,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Container(
            width: isMobile ? double.infinity : 724,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Personal Info Rows - Responsive layout
                isMobile
                    ? _buildMobilePersonalInfo(controller)
                    : _buildDesktopPersonalInfo(controller),
                
                SizedBox(height: isMobile ? 16 : 24),
                
                // Edit Button
                Container(
                  width: isMobile ? double.infinity : 394,
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تعديل البيانات',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color.fromARGB(255, 6, 69, 152),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobilePersonalInfo(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRowMobile('الاسم المستخدم:', controller.profileData?['name']),
        _buildInfoRowMobile('البريد الاليكتروني:', controller.profileData?['email']),
        _buildInfoRowMobile('الشعبه العلميه:', controller.profileData?['coursetype']),
        _buildInfoRowMobile('رقم تليفون الاب:', controller.profileData?['father_phone_num']),
        _buildInfoRowMobile('المدرسه:', controller.profileData?['stud_school']),
        _buildInfoRowMobile('الاسم بالكامل رباعي:', controller.profileData?['fullname']),
        _buildInfoRowMobile('رقم التليفون:', controller.profileData?['phoneNum']),
        _buildInfoRowMobile('الصف الدراسي:', controller.profileData?['semester']),
        _buildInfoRowMobile('رقم تليفون الام:', controller.profileData?['mother_phone_num']),
        _buildInfoRowMobile('المحافظه:', controller.profileData?['branch']),
      ],
    );
  }

  Widget _buildDesktopPersonalInfo(HomeController controller) {
    return Container(
      width: 724,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 138,
        children: [
          Container(
            width: 259,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('الاسم المستخدم:', controller.profileData?['name']),
                _buildInfoRow('البريد الاليكتروني:', controller.profileData?['email']),
                _buildInfoRow('الشعبه العلميه:', controller.profileData?['coursetype']),
                _buildInfoRow('رقم تليفون الاب:', controller.profileData?['father_phone_num']),
                _buildInfoRow('المدرسه:', controller.profileData?['stud_school']),
              ],
            ),
          ),
          Container(
            width: 327,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('الاسم بالكامل رباعي:', controller.profileData?['fullname']),
                _buildInfoRow('رقم التليفون:', controller.profileData?['phoneNum']),
                _buildInfoRow('الصف الدراسي:', controller.profileData?['semester']),
                _buildInfoRow('رقم تليفون الام:', controller.profileData?['mother_phone_num']),
                _buildInfoRow('المحافظه:', controller.profileData?['branch']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        '$label ${value ?? ''}',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color.fromARGB(255, 6, 69, 152),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildInfoRowMobile(String label, String? value) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child:Container(
        width: 400,
        child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color.fromARGB(255, 6, 69, 152),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value ?? '',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 69, 152),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),)
    );
  }

  Widget _buildProfileImageSection(HomeController controller, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 772,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الصورة الشخصية',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight:isMobile?FontWeight.w500: FontWeight.w600,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Container(
            width: isMobile ? double.infinity : 724,
            child: Column(
              children: [
                Container(
                  width: isMobile ? double.infinity : 676,
                  child: Wrap(
                    spacing: isMobile ? 8 : 16,
                    alignment: WrapAlignment.start,
                    children: [
                      Container(
                        width: isMobile ? double.infinity : 513,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'صورتك الشخصية',
                              style: TextStyle(
                                color: Color.fromARGB(255, 6, 69, 152),
                                fontWeight: FontWeight.w500,
                                fontSize: isMobile ? 20 : 24,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'الصورة الشخصية لازم تكون بصيغة jpg, jpeg, png و متكونش اكبر من 800px طول او عرض',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color.fromARGB(255, 80, 124, 181),
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image.network(
                            'http://localhost:3000${controller.profileData?['img']}',
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.person, size: 40, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? 16 : 24),
                Container(
                  width: isMobile ? double.infinity : 394,
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تعديل البيانات',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color.fromARGB(255, 6, 69, 152),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 772,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'العنوان',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 69, 152),
              fontSize: isMobile ? 24 : 32,
              fontWeight:isMobile?FontWeight.w500: FontWeight.w600,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Container(
            width: isMobile ? double.infinity : 724,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobile
                    ? _buildMobileAddressInfo()
                    : _buildDesktopAddressInfo(),
                
                SizedBox(height: isMobile ? 16 : 24),
                
                Container(
                  width: isMobile ? double.infinity : 394,
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تعديل البيانات',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color.fromARGB(255, 6, 69, 152),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileAddressInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRowMobile('المنطقه السكانيه:', 'مدينه نصر'),
        _buildInfoRowMobile('رقم العماره:', '123'),
        _buildInfoRowMobile('علامه مميزه:', 'صيدليه مريم'),
        _buildInfoRowMobile('المحافظه:', 'القاهره'),
        _buildInfoRowMobile('رقم الشقه:', '123'),
        _buildInfoRowMobile('رقم التليفون:', '01234567890'),
      ],
    );
  }

  Widget _buildDesktopAddressInfo() {
    return Container(
      width: 724,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 138,
        children: [
          Container(
            width: 259,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('المنطقه السكانيه:', 'مدينه نصر'),
                _buildInfoRow('رقم العماره:', '123'),
                _buildInfoRow('علامه مميزه:', 'صيدليه مريم'),
              ],
            ),
          ),
          Container(
            width: 327,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('المحافظه:', 'القاهره'),
                _buildInfoRow('رقم الشقه:', '123'),
                _buildInfoRow('رقم التليفون:', '01234567890'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {required Color color, required Color textcolor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 16.0),
        SizedBox(width: 8.0),
        Expanded(
          child: AutoTranslateText(
            text: title,
            color: textcolor,
            fontSize: 14,
            weight: FontWeight.w500,
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

  Widget _buildFooter(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 6, 69, 152),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 24,
                  spacing: 24,
                  children: [
                    // Contact Us Section
                    SizedBox(
                      width: isMobile ? double.infinity : 500,
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
                          // _buildInfoRowFooter('icons/location.png', '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                          // const SizedBox(height: 12),
                          // _buildInfoRowFooter('icons/Phone.png', '+20 106 662 0129'),
                          // const SizedBox(height: 12),
                          // _buildInfoRowFooter('icons/sms_1.png', 'support@ashtar.app'),
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

                    // About Section
                    SizedBox(
                      width: isMobile ? double.infinity : 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                            child: Wrap(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRowFooter(String iconPath, String text) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _navItem(String title, {Color color = const Color.fromARGB(255, 181, 181, 181), double fontSize = 20}) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}