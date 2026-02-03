import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
class AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('STATE: $state');
  }

  @override
  void didHaveMemoryPressure() {
    print('⚠️ MEMORY PRESSURE');
  }
}

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  MediaKit.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppLifecycleObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      locale: const Locale('ar'),
      getPages: AppPages.routes,
    ),
  );
}