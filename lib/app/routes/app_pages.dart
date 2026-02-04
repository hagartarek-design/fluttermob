import 'package:get/get.dart';
import 'package:my_app/app/modules/home/bindings/home_binding.dart';
import 'package:my_app/app/modules/home/controllers/assignment2.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/MySections.dart';
import 'package:my_app/app/modules/home/views/addedto.dart';
import 'package:my_app/app/modules/home/views/emptycart.dart';
import 'package:my_app/app/modules/home/views/exam_solve.dart';
import 'package:my_app/app/modules/home/views/home.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/Subjecttype.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/myExam.dart';
import 'package:my_app/app/modules/home/views/mybooks.dart';
import 'package:my_app/app/modules/home/views/myquestionask.dart';
import 'package:my_app/app/modules/home/views/profile.dart';
import 'package:my_app/app/modules/home/views/schedual_center2.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/Wallet.dart';
import 'package:my_app/app/modules/home/views/subjects.dart';
import 'package:my_app/app/modules/home/views/walletMobile.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => HomeView(), 
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(name: Routes.MAINPAGE,
    page: () => Mainpage(),
 
    )
,   GetPage(
  name: Routes.HOMEAFTERLOGIN,
  page: () => Homeafterlogin(),
  binding: HomeBinding(),
),

    GetPage(
      name: Routes.SUBJECTTYPE,
      page: () => Subjecttype(),
    )
    ,
    GetPage(
      name: Routes.CENTER,
      page: () => SchedualCenter2(),
    )
    ,
    GetPage(
      name: Routes.EXAMSOLVE,
      binding: BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    }),
      page: () => ExamSolve(totalSeconds: Get.arguments?['totalSeconds']??0,),
    )
    ,
    GetPage(name: Routes.MYEXAM,page:()=>MyExam()),
    GetPage(name: Routes.ADDEDTO,page:()=>Addedto()),
    GetPage(name: Routes.SETTINGS,page:()=>settings()),
    GetPage(name: Routes.MYBOOKS,page:()=>myBooks()),
    GetPage(
      name: Routes.SUBJECT,
      page: () => Subjects(
        courseId: Get.arguments['courseId'] ?? '',
        courseInfos: Get.arguments['courseInfos'] ?? [],
      ),
    ),
    GetPage(
      name: Routes.EMPTYCART,
      page: () => Emptycart(
  
      ),
    ),
    GetPage(
      name: Routes.HOMEVIEW,
      page: () => HomeView(
  
      ),
    ),
    GetPage(name:Routes.PROFILE,page: () => Profile()),
    GetPage(
      name: Routes.SUBJECTS,
      page: () => Subjects(
        courseId: Get.arguments['courseId'] ?? '',
        courseInfos: Get.arguments['courseInfos'] ?? [],
      ),
    ),
    GetPage(name:Routes.MYSECTIONS,page: () => MySections() ),
    
    GetPage(name: Routes.MYQUESTIONSASK, page: ()=>MyQuestionAsk() )
,    GetPage(
      name: Routes.LECTURENOTPAID,
       binding: BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    }),
      page: () => Lecturenotpaid(
        courseId: Get.arguments['courseId'].toString() ?? '',
        index: Get.arguments['index'] ?? 0,
        lesson: Get.arguments['lesson'] ?? [], section: Get.arguments['section']
        , isUsed: Get.arguments['isUsed'],
      ),
    ),
    GetPage(name: Routes.ASSIGNMENT2, page: ()=>assignment2(lessonIds: Get.arguments['lessonIds'],), binding: BindingsBuilder((){
      Get.lazyPut<HomeController>(()=>HomeController());
    })
    )//,
   , GetPage(name:Routes.WALLET,page: ()=>walletMobile()
    ,binding: BindingsBuilder(()=>Get.lazyPut<HomeController>(()=>HomeController()))
    
    ),GetPage(name: Routes.SUBJECTBOOKS,page: () => Subjectbooks(),)
  ];
}