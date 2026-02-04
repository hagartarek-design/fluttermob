// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:media_kit/media_kit.dart';

// import 'app/routes/app_pages.dart';
// import 'firebase_options.dart';
// class AppLifecycleObserver with WidgetsBindingObserver {
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     print('STATE: $state');
//   }

//   @override
//   void didHaveMemoryPressure() {
//     print('⚠️ MEMORY PRESSURE');
//   }
// }

// void main() async {
  
//   WidgetsFlutterBinding.ensureInitialized();
  
//   MediaKit.ensureInitialized();
  
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   AppLifecycleObserver();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Application",
//       initialRoute: AppPages.INITIAL,
//       locale: const Locale('ar'),
//       getPages: AppPages.routes,
//     ),
//   );
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';// Add this import
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';

import 'package:my_app/app/routes/app_pages.dart';

import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
// import 'package:flutterwallet/app/routes/app_pages.dart';
// import 'package:flutterwallet/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   print(' بدء تشغيل التطبيق');
  
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // await initializeDateFormatting('ar', null);

//   // وضع Controller
//   final controller = Get.put(HomeController());
//   print(' HomeController جاهز');

//   String initialRoute;
//   try {
//     initialRoute = await controller.refreshAccessToken();
//     print(' المسار الأولي: $initialRoute');
//   } catch (e) {
//     print(' خطأ في المسار الأولي: $e');
//     initialRoute = '/main';
//   }

//   runApp(
//     GetMaterialApp(
//          locale: const Locale('ar'),debugShowCheckedModeBanner: false,
//       initialRoute: initialRoute,
//       getPages: AppPages.routes,
//       routingCallback: (routing) {
//         if (routing?.current != null) {
//           final time = DateTime.now().toIso8601String().substring(11, 19);
//           print('[$time]  ${routing!.current}');
//         }
//       },
//       transitionDuration: Duration(milliseconds: 400),
//       defaultTransition: Transition.cupertino,
//     ),
//   );
  
//   print(' التطبيق يعمل');
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';// Add this import
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';

import 'package:my_app/app/routes/app_pages.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';import 'package:media_kit/media_kit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  MediaKit.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final controller = Get.put(HomeController());
  String initialRoute = await controller.getInitialRoute();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,locale: Locale('ar'),
      getPages: AppPages.routes,
      routingCallback: (routing) {
        if (routing?.current != null) {
          final time = DateTime.now().toIso8601String().substring(11, 19);
          print('[$time]  ${routing!.current}');
        }
      },

      transitionDuration: Duration(milliseconds: 400),
      defaultTransition: Transition.cupertino,
    ),
  );
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   final HomeController controller = Get.put(HomeController());
//   String initialRoute;

//   try {
//     initialRoute = await controller.getInitialRoute();
//   } catch (_) {
//     initialRoute = '/main';
//   }
//   // HomeController controller=HomeController();
// final tokens = await controller. getTokens();
// if (tokens != null) {
//   // final authController = Get.put(AuthController());
//   controller.startTokenTimer(tokens['token']);
// }
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Application",
//       initialRoute: initialRoute,
//       locale: const Locale('ar'),
//       getPages: AppPages.routes,
//     ),
//   );
// }


// class MyTranslations extends Translations {
  // @override
  // Map<String, Map<String, String>> get keys => {
  //       'en': {
  //         "arabic": "Arabic",
  //         "english": "English",
  //         "login": "Login",
  //         "createaccount": "Create Account",
  //         "contactus": "Contact Us",
  //         "about": "About",
  //         "home": "Home",
  //         "courses": "My Courses",
  //         "teachers": "Our Teachers",
  //         "study": "Study",
  //       },
  //       'ar': {
  //         "arabic": "عربي",
  //         "english": "إنجليزي",
  //         "login": "تسجيل دخول",
  //         "createaccount": "إنشاء حساب",
  //         "contactus": "تواصل معنا",
  //         "about": "عن أشطر",
  //         "home": "الرئيسية",
  //         "courses": "كورساتى",
  //         "teachers": "مدرسينا",
  //         "study": "ذاكر",
  //         // Add all other text keys used in your app
  //       },
  //     };

// }
// class MyTranslations extends Translations {
  // @override
  // Map<String, Map<String, String>> get keys => {
  //       'en': {
  //         "arabic": "Arabic",
  //         "english": "English",
  //         "login": "Login",
  //         "createaccount": "Create Account",
  //         "contactus": "Contact Us",
  //         "about": "About",
  //         "home": "Home",
  //         "courses": "My Courses",
  //         "teachers": "Our Teachers",
  //         "study": "Study",
  //       },
  //       'ar': {
  //         "arabic": "عربي",
  //         "english": "إنجليزي",
  //         "login": "تسجيل دخول",
  //         "createaccount": "إنشاء حساب",
  //         "contactus": "تواصل معنا",
  //         "about": "عن أشطر",
  //         "home": "الرئيسية",
  //         "courses": "كورساتى",
  //         "teachers": "مدرسينا",
  //         "study": "ذاكر",
  //         // Add all other text keys used in your app
  //       },
  //     };

// }