import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym%20copy.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/routes/app_pages.dart';
class Subjects extends StatefulWidget {
   final String courseId;
  final List<dynamic> courseInfos;
  const Subjects({super.key, required this.courseId, required this.courseInfos});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: _buildAppBar(isMobile, context),
    body: GetBuilder<HomeController>(
  builder: (controller) {
    return _buildBody(context, controller, isMobile, screenWidth);
          
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isMobile, BuildContext context) {
    if (isMobile) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 6, 70, 152),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap: (){    showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );},
              child: const Icon(Icons.menu, color: Colors.white),
            ),
            Image.asset('assets/Group87935.png',  cacheWidth: 110),
          ],
        ),
      );
    } else {
      return AppBar(
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
                    const SizedBox(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(radius: 24),
                    ),
                    Image.asset('icons/Vector_3.png', cacheHeight: 41, cacheWidth: 80),
                    Image.asset('icons/Vector_2.png', cacheHeight: 40, cacheWidth: 78)
                  ],
                ),
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
                    Image.asset('assets/Group87935.png', cacheWidth: 55),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildBody(BuildContext context,  controller, bool isMobile, double screenWidth) {
    
    

    controller.fetchcourseinfoid(widget.courseId);
    
      
    
    return LayoutBuilder(
      
      builder: (BuildContext context, BoxConstraints constraints) {
       return SingleChildScrollView(
          child: Column(
            children: [
              _buildDiscountBanner(isMobile),
              const SizedBox(height: 20),
              _buildTeacherInfo(isMobile, screenWidth, context),
              const SizedBox(height: 20),
              _buildThumbnailImage(context, screenWidth),
              const SizedBox(height: 20),
              _buildLecturesSection(context, controller, constraints),
              const SizedBox(height: 24),
              _buildFooter(context),
              _buildCopyrightText(),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDiscountBanner(bool isMobile) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 242, 195, 42),
      padding: const EdgeInsets.all(8),
      child: Text(
        'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color.fromARGB(255, 6, 69, 152),
          fontSize: isMobile ? 14 : 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTeacherInfo(bool isMobile, double screenWidth, BuildContext context) {
    return SizedBox(
      width: !isMobile ? 1280 : screenWidth,
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.start,
        children: [  
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Homeafterlogin())),
            child: _buildBreadcrumbItem('الرئيسية', isActive: false),
          ),
          _buildBreadcrumbDivider(),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Subjecttype())),
            child: _buildBreadcrumbItem('الصف الثالث الثانوي', isActive: false),
          ),
          _buildBreadcrumbDivider(),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Subjectbooks())),
            child: _buildBreadcrumbItem('مادة الفيزياء', isActive: false),
          ),
          _buildBreadcrumbDivider(),
          InkWell(
            child: _buildBreadcrumbItem('شوف المحاضره', isActive: false),
          ),
          _buildBreadcrumbDivider(),
          _buildBreadcrumbItem('شوف المحاضره المسجله'),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(String text, {bool isActive = true}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isActive 
            ? const Color.fromARGB(255, 6, 69, 152)
            : const Color.fromARGB(255, 181, 181, 181),
      ),
    );
  }

  Widget _buildBreadcrumbDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Icon(Icons.arrow_forward_ios, 
          color: Color.fromARGB(255, 181, 181, 181), size: 14),
    );
  }

  Widget _buildThumbnailImage(BuildContext context, double screenWidth) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Subjecttype())),
      child: Image.asset(
        'assets/thumb4.png',
        
        fit: BoxFit.fitWidth,
        cacheWidth: screenWidth.toInt(),
      ),
    );
  }

  Widget _buildLecturesSection(BuildContext context,  controller, BoxConstraints constraints) {
    final displayedInfos = controller.course_info.isNotEmpty 
        ? controller.course_info 
        :widget. courseInfos;

    
    int totalSectionsLength = 0;
    for (var course in controller.course_info) {
      if (course.section != null && course.section is List) {
        totalSectionsLength += (course.section as List).length;
      }
    }

    return SizedBox(
      width: constraints.maxWidth * 0.95,
      child: Column(
        children: [
          SizedBox(
            width: constraints.maxWidth * 0.95,
            height: 40,
            child: InkWell(
              onTap: () {},
              child: const Text(
                'شوف المحاضره المسجله',
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 69, 152),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            children: List.generate(totalSectionsLength, (index) {
              return _buildLectureCard(context, controller, index);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildLectureCard(BuildContext context,  controller, int sectionIndex) {
    String? sectionId;
    try {
      final allSections = <dynamic>[];
      for (var course in controller.course_info) {
        if (course.section != null && course.section is List) {
          allSections.addAll(course.section as List);
        }
      }
      
      if (sectionIndex < allSections.length) {
        final section = allSections[sectionIndex];
        if (section is Map && section.containsKey('id')) {
          sectionId = section['id'].toString();
        }
      }
    } catch (e) {
      print('Error getting section ID: $e');
    }

    if (sectionId == null) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset('assets/lecturecard.png',  cacheHeight: 396, cacheWidth: 536),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(1, 255, 255, 255),
            ),
          ),
        ),
        _buildLectureCardHeader(controller, sectionIndex),
        _buildLectureCardButton(context, controller, sectionIndex),
      ],
    );
  }

  Widget _buildLectureCardHeader( controller, int sectionIndex) {
    String sectionName = 'المحاضرة';
    try {
      final allSections = <dynamic>[];
      for (var course in controller.course_info) {
        if (course.section != null && course.section is List) {
          allSections.addAll(course.section as List);
        }
      }
      
      if (sectionIndex < allSections.length) {
        final section = allSections[sectionIndex];
        if (section is Map && section.containsKey('name')) {
          sectionName = section['name']?.toString() ?? 'المحاضرة';
        }
      }
    } catch (e) {
      print('Error getting section name: $e');
    }

    return Container(
      width: 268,
      height: 128,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 6, 69, 152),
            Color.fromARGB(171, 118, 162, 212),
          ],
        ),
      ),
      child: SizedBox(
        width: 236,
        height: 49,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              sectionName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ' فيديوهات-5\n PDF 7-\n امتحانات و واجبات',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLectureCardButton(BuildContext context,  controller, int sectionIndex) {
    final allSections = <dynamic>[];
    for (var course in controller.course_info) {
      if (course.section != null && course.section is List) {
        allSections.addAll(course.section as List);
      }
    }

    if (sectionIndex >= allSections.length) return const SizedBox.shrink();

    final section = allSections[sectionIndex];
    final bool isUsed = section['isUsed'] == false;

    return Positioned(
      top: 326,
      left: 24,
      child: SizedBox(
        width: 220,
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: isUsed
                ? const Color.fromARGB(255, 6, 69, 152)
                : Colors.white,
            side: BorderSide(
              color: isUsed
                  ? const Color.fromARGB(255, 6, 69, 152)
                  : Colors.grey,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            if (!isUsed) {
     
              await _handleLectureCardPress(context, controller, sectionIndex,isUsed);
            } else {
              await _handleLectureCardPress(context, controller, sectionIndex,isUsed);
              final price = int.tryParse(section['price'].toString()) ?? 0;
            controller.fetchPercent(sectionId:section['id'].toString()??'1');
              
              

              
              
              
              
              
            }
          },
          child: Text(
            isUsed ?'شوف المحاضرة'  : 'اشترك دلوقتي',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isUsed
                  ? Colors.white
                  : const Color.fromARGB(255, 6, 69, 152),
            ),
          ),
        ),
      ),
    );
  }

Future<void> _handleLectureCardPress(BuildContext context, HomeController controller, int sectionIndex,isUsed) async {
  try {
    print('🎯 Handling lecture card press for section index: $sectionIndex');
    
    // Get section ID safely
    final allSections = <dynamic>[];
    for (var course in controller.course_info) {
      if (course.section != null && course.section is List) {
        allSections.addAll(course.section as List);
      }
    }
    
    if (sectionIndex >= allSections.length) {
      print('❌ Section index out of bounds');
      return;
    }
    
    final section = allSections[sectionIndex];
    final sectionId = section['id']?.toString();
    final sectionName = section['name']?.toString() ?? 'Section $sectionIndex';
    
    print('📋 Section ID: $sectionId');
    print('📋 Section Name: $sectionName');
    
    if (sectionId == null) {
      print('❌ Section ID is null');
      return;
    }
    
    // Show loading indicator
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    
    try {
      // Fetch section data
      await controller.fetchsectionid(sectionId);
      
      // Close loading dialog
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      
      // Process the fetched data
      String courseId = '';
      List<dynamic> lessons = [];
      List<dynamic> exams = [];

      // Extract course info and lessons from the fetched section data
      for (var sectionData in controller.section) {
        if (sectionData.section != null && sectionData.section is List) {
          for (var sec in sectionData.section as List) {
            if (sec['id']?.toString() == sectionId) {
              print('✅ Found matching section');
              
              if (sec['course'] != null) {
                courseId = sec['course']['id']?.toString() ?? '';
                print('📋 Course ID: $courseId');
              }
              
              if (sec['lessons'] != null && sec['lessons'] is List) {
                lessons = sec['lessons'] as List;
                print('📋 Number of lessons: ${lessons.length}');
              }
              
              if (sec['exams'] != null && sec['exams'] is List) {
                exams = sec['exams'] as List;
                print('📋 Number of exams: ${exams.length}');
              }
              break;
            }
          }
        }
      }

      if (courseId.isEmpty) {
        print('❌ Course ID is empty');
        Get.snackbar(
          'Error',
          'Could not find course information',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Initialize player
      await controller.initializePlayer(courseId);
      
      // Prepare navigation arguments
      final arguments = {
        'courseId': courseId,
        'sectionId': sectionId,
        'sectionIndex': sectionIndex,
        'sectionName': sectionName,
        'lessons': jsonEncode(lessons),
        'exams': jsonEncode(exams),
        'isUsed':isUsed
      };
      
      print('🚀 Navigating to Lecturenotpaid with arguments: $arguments');
      
      // Navigate to Lecturenotpaid
      await Get.toNamed(
        Routes.LECTURENOTPAID,
        arguments: arguments,
      );
      
    }  catch (fetchError) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      } 
      print('❌ Error fetching section data: $fetchError');
      rethrow;
    }
    
  } catch (e, stackTrace) {
    print('❌ Error handling lecture card press: $e');
    print('📋 Stack trace: $stackTrace');
    
    Get.snackbar(
      'Error',
      'Failed to load section. Please try again.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
  
  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 6, 69, 152),
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
                  _buildContactSection(context),
                  _buildAboutSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth < 600 ? double.infinity : 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // _buildSectionTitle('تواصل معنا'),
          // const SizedBox(height: 16),
          // _buildInfoRow('icons/location.png', '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
          // const SizedBox(height: 12),
          // _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
          // const SizedBox(height: 12),
          // _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
          // const SizedBox(height: 12),
          _buildSocialIcons(),
          const SizedBox(height: 16),
          _buildSectionTitle('حمل التطبيق الان'),
          const SizedBox(height: 12),
          _buildStoreButtons(),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return SizedBox(
      width: 600,
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
                  color: const Color.fromARGB(255, 242, 195, 42),
                  fontSize: 24),
            ],
          ),
          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.centerRight,
            child: Image(
              image: AssetImage('assets/Group87935.png'),
              width: 80,
              height: 65.7,
              
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionTitle('عن أشطر'),
          const SizedBox(height: 8),
          const Text(
            'أشطر معتمدة من كوجنيا واحدة من أكبر المؤسسات التعليمية الدولية فى العالم! أشطر منصة تعليم رقمي قائمة على المناهج الدراسية لطلاب المدارس وبتوفر تجربة تعليمية مخصصة لكل طالب وبتوفرلهم طريقة التعليم المناسبة ليهم',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 242, 195, 42),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.right,
        ),
        const SizedBox(width: 8),
        Image.asset(iconPath, cacheHeight: 24, cacheWidth: 48),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _icon('icons/Frame_14.png'),
        const SizedBox(width: 12),
        _icon('icons/Frame_13.png'),
        const SizedBox(width: 12),
        _icon('icons/Frame_12.png'),
        const SizedBox(width: 12),
        _icon('icons/Frame_11.png'),
      ],
    );
  }

  Widget _buildStoreButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _storeButton('icons/Frame_16.png', 'Google play'),
        const SizedBox(width: 12),
        _storeButton('icons/Frame_15.png', 'App Store'),
      ],
    );
  }

  Widget _buildCopyrightText() {
    return const Text(
      'Copyright © 2023 Ashtar App | Terms of Use | Privacy Policy',
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color.fromARGB(255, 6, 69, 152),
      ),
      textAlign: TextAlign.center,
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

  Widget _icon(String path) {
    return Image.asset(path,  cacheHeight: 24, cacheWidth: 48);
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
          Image.asset(iconPath, cacheHeight: 40, cacheWidth: 80),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Get it on", style: TextStyle(fontWeight: FontWeight.w600)),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
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