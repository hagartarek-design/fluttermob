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
import 'package:my_app/app/modules/home/views/videobyid%20copy%202.dart';
import 'videobyid.dart';
import 'wallet_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'wallet_cart.dart';

class mySections extends StatefulWidget {
  const mySections({super.key});

  @override
  State<mySections> createState() => _mySectionsState();
}

class _mySectionsState extends State<mySections> {
  var selectedSection = Rx<String?>(null);
  var selected = false.obs;
  var selected1 = false.obs;
  var selected2 = false.obs;
  var selected3 = false.obs;
  var selected4 = false.obs;
  int _currentPage = 0;
  final _maxLengthNotifier = ValueNotifier<int?>(null);
  var selectedMethod = ''.obs;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
    final isTablet = screenWidth >= 900 && screenWidth < 1200;

    return Scaffold(
      appBar: _buildAppBar(isMobile, context),
      body: GetBuilder<HomeController>(
        
        builder: (controller) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
 
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildPromoBanner(isMobile),
                    const SizedBox(height: 20),
                    _buildMainContent(controller, isMobile, isTablet, constraints),
                    _buildFooter(context),
                    const SizedBox(height: 10),
                    _buildCopyright(),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

   _buildAppBar(bool isMobile, BuildContext context) {
    if (isMobile) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 6, 70, 152),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                 showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );
                
              },
              child: const Icon(Icons.menu, color: Colors.white),
            ),
            Image.asset('assets/Group87935.png', width: 55),
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
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(radius: 24),
                    ),
                    Image.asset('icons/Vector_3.png', width: 40, height: 41),
                    Image.asset('icons/Vector_2.png', width: 39.02, height: 40),
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
                    Image.asset('assets/Group87935.png', width: 55),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildPromoBanner(bool isMobile) {
    return Container(
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
    );
  }

  Widget _buildMainContent(HomeController controller, bool isMobile, bool isTablet, BoxConstraints constraints) {
    return Container(
      width: isMobile ? 343 : 1820,
      child: Wrap(
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        children: [
          if (!isMobile) ...[
            const RightSidebar(),
            const SizedBox(width: 139),
          ],
          _buildSectionsContainer(controller, isMobile, isTablet),
          if (!isMobile) const SizedBox(width: 100),
        ],
      ),
    );
  }

  Widget _buildSectionsContainer(HomeController controller, bool isMobile, bool isTablet) {
    return Column(spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: !isMobile ? 852 : 343,
          height: 1252,
          padding: const EdgeInsets.fromLTRB(40, 48, 40, 48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(isMobile),
                  Padding(
      padding: const EdgeInsets.only(top:  8.0,bottom: 8.0),
      child: TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: '',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {setState(() {
          controller.updateSearch(value);
        });} 
      ),
    ),
 
              const SizedBox(height: 20),
              _buildSectionsGrid(controller, isMobile, isTablet),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      width: isMobile ? 343 : 246,
      height: 110,
      alignment: Alignment.centerRight,
      child: Text(
        'محضراتي',
        style: TextStyle(
          color: const Color.fromARGB(255, 6, 69, 152),
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionsGrid(HomeController controller, bool isMobile, bool isTablet) {
             final filteredList = controller.sections.where((item) {
  final searchText = controller.searchText.value.toLowerCase();
  final cycleText = item.name.toString().toLowerCase();
  return cycleText.contains(searchText);
}).toList();    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [


            ListView.builder(
        shrinkWrap: true, 
  physics: const NeverScrollableScrollPhysics(), 
  itemCount: filteredList.length,
              itemBuilder: (context, index) { final item = filteredList[index];
        
        
        
          return  Column(children: [
            
             _buildSectionCard(controller, index, isMobile)
           ,  SizedBox(height: 10,)
             ],);
   } )
      ],
    );
  }

  Widget _buildSectionCard(HomeController controller, int index, bool isMobile) {
    return Stack(
      children: [
        

        ClipRRect(

          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: isMobile ? 390 : 246,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              'assets/lecturecard1.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        
        Container(
          width: isMobile ? 343 : 246,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 6, 69, 152),
                const Color.fromARGB(171, 118, 162, 212),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            width: isMobile ? 330 : 236,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.sections[index].name}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        textAlign: TextAlign.start,
                        'فيديوهات -5 \n PDF 2- \n -8 امتحانات و واجبات',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

        
        Positioned(
          top: 220,
          left: 24,
          child: Container(
            width: 198,
            height: 44,
            child: TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 6, 69, 152),
                  width: 1.0,
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {




 


  Navigator.push(context,MaterialPageRoute(builder: (context){
    return Videobyids(index: 1,lesson:1,courseId:"1",);
    }));
  
  
  
  

              },
              child: Text(
                'شوف المحاضرة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 6, 69, 152),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8,)
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

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
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 24,
                  spacing: 24,
                  children: [
                    _buildContactSection(isMobile),
                    _buildAboutSection(isMobile),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تواصل معنا',
            style: TextStyle(
              color: const Color.fromARGB(255, 242, 195, 42),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('icons/location.png', '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
          const SizedBox(height: 12),
          _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
          const SizedBox(height: 12),
          _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
          const SizedBox(height: 12),
          Row(
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
          ),
          const SizedBox(height: 16),
          Text(
            'حمل التطبيق الان',
            style: TextStyle(
              color: const Color.fromARGB(255, 242, 195, 42),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _storeButton('icons/Frame_16.png', 'Google play'),
              const SizedBox(width: 12),
              _storeButton('icons/Frame_15.png', 'App Store'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAboutSection(bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 24,
              children: [
                _navItem('عن أشطر'),
                _navItem('مصادري'),
                _navItem('كورساتى'),
                _navItem('مدرسينا'),
                _navItem('ذاكر'),
                _navItem('الرئيسية',
                    color: const Color.fromARGB(255, 242, 195, 42), fontSize: 24),
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
              color: const Color.fromARGB(255, 242, 195, 42),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          Text(
            'أشطر معتمدة من كوجنيا واحدة من أكبر المؤسسات التعليمية الدولية فى العالم! أشطر منصة تعليم رقمي قائمة على المناهج الدراسية لطلاب المدارس وبتوفر تجربة تعليمية مخصصة لكل طالب وبتوفرلهم طريقة التعليم المناسبة ليهم',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCopyright() {
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

  Widget _buildInfoRow(String iconPath, String text) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
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
              const Text("Get it on", style: TextStyle(fontWeight: FontWeight.w600)),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title,
      {Color color = const Color.fromARGB(255, 181, 181, 181), double fontSize = 20}) {
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
