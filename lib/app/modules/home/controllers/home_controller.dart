import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/app/models/copy.dart';
import 'package:my_app/app/models/lesson.dart';
import 'package:my_app/app/modules/home/views/textfield.dart';
import 'package:my_app/app/modules/home/views/walletMobile.dart' show walletMobile;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:my_app/Applinks.dart';
import 'package:my_app/app/models/attachment%20copy.dart';
import 'package:my_app/app/models/attachment.dart';
import 'package:my_app/app/models/cart.dart';
import 'package:my_app/app/models/userquestions.dart';
import 'package:my_app/app/models/wallet%20copy%202.dart';
import 'package:my_app/app/models/wallet%20copy%203.dart';
import 'package:my_app/app/models/wallet%20copy%205.dart';
import 'package:my_app/app/models/wallet%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/videofullscreen.dart';
import 'package:my_app/app/modules/home/views/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import '../../../models/material.dart';
import '../../../models/wallet copy 4.dart';
import '../../../models/wallet.dart';
import '../views/homeafterlogin.dart';

class HomeController extends GetxController {
  
RxDouble progressPercent = 0.0.obs;
  RxSet<String> completedActivities = <String>{}.obs;
  
  // Video completion tracking
  void markVideoAsCompleted(String videoId) {
    if (!completedActivities.contains('video_$videoId')) {
      completedActivities.add('video_$videoId');
      _updateProgress();
      _saveProgress();
    }
  }
  
  void _updateProgress() {
    // Each activity contributes ~33.3% to total progress
    double newProgress = (completedActivities.length / 3.0) * 100.0;
    progressPercent.value = newProgress.clamp(0.0, 100.0);
  }
  
  double get currentProgress => progressPercent.value / 100.0;
  
  void _saveProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('progressPercent', progressPercent.value);
      await prefs.setStringList('completedActivities', completedActivities.toList());
    } catch (e) {
      print('Error saving progress: $e');
    }
  }
  
  void _loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedProgress = prefs.getDouble('progressPercent') ?? 0.0;
      final savedActivities = prefs.getStringList('completedActivities') ?? [];
      
      progressPercent.value = savedProgress;
      completedActivities.value = Set<String>.from(savedActivities);
    } catch (e) {
      print('Error loading progress: $e');
    }
  }
  



































































  
 void seekBy2(Duration offset) {
    final current =  controllervideo2 !.value.position;
    controllervideo2!.seekTo(current + offset);
  }
 void seekBy(Duration offset) {
    final current =  controllervideo !.value.position;
    controllervideo!.seekTo(current + offset);
  }
  
 getToken()async{
  try {
    var prefs=await SharedPreferences.getInstance();
    prefs.getString('token'); 
  } catch (e) {
    // print(e);
  }
}
final ScrollController scrollController = ScrollController();

  // @override
  // void dispose() {
  //   super.dispose();
  // }
  TextEditingController searchController = TextEditingController();
  void updateSearch(String value) {
    searchText.value = value;
  }
  var searchText = ''.obs;

  
 VideoPlayerController ?controllervideo;
 
String getBaseUrl() {
  if (kIsWeb) return 'http://localhost:3000';
  if (Platform.isAndroid) return '${Applinks.baseurl}';
  return '${Applinks.baseurl}';
}

Future<void> initializePlayer(String id) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

   
    final videoUrl = 
    '${Applinks.baseurl}/uploads/videos/1761922169677-lecture_720p.mp4';

  
    controllervideo = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
      // httpHeaders: {
      //   'Authorization': 'Bearer $token',
      //   'Accept': 'application/json',
      // },
    );

 
    await controllervideo!.initialize().catchError((error) {
      // print('Video init failed: $error');
    });

    controllervideo!.play();

    // print('Initialized video with token: $videoUrl');
  } catch (e) {
    // print('Error initializing video player: $e');
  }
}



 VideoPlayerController ?controllervideo2;
  initializePlayer2(String id)async {
  //  final token=await getToken();
   controllervideo2 = VideoPlayerController.network(
  '${Applinks.baseurl}/courses/playy/${id}',
  // httpHeaders:{  'Authorization': 'Bearer $token',}   ,
  )..initialize().then((_) {
      controllervideo2!.play();
    });
}
// @override
// void dispose() {

//   super.dispose();
// }
//   initializePlayer2(String id)async {
//   //  final token=await getToken();
//    controllervideo2 = VideoPlayerController.network(
//   '${Applinks.baseurl}/courses/playy/${id}',
//   // httpHeaders:{  'Authorization': 'Bearer $token',}   ,
//   )..initialize().then((_) {
//       controllervideo2?.play();
//     });
// }

Map<String, dynamic>? profileData;

  final String baseUrl = "${Applinks.baseurl}"; 

  Future<Map<String, dynamic>> getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/students/profile"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
  Map<String, dynamic>? profile;
  Future<Map<String, dynamic>> getPercent(String token,{String ?sectionId}) async {
    final response = await http.get(
      Uri.parse("$baseUrl/pdf/section/$sectionId/full-progress"),
      headers: {
        "Authorization": "Bearer $token", 
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }

  Future<Map<String, dynamic>> getLesson(String token,{String ?LessonId}) async {
    final response = await http.get(
      Uri.parse("$baseUrl/pdf/lesson/${LessonId}/full"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200||response.statusCode==201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
 
  Map<String, dynamic>? finalPercent;


  Future<Map<String, dynamic>> getmycourses(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/students/mycourses/user"),
      headers: {
        "Authorization": "Bearer $token", 
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
 void fetchProfile() async {
    try {
        final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
      final data = await getProfile(token!);
      // setState(() {
        profileData = data;
        // isLoading = false;
      // });
  //  print('profile${profileData}');
    } catch (e) {
      // setState(() {
        // isLoading = false;
      // });
      // print("Error: $e");
    }
  }
  var sectionProgress = <String, double>{}.obs;

    Future<void> fetchSectionProgress(String sectionId) async {
    try {
      print('Fetching progress for section: $sectionId');
      
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      
      final response = await http.get(
        Uri.parse('${Applinks.baseurl}/courses/section/$sectionId/progress'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Section progress response: $data');
        
        final progress = double.tryParse(data['progress']?.toString() ?? '0') ?? 0.0;
        sectionProgress[sectionId] = progress;
        
        print('Updated section $sectionId progress to: $progress%');
        update();
      } else {
        print('Failed to fetch section progress: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching section progress: $e');
    }
  }
double lessonPercent=0;
double percents=0;
double percentsvideo=0;
double percentsanswer=0;
double percentage=0;
 void fetchPercent({String ?sectionId}) async {
    try {
        final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
      final data = await getPercent(token!,sectionId:sectionId);
      // setState(() {
        finalPercent = data;
        print('percent${finalPercent}');
         percents = (finalPercent?['finalPercent'] ?? 0).toDouble();
        //  percentage = (finalPercent?['percentage'] ?? 0).toDouble();
        //  percentsvideo = (finalPercent?['viewedCount'] ?? 0).toDouble();
        //  percentsanswer = (finalPercent?['percentageAnswer'] ?? 0).toDouble();
        print('wwwm${percents}');
        // isLoading = false;
      // });
      update();
  //  print('profile${profileData}');
    } catch (e) {
      print(e);
      // setState(() {
        // isLoading = false;
      // });
      // print("Error: $e");
    }
  }
  
 void fetchPercentlesson({String ?lessonId}) async {
    try {
        final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
      final data = await getLesson(token!,LessonId:lessonId);
      // setState(() {
        finalPercent = data;
        print('percent${finalPercent}');
        //  percents = (finalPercent?['finalPercent'] ?? 0).toDouble();
         percentage = (finalPercent?['percentage'] ?? 0).toDouble();
         percentsvideo = (finalPercent?['viewPercent'] ?? 0).toDouble();
         percentsanswer = (finalPercent?['percentageAnswer'] ?? 0).toDouble();
        print('wwwm${percentage}');
        // isLoading = false;
      // });
      update();
  //  print('profile${profileData}');
    } catch (e) {
      print(e);
      // setState(() {
        // isLoading = false;
      // });
      // print("Error: $e");
    }
  }
  
 void fetchmycourses() async {
    try {
        final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
      final data = await getmycourses(token!);
      // setState(() {
        profile = data;
        // isLoading = false;
      // });
  //  print('profile${profile}');
    } catch (e) {
      // setState(() {
        // isLoading = false;
      // });
      // print("Error: $e");
    }
  }

  
  final ValueNotifier<double> scrollPosition = ValueNotifier<double>(0.0);
// ScrollController scrollController=ScrollController();
 @override
  void dispose() {
    
      controllervideo2?.dispose();
    scrollController.dispose();
    scrollPosition.dispose();
    controllervideo?.dispose();
    controllervideo2?.dispose();
    super.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

Student student=Student();
  Future<void> fetchstudent() async {
  try {
    final Uri uri = Uri.http('${Applinks.baseurl2}', '/student-course');

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      // Expecting a single course object, not a list
      final Map<String, dynamic> courseData = jsonResponse;
      student = Student.fromJson(courseData);

      // sumExamAss = jsonResponse['sumExamAss'].toString();

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    // print('Error fetching questions: $e');
  }
}

Userquestions question=Userquestions();
  Future<void> questtt({required String id}) async {
  try {
    final Uri uri = Uri.http('${Applinks.baseurl2}', '/userquestion/bystudent/$id');

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      // Expecting a single course object, not a list
      final Map<String, dynamic> courseData = jsonResponse;
      question = Userquestions.fromJson(courseData);

      // sumExamAss = jsonResponse['sumExamAss'].toString();

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    // print('Error fetching questions: $e');
  }
}
  final count = 0.obs;
 String ?sumExamAss;
  @override
  int totalSeconds = 2 * 60;
  void onInit() {
// fetchCodes();

    _loadProgress();
unusedattachments() ;
fetchmaterial();
fetchCart(); sectionidlessontype(sectionId: '1');
fetchSAllCourses();
usedattachments();

 final allSections = <dynamic>[];
  for (var course in course_info) {
    if (course.section != null && course.section is List) {
      allSections.addAll(course.section as List);
    }
  }

  preloadEnrollments(allSections);

    fetchSections();//fetchPercent();

    // fetchUserQuestion(id:1 , );
    super.onInit();fetchProfile();
    attachments();fetchmycourses();
       on(int lessonId,int currentIndex){ final imageUrl =
        '${Applinks.baseurl}/pdf/lesson/${lessonId}/image/$currentIndex'; 
   }
  
    // fetchcourseinfo();
// sumExamAss;
// fetchcourseinfo();
fetch();
    fetchQuestions();
    // initializePlayer();
     SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final current = scrollController.position.pixels;
      scrollPosition.value = maxScroll == 0 ? 0 : current / maxScroll;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controllervideo?.dispose();
    super.onClose();
  }


  Future<Map<String, dynamic>> answerQuestion({
     int? questionId,
     String ?studentAnswer,
    
  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/userquestion?id=$questionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'student_answer': studentAnswer,
        }),
      );
    
      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
      TextEditingController text1=TextEditingController();
    TextEditingController text2=TextEditingController();

  Future<Map<String, dynamic>> answerQuestionExam({
     int? questionId,
     String ?studentAnswerExam,

  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/userquestion/exams/e?id=$questionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'studentAnswerExam': studentAnswerExam ,

        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        print(response.body);
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  Future<Map<String, dynamic>> buyattachments({
     int? attachmentId,
    //  String ?studentAnswer,
    
  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/code/buy/buySheet'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'attachmentId': attachmentId,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
    //   TextEditingController text1=TextEditingController();
    // TextEditingController text2=TextEditingController();

  // Future<Map<String, dynamic>> answerQuestionExam({
  //    int? questionId,
  //    String ?studentAnswerExam,

  // }) async {
  //   try {
  //      final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //     final response = await http.patch(
  //       Uri.parse('${Applinks.baseurl}/userquestion/exams/e?id=$questionId'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: json.encode({
  //         'studentAnswerExam': studentAnswerExam ,

  //       }),
  //     );
  //     //   final data = jsonDecode(response.body);
  //     // final prefs = await SharedPreferences.getInstance();

  //     if (response.statusCode == 200||response.statusCode == 201) {
  //       update();
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401) {
  //       throw Exception('Unauthorized - Please login again');
  //     } else if (response.statusCode == 404) {
  //       throw Exception('Question not found');
  //     } else {
  //       throw Exception('Failed to submit answer: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Network error: $e');
  //   }
  // }
  
  // Future<Map<String, dynamic>> answerQuestion({
  //   required int questionId,
  //   required String studentAnswer,
  // }) async {
  //   try {
  //      final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //     final response = await http.patch(
  //       Uri.parse('${Applinks.baseurl}/userquestion?id=$questionId'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: json.encode({
  //         'student_answer': studentAnswer,
  //       }),
  //     );
  //     //   final data = jsonDecode(response.body);
  //     // final prefs = await SharedPreferences.getInstance();

  //     if (response.statusCode == 200||response.statusCode == 201) {
  //       update();
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401) {
  //       throw Exception('Unauthorized - Please login again');
  //     } else if (response.statusCode == 404) {
  //       throw Exception('Question not found');
  //     } else {
  //       throw Exception('Failed to submit answer: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Network error: $e');
  //   }
  // }
 Future getinfo ()async{

  try {
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response =await http.get(Uri.parse('${Applinks.baseurl}/attachments'
    )
    , headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
    );
    if(response.statusCode==201||response.statusCode==200){
      
    }
  } catch (e) {
    
  }
 }
Future watched ({required String sectionId})async{
  final url ='${Applinks.baseurl}/lesson/lesson/$sectionId/watched';
  final prefs =await SharedPreferences.getInstance();
  final token =prefs .getString('token');

  final response=await http.post(Uri.parse(url),
  headers: {'Content-Type':'application/json',
  'Authorization':'Bearer $token'}
   );
  if(response.statusCode==200&&response.statusCode==201){
print(response.body);
return response.body;
  }
}
Future purchaseCourse({required int courseId})async{
  final url='${Applinks.baseurl}/cart/complete-course-purchase';
final  prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse(url),body:{'courseId':courseId} ,
headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',});
if(response.statusCode==200&&response.statusCode==201){
  // print(response.statusCode);
  return response.body;
}
else{//print(response.statusCode);
}
}
Future addlessontocart({required String sectionId})async{
  final url='${Applinks.baseurl}/lesson/addLessonstocart/$sectionId';
final  prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse(url) ,
headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',});
if(response.statusCode==200&&response.statusCode==201){
  // print(response.statusCode);
  return response.body;
}
else{//print(response.statusCode);
}
}


  TextEditingController code=TextEditingController();
  Future<Map<String, dynamic>> purchasecourse({
    required int courseId,

  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/courses/pay-with-code/charge?courseId=$courseId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'code': code.text,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  TextEditingController chargeCode=TextEditingController();
  Future<Map<String, dynamic>> chargewallet() async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/courses/update/charge'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'code': chargeCode.text,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  TextEditingController codebywallet=TextEditingController();
  Future<Map<String, dynamic>> purchaseSection({
    required String sectionId,

  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/sections/pay-with-code/charge?sectionId=$sectionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'code': codebywallet.text,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  TextEditingController rechargeCode=TextEditingController();
  Future charges({required int amount })async{
    
  }















  Future charge({
    required int amount,required BuildContext context
    // required String rechargeCode,
  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/code/recharge'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'rechargeCode': rechargeCode.text,
        
        'amount':amount
        }),
      );
      //   final data = jsonDecode(response.body);
      //   final prefs = await SharedPreferences.getInstance();

        var data =json.decode(response.body);
      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return walletMobile();
        }));
        return json.decode(response.body);
     } 
      else if (response.statusCode == 401) {
          // print('error');
        var data=json.decode(response.body);
       ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('${data['message']}'),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
  ),
); 
      } 
      else if (response.statusCode == 409) {
          ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('${data['message']}'),
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
  ),
); 
      } 
      else if (response.statusCode == 404) {
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
      throw Exception('');
    } catch (e) {
    }
  // throw Exception('Network error: $e');
  }
  
  Future<void> addLessonToCart({required int id})async{
    try{
      final prefs =await SharedPreferences.getInstance();
      final token =prefs.getString('token');

      final uri='${Applinks.baseurl}/attachments/addlessontocart/${id}';
      final response=await http.post(Uri.parse(uri)
      
      ,headers: {'Content-Type':'application/json'
      ,'Authorization':'Bearer ${token}'
      }
     
      );
      if(response.statusCode==200||response.statusCode==201){
update();
print(response.body);
      }

          }
    catch(e){
print(e);
    }
  }
Future<void> addattachtocart({required  int id})async{
try{
  final prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse('${Applinks.baseurl}/attachments/addtocart/$id')
,headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',} 
);
if(response.statusCode==200||response.statusCode==201){
update();
// print(response); 
}else{//print(response.statusCode);
}

}catch(e){

  //print(e);
}
}
Future<void> addsectiontocart({required  int id})async{
try{
  final prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse('${Applinks.baseurl}/sections/addtocart/$id')
,headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',} 
);
if(response.statusCode==200||response.statusCode==201){
update();
// print(response); 
}else{//print(response.statusCode);
}

}catch(e){

//  print(e);
}
}

Future<void> addcoursetocart( {required  int id})async{
try{
  final prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse('${Applinks.baseurl}/courses/addtocart/$id')
,headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',} 
);
if(response.statusCode==200||response.statusCode==201){
update();
// print(response); 
}else{//print(response.statusCode);
}

}catch(e){

  // print(e);
}
}
 Future clearCart(
 
    
  ) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('${Applinks.baseurl}/code/buy/clearcart'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
       
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
          //  print('object${response.statusCode}');
      } else if (response.statusCode == 404) { //  print('object${response.statusCode}');
      } else {
     //  print('object${response.statusCode}');
      }
    } catch (e) {
  //   print(e);
    }
  }
 
Future  deletefromcart( String id) async{

  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});


var url ='${Applinks.baseurl}/cart/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
//  print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
//  getallcourse();
}
else{//print('hhhhhhhhh');
 response.body;
 //print(response.statusCode);
 update();
}
}catch(e){
//  print(e);
}
}
 
  TextEditingController titles=TextEditingController();
  Future<void> studentQues({
    required String name,required BuildContext context,
    // required String rechargeCode,
  }) async {
 try {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.post(
    Uri.parse('${Applinks.baseurl}/studentquestions?name=$name'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: json.encode({
      'text': titles.text,
    }),
  );

  // print('Status: ${response.statusCode}');
  // print('Body: ${response.body}');

  if (response.headers['content-type']?.contains('application/json') == true) {
    var data = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      update();
    } else if (response.statusCode == 401 || response.statusCode == 409) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${data['message'] ?? 'Error occurred'}'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
        ),
      );
    }
  } else {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.body),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
      ),
    );
  }
} catch (e) {
  // print('Error: $e');
}

  // throw Exception('Network error: $e');
  }

 

  //     if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //     } else {
  //       throw Exception('Failed to fetch question details');
  //     }
  //   } catch (e) {
  //     throw Exception('Network error: $e');
  //   }
  // }
// }
  void increment() => count.value++;




TextEditingController emailinput=TextEditingController();
TextEditingController passwordinput=TextEditingController();
final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 Future<bool> login(context) async {
    final response = await http.post(
      Uri.parse('${Applinks.baseurl}/auth/login/student'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": emailController.text, "password": passwordController.text}),
    );
  if(response.statusCode==401){ 
     ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("wrong password or email"),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
    
      },
    ),
  ),
);
    
    return false;
  }
    if (response.statusCode == 200||response.statusCode==201) {
      final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setString('token', data['token']);
     
      return true;
    }

   else{ 
    
    
    return false;
  }}


Future<void>uploadVideo(File videoFile)async{
  var request=http.MultipartRequest('POST',Uri.parse('${Applinks.baseurl}/videos/upload'));
  request.files.add(await http.MultipartFile.fromPath('file', videoFile.path,));
 var response=await request.send();
 if(response.statusCode==201||response.statusCode==200){
 
 }
 else{
 }
}


  final int ? limit = 4;
  final int ? limit2 = 3;
// List<Userquestions> userquestions=[];
List<Userquestions> userquestions2=[];

  int ?currentPage;
// Future fetchUserQuestion({int? id, 

// int? page,  }) async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     final queryParameters = <String, String>{};
//     if (id != null) queryParameters['lessonId'] = id.toString();
//     if (page != null) queryParameters['page'] = page.toString();
//     if (limit != null) queryParameters['limit'] = limit.toString();

//     final uri = Uri.parse('${Applinks.baseurl}/userquestion/questions')
//         .replace(queryParameters: queryParameters);

//     final response = await http.get(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {

//       final jsonResponse = json.decode(response.body);

//       final List<dynamic> data = jsonResponse['data'];
//       userquestions = data.map((item) => Userquestions.fromJson(item)).toList();

//        currentPage = jsonResponse['currentPage'] ?? 1;
//       final int totalPages = jsonResponse['totalPages'] ?? 1;
//       final int total = jsonResponse['total'] ?? 0;
//       final int perPage = jsonResponse['limit'] ?? data.length;

// print(response.body);
//       update();
//     } else {
//     }
//   } catch (e) {
//   }
// }

List<Lesson> lessonQuestions=[];
Future fetchUserQuestionsby({int? id, 

int? page,  })  async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (id != null) queryParameters['lessonId'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/userquestion/lesson')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'];
      lessonQuestions = data.map((item) => Lesson.fromJson(item)).toList();

       currentPage = jsonResponse['currentPage'] ?? 1;
      final int totalPages = jsonResponse['totalPages'] ?? 1;
      final int total = jsonResponse['total'] ?? 0;
      final int perPage = jsonResponse['limit'] ?? data.length;

print(response.body);
      update();
    } else {
    }
  } catch (e) {
  }
}




List <Cart> cart=[];
  int pricelength=0;
Future fetchCart() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

  

    final uri = Uri.parse('${Applinks.baseurl}/cart');

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);


      final List<dynamic> data = jsonResponse['data'];
   pricelength = jsonResponse['length'];
      cart = data.map((item) => Cart.fromJson(item)).toList();

      //  currentPage = jsonResponse['currentPage'] ?? 1;
      // final int totalPages = jsonResponse['totalPages'] ?? 1;
      // final int total = jsonResponse['total'] ?? 0;
      // final int perPage = jsonResponse['limit'] ?? data.length;

     

      update();
    } else {
    }
  } catch (e) {
  }
}

Future usedattachments() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

 
    final uri = Uri.parse('${Applinks.baseurl}/attachments/allusedattach');

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);


      final List<dynamic> data = jsonResponse;
      attach = data.map((item) => Attachment.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
  }
}

Future unusedattachments() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // بناء رابط الاستعلام
    // final queryParameters = <String, String>{};
    // if (id != null) queryParameters['lessonId'] = id.toString();
    // if (page != null) queryParameters['page'] = page.toString();
    // if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/attachments/allunusedattach');
        // .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);


      final List<dynamic> data = jsonResponse;
  //  pricelength = jsonResponse['length'];
      unusedattach = data.map((item) => Attachment.fromJson(item)).toList();

      //  currentPage = jsonResponse['currentPage'] ?? 1;
      // final int totalPages = jsonResponse['totalPages'] ?? 1;
      // final int total = jsonResponse['total'] ?? 0;
      // final int perPage = jsonResponse['limit'] ?? data.length;

     

      update();
    } else {
    }
  } catch (e) {
  }
}

Future fetchUserQuestionExam({int? id, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (id != null) queryParameters['examId'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/userquestion/questions/questionsexams')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'];
      userquestions2 = data.map((item) => Userquestions.fromJson(item)).toList();

       currentPage = jsonResponse['currentPage'] ?? 1;
      final int totalPages = jsonResponse['totalPages'] ?? 1;
      final int total = jsonResponse['total'] ?? 0;
      final int perPage = jsonResponse['limit'] ?? data.length;

      update();
    } else {
    }
  } catch (e) {
  }
}


List<Userquestions> ques =[];
Future fetchUserQuestionExam2({int? id, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (id != null) queryParameters['examId'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit2 != null) queryParameters['limit'] = limit2.toString();

    final uri = Uri.parse('${Applinks.baseurl}/userquestion/questions/questionsexams')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'];
      ques = data.map((item) => Userquestions.fromJson(item)).toList();

       currentPage = jsonResponse['currentPage'] ?? 1;
      final int totalPages = jsonResponse['totalPages'] ?? 1;
      final int total = jsonResponse['total'] ?? 0;
      final int perPage = jsonResponse['limit'] ?? data.length;


      update();
    } else {
    }
  } catch (e) {
  }
}

TextEditingController fullName=TextEditingController();
TextEditingController PhoneNum=TextEditingController();
TextEditingController mother_phone=TextEditingController();
TextEditingController father_phone=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController facebooklink=TextEditingController();
TextEditingController school=TextEditingController();
  var subjects = Rx<String?>(null);  Rx<String?> semester = Rx<String?>(null);
  var year = Rx<String?>(null);
  var schools = Rx<String?>(null);
  var center = Rx<String?>(null);
  var timeofsession = Rx<String?>(null);
  var selectedCourseId = Rx<String?>(null);
Future <void> addanswer(BuildContext  context) async{
  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({
      'fullname':school.text,
      "email":email.text
      ,"phoneNum":PhoneNum.text
      ,"mother_phone_num":mother_phone.text,
      "father_phone_num":father_phone.text,
      "facebookLink":facebooklink.text,
      // "stud_school":school.text,
      "coursetype":subjects.value
      ,"semester":semester.value,
      "grade":year.value
     ,"stud_school":schools.value
     ,"center":center.value,
    //  "":timeofsession.value
      });
var url ='${Applinks.baseurl}/students/schedualCenter/p';
final response=await http .patch(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==204||response.statusCode==200){
//  print(response.statusCode); 
 update();
 Navigator.push(context, MaterialPageRoute(builder: (context){
  return Homeafterlogin();
}));
 response.body;
//  getallcourse();
}
else{//print('hhhhhhhhh${response.statusCode}');


}
}catch(e){
  // print(e);
}
}
List<Exam> exams=[];
Future fetchExams({int? online, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (online != null) queryParameters['online'] = online.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/exams/online/offline')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['exam'];
      exams = data.map((item) => Exam.fromJson(item)).toList();

      update();
    } else {
      // print('why${response.statusCode}');
    }
  } catch (e) {
    // print('why${e}');
  }
}
    List<dynamic> startdate=[];
List<Exam> examsoffon=[];
Future fetchExams2({int? online,   }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (online != null) queryParameters['online'] = online.toString();
    // if (page != null) queryParameters['page'] = page.toString();
    // if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/exams/online/offline')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['exam'];
       startdate= jsonResponse['startdate'];
      examsoffon = data.map((item) => Exam.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
  }
}

List<Code> codes=[];
Future fetchCodes({int? online, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/code/withpag')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['codes'];
      codes = data.map((item) => Code.fromJson(item)).toList();




      update();
    } else {
    }
  } catch (e) {
  }
}


List<student_Course> studentcourse=[];
Future<void> fetchQuestions( ) async {
 try{ 
  final Uri uri = Uri.http(
    '${Applinks.baseurl2}', '/student-course',
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse['course'];
    
      studentcourse=courseData.map((item)=>student_Course.fromJson(item)).toList();
    sumExamAss=jsonResponse['sumExamAss'].toString();
    update();
  } else {

  }}catch(e){//print('que${e}');
  }
}

List<Section>  sections=[];
Future<void> fetchSections( ) async {
 try{ 
  final Uri uri = Uri.http(
    '${Applinks.baseurl2}', '/sections/mysections',
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    // final json =await jsonDecode(response.body);
    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse;//['course'];
    
    //  final List <dynamic>data=json.decode(response.body);
      sections=courseData.map((item)=>Section.fromJson(item)).toList();
    // print('questions loaded: ${page.toString()}');
    update();
// print(response.statusCode);
// print(response.statusCode);

  } else {

  }}catch(e){//print('que${e}');
  }
}
List<Course>  allcourse=[];
Future<void> fetchSAllCourses( ) async {
 try{ 
  final Uri uri = Uri.http(
    '${Applinks.baseurl2}', '/courses/getallcourses',
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse['course'];
    
    //  final List <dynamic>data=json.decode(response.body);
      allcourse=courseData.map((item)=>Course.fromJson(item)).toList();
    update();

  } else {

  }}catch(e){//print('que${e}');
  }
}

// }
List<Course> bycourses=[];
// List<Course> course=[];
Future<void> fetch( ) async {
 try{ 
  final Uri uri = Uri.http(
    '${Applinks.baseurl2}', '/student-course/course',
    // {
    //   if (page != null)  'page': page.toString(),
    //   if (limit != null) 'limit': limit.toString(),
    // },
  
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse['course'];
    
    //  final List <dynamic>data=json.decode(response.body);
      courses=courseData.map((item)=>Course.fromJson(item)).toList();
    // print('by loaded: ${response.body!}');
    // sumExamAss=jsonResponse['sumExamAss'].toString();
    // print(sumExamAss);
// print(' name   ${jsonResponse['course']['name'].toString()}');

    // print('questions loaded: ${questions!.id}');
    // print('questions loaded: ${page.toString()}');
    update();
  } else {

    // print('questions loaded: ${page.toString()}');
    // print('Failed to fetch course: ${response.statusCode}');
  }}catch(e){//print('que${e}');
  }
}
// Future<void> fetchbyinfoid( String id) async {
//  try{ 
//   final Uri uri = Uri.http(
//     '192.168.42.142:3000', '/student-course/courseInfoid/$id',
    
//     // {
//     //   if (page != null)  'page': page.toString(),
//     //   if (limit != null) 'limit': limit.toString(),
//     // },
  
//   );
    
//        final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');
//   final response = await http.get(
//     uri,
//     headers: {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     },
//   );

//   if (response.statusCode == 200) {

//     // final json =await jsonDecode(response.body);
//     // questions = Questions.fromJson(json);
//     final jsonResponse=json.decode(response.body);
//     final List<dynamic>courseData=jsonResponse;
    
//     //  final List <dynamic>data=json.decode(response.body);
//       bycourses=courseData.map((item)=>Course.fromJson(item)).toList();
//     print('by loaded: ${response.body!}');
//     // sumExamAss=jsonResponse['sumExamAss'].toString();
//     // print(sumExamAss);
// // print(' name   ${jsonResponse['course']['name'].toString()}');

//     // print('questions loaded: ${questions!.id}');
//     // print('questions loaded: ${page.toString()}');
//     update();
//   } else {

//     // print('questions loaded: ${page.toString()}');
//     print('Failed to fetch questions: ${response.statusCode}');
//   }}catch(e){print('que${e}');}
// }

List<Course> courses=[];
List<Course> courses2=[];
Future<void> fetchcourseinfo(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['course_id'] = id;
    }

    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/student-course/courseInfo',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      courses2 = courseData.map((item) => Course.fromJson(item)).toList();


      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    // print('que$e');
  }
}
List<Attachment> attachment=[];
List<Attachment> attach=[];
List<Attachment> unusedattach=[];
Future<void> attachments({String? status}) async {
  try {
    final queryParams = <String, String>{};
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/attachments',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['courses'];

      attachment = courseData.map((item) => Attachment.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
    print('que$e');
  }
}
Future<bool> checkEnrollment(int courseId) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');  final response = await http.get(
    Uri.parse('${Applinks.baseurl}/student-course/isEnrolled/$courseId'), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['enrolled'] as bool;
  } else {
    throw Exception('Failed to check enrollment');
  }
}
 var enrollmentResults = <String, bool>{}.obs;

  Future<void> preloadEnrollments(List<dynamic> sections) async {
    final futures = sections.map((section) async {
      final id = section['id'].toString();
      final result = await usedEnrollmentsection(id);
      enrollmentResults[id] = result;
    });

    await Future.wait(futures); 
  }

Future<bool> usedEnrollmentsection(String sectionId) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');  final response = await http.get(
    Uri.parse('${Applinks.baseurl}/sections/isEnrolled/$sectionId'), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // print(response.body);
    // update();
    return data['enrolled'] as bool;
    
  } else {
    throw Exception('Failed to check enrollment');
  }
}

List<courseInfo> course_info=[];
Future<void> fetchcourseinfoid(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['courseId'] = id;
    }

    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/student-course/courseInfoid',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      course_info = courseData.map((item) => courseInfo.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
  }
}
List<Section> section=[];
Future<void> fetchsectionid(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['section_id'] = id;
    }

    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/courses/sectionbyid',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      section = courseData.map((item) => Section.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
  }
}
List<Materials>  material=[];
Future<void> fetchmaterial() async {
  try {
   
    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/materials',
     
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200||response.statusCode==201) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse;

      material = courseData.map((item) => Materials.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
  }
}
 double percent=0;
  var  length;
List<Course> course=[];
Future<void> fetchsectionidlesson(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['section_id'] = id;
    }

    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/courses/sectionbyid',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];
      percent = (jsonResponse['percent'] ?? 0).toDouble();
print('legn$length');
update();
      course = courseData.map((item) => Course.fromJson(item)).toList();


      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    // print('que$e');
  }
}
List<courseInfo> courses_lesson=[];
Future<void> sectionidlessontype({String? title,String ?sectionId}) async {
  try {
    final queryParams = <String, String>{};
      queryParams['title'] = title??"";
      queryParams['sectionId'] = sectionId??"";

    final Uri uri = Uri.http(
      '${Applinks.baseurl2}',
      '/lesson/typelesson',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
  

      final dynamic courseData = jsonResponse['course'];

      if (courseData is List) {
        courses_lesson = courseData.map((item) => courseInfo.fromJson(item)).toList();
        print('Successfully loaded ${courses_lesson} courses');
      } else {
      
      }

      update();
    } else {
    }
  } catch (e) {
  }
} 
    


 void togglePlayPause() {
    if (controllervideo?.value.isPlaying ?? false) {
      controllervideo?.pause();
    } else {
      controllervideo?.play();
    }
  }
 void togglePlayPause2() {
    if (controllervideo2?.value.isPlaying ?? false) {
      controllervideo2?.pause();
    } else {
      controllervideo2?.play();
    }
  }
Future<void> signOut() async {
  await _auth.signOut();
}
 String ?photoUrl='';  
   final FirebaseAuth auth = FirebaseAuth.instance;
































































final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user;

    final firebaseIdToken = await user?.getIdToken();
    debugPrint('✅ Firebase ID Token: $firebaseIdToken');

    final response = await http.post(
      Uri.parse('${Applinks.baseurl}/auth/google-login/students'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idToken': firebaseIdToken}),
    );

    if (response.statusCode == 200||response.statusCode == 201) {
     final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setString('token', data['token']);
      debugPrint('✅ Token saved: ${data['token']}');
    } else {
      debugPrint('❌ Server error: ${response.statusCode}');
    }

    return userCredential;
  } catch (e) {
    debugPrint('❌ Sign-in error: $e');
    return null;
  }
}
 

  // ExamResultController(this.service);

  var isLoading = false.obs;
  var result = Rxn<ExamResult>();
// @override
// void initState() {
//   super.initState();

  
// }
 final ExamService service=ExamService();
  Future<void> fetchResult(int lessonId, ) async {
    try {
      isLoading.value = true;
      result.value = await service.getExamResult(lessonId, );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }



Future<UserCredential> signUpWithEmail(String email, String password) async {
  
  return await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

Future<UserCredential> signInWithEmail(String email, String password) async {
  
  return await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

}

}
