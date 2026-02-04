import 'dart:async';
import 'dart:convert';
// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:my_app/Applinks.dart';
import 'package:my_app/app/models/wallet%20copy%202.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/assignment2.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/controllers/trueAnswerExam.dart' hide MenuDialog;
import 'package:my_app/app/modules/home/views/addtocart.dart';
import 'package:my_app/app/modules/home/views/examResult_answer_sheet.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart' hide MenuDialog;
import 'package:my_app/app/modules/home/views/mennimenue.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjects.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/modules/home/views/videobyid.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
// import '';
import '../controllers/pdf.service copy 3.dart';
import '../controllers/pdf.service.dart';
import 'videofullscreen.dart';
class Lecturenotpaid extends StatefulWidget {
  final String courseId;
  final index;
  final lesson;final section;
  final isUsed;
   // make it final for immutability
  const Lecturenotpaid({super.key, required this.courseId,required this.index,required this.lesson,required this.section,
  required this.isUsed
  });

  @override
  State<Lecturenotpaid> createState() => _LecturenotpaidState();
}

class _LecturenotpaidState extends State<Lecturenotpaid> {



  late Player _player;
  late VideoController _videoController;
  bool _isPlayerInitialized = false;
  bool _isPlaying = false;
  bool _isLoading = true;
  String _errorMessage = '';
    HomeController controller=Get.find<HomeController>();
   Future<void> _initializeDashboardWithRefresh() async {
  print('📱 DashboardScreen - Initializing with auto-refresh');
  
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  
  if (token == null || token.isEmpty) {
    print('⚠️ No token in Dashboard');
    return;
  }
  
  try {
    final expiryDate = JwtDecoder.getExpirationDate(token);
    final remaining = expiryDate.difference(DateTime.now());
    
    print('📱 Dashboard token expires in: ${remaining.inMinutes} minutes');
    
    // If token is already expired, refresh immediately
    if (remaining.isNegative) {
      print('🔄 Token already expired, refreshing now...');
      await controller.refreshAccessToken();
    } 
    // If token expires in less than 10 minutes, refresh now
    else if (remaining.inMinutes < 10) {
      print('🔄 Token expiring soon, refreshing now...');
      await controller.refreshAccessToken();
    }
    
    // Start Dashboard timer
    if (controller.isDashboardActive.value) {
      controller.startDashboardTimer();
    }
    
  } catch (e) {
    print('❌ Error in Dashboard token initialization: $e');
  }
}

  @override
  void initState() {
    super.initState();
    _initializePlayer();
      
  controller.currentScreen.value = '/DashboardScreen';
  controller.isDashboardOpen.value = true;
  controller.isDashboardActive.value = true;
  
  // Start Dashboard-specific token monitoring
  _startDashboardTokenMonitoring();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    _initializeDashboardWithRefresh();
  });
        controller.sectionidlessontype(sectionId:widget.section);
        var g=     controller.courses_lesson.map((e)=>(e.section?[widget.index]['lesson']).length).join();
        print('llllllllllll$g') ;
  }

  Future<void> _initializePlayer() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      // Initialize player
      _player = Player();
      _videoController = VideoController(_player);

      // Set up event listeners
      _player.streams.error.listen((error) {
        print('Player error: $error');
        setState(() {
          _errorMessage = 'Video error: $error';
          _isPlayerInitialized = false;
          _isLoading = false;
        });
      });

      _player.streams.completed.listen((completed) {
        if (completed) {
          setState(() {
            _isPlaying = false;
          });
        }
      });

      _player.streams.playing.listen((playing) {
        setState(() {
          _isPlaying = playing;
        });
      });

      _player.streams.buffering.listen((buffering) {
        print('Buffering: $buffering');
      });
      await _player.open(
        Media('${Applinks.baseurl}/courses/play/${widget.courseId}'),
        play: false, // Start paused
      );
         
      setState(() {
        _isPlayerInitialized = true;
        _isLoading = false;
      });

    } catch (e) {
      print('Error initializing player: $e');
      setState(() {
        _errorMessage = 'Failed to load video: $e';
        _isPlayerInitialized = false;
        _isLoading = false;
      });
    }
  }

  void _playPause() {
    if (!_isPlayerInitialized) return;
    
    if (_isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  void _seekForward() {
    if (!_isPlayerInitialized) return;
    final current = _player.state.position;
    final duration = _player.state.duration;
    final newPosition = current + const Duration(seconds: 10);
    if (newPosition < duration) {
      _player.seek(newPosition);
    }
  }

  void _seekBackward() {
    if (!_isPlayerInitialized) return;
    final current = _player.state.position;
    final newPosition = current - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      _player.seek(newPosition);
    }
  }

  void _toggleFullscreen() {
    // Simple fullscreen implementation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Center(
            child: _isPlayerInitialized
                ? Video(controller: _videoController)
                : Text(
                    'Video not available',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
//  late Player _player;
//   late VideoController _videoController;
//   bool _isPlayerInitialized = false;
//   bool _isPlaying = false;
//   bool _isLoading = true;
//   String _errorMessage = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _initializePlayer();
  // }

  // Future<void> _initializePlayer() async {
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //       _errorMessage = '';
  //     });

  //     // Initialize player
  //     _player = Player();
  //     _videoController = VideoController(_player);

  //     // Set up event listeners
  //     _player.streams.error.listen((error) {
  //       print('Player error: $error');
  //       setState(() {
  //         _errorMessage = 'Video error: $error';
  //         _isPlayerInitialized = false;
  //         _isLoading = false;
  //       });
  //     });

  //     _player.streams.completed.listen((completed) {
  //       if (completed) {
  //         setState(() {
  //           _isPlaying = false;
  //         });
  //       }
  //     });

  //     _player.streams.playing.listen((playing) {
  //       setState(() {
  //         _isPlaying = playing;
  //       });
  //     });

  //     _player.streams.buffering.listen((buffering) {
  //       print('Buffering: $buffering');
  //     });

  //     // Open video - using a sample video URL
  //     // You can replace this with your asset or network video
  //     await _player.open(
  //       Media('http://192.168.1.6:3000/courses/playy/23'),
  //       play: false, // Start paused
  //     );

  //     setState(() {
  //       _isPlayerInitialized = true;
  //       _isLoading = false;
  //     });

  //   } catch (e) {
  //     print('Error initializing player: $e');
  //     setState(() {
  //       _errorMessage = 'Failed to load video: $e';
  //       _isPlayerInitialized = false;
  //       _isLoading = false;
  //     });
  //   }
  // }

  // void _playPause() {
  //   if (!_isPlayerInitialized) return;
    
  //   if (_isPlaying) {
  //     _player.pause();
  //   } else {
  //     _player.play();
  //   }
  // }

  // void _seekForward() {
  //   if (!_isPlayerInitialized) return;
  //   final current = _player.state.position;
  //   final duration = _player.state.duration;
  //   final newPosition = current + const Duration(seconds: 10);
  //   if (newPosition < duration) {
  //     _player.seek(newPosition);
  //   }
  // }

  // void _seekBackward() {
  //   if (!_isPlayerInitialized) return;
  //   final current = _player.state.position;
  //   final newPosition = current - const Duration(seconds: 10);
  //   if (newPosition > Duration.zero) {
  //     _player.seek(newPosition);
  //   }
  // }

  // void _toggleFullscreen() {
  //   // Simple fullscreen implementation
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Scaffold(
  //         backgroundColor: Colors.black,
  //         appBar: AppBar(
  //           backgroundColor: Colors.black,
  //           leading: IconButton(
  //             icon: Icon(Icons.arrow_back, color: Colors.white),
  //             onPressed: () => Navigator.pop(context),
  //           ),
  //         ),
  //         body: Center(
  //           child: _isPlayerInitialized
  //               ? Video(controller: _videoController)
  //               : Text(
  //                   'Video not available',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // String _formatDuration(Duration duration) {
  //   final minutes = duration.inMinutes.toString().padLeft(2, '0');
  //   final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  //   return '$minutes:$seconds';
  // }

  Widget _buildVideoPlayer() {
    if (_isLoading) {
      return Container(
        height: 200,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              SizedBox(height: 16),
              // Text(
                // 'Loading video...',
              //   style: TextStyle(color: Colors.white, fontSize: 16),
              // ),
            ],
          ),
        ),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Container(
        height: 200,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 50),
              SizedBox(height: 16),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _initializePlayer,
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (!_isPlayerInitialized) {
      return Container(
        height: 200,
        color: Colors.black,
        child: Center(
          child: Text(
            'Video player not initialized',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Container(
      height: 200,
      child: Stack(
        children: [
          Video(controller: _videoController),
          
          // Center play/pause button
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                  color: Colors.white.withOpacity(0.8),
                  size: 50,
                ),
                onPressed: _playPause,
              ),
            ),
          ),

          // Bottom controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.replay_10, color: Colors.white, size: 20),
                    onPressed: _seekBackward,
                  ),
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: _playPause,
                  ),
                  IconButton(
                    icon: Icon(Icons.forward_10, color: Colors.white, size: 20),
                    onPressed: _seekForward,
                  ),
                  Expanded(
                    child: StreamBuilder<Duration>(
                      stream: _player.streams.position,
                      builder: (context, snapshot) {
                        final position = snapshot.data ?? Duration.zero;
                        final duration = _player.state.duration;
                        final progress = duration.inSeconds > 0 
                            ? position.inSeconds / duration.inSeconds 
                            : 0.0;
                        
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.white30,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        );
                      },
                    ),
                  ),
                  StreamBuilder<Duration>(
                    stream: _player.streams.position,
                    builder: (context, snapshot) {
                      final position = snapshot.data ?? Duration.zero;
                      final duration = _player.state.duration;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "${_formatDuration(position)} / ${_formatDuration(duration)}",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fullscreen, color: Colors.white, size: 20),
                    onPressed: _toggleFullscreen,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
      _dashboardTokenTimer?.cancel();
  _dashboardTokenTimer = null;
  
  controller.stopDashboardTimer();
  controller.isDashboardActive.value = false;
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   player.open(Media('assets/lecture_720p.mp4'));
//  final progress =controller. percent > 1 ?controller. percent / 100 :controller. percent;
  // }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }
//   void dispose() {
//     videocontroller.dispose();
//     super.dispose();
//   }
//   @override
//   void initState() {
//     super.initState();
//     // Use a network or asset video
//     videocontroller = VideoPlayerController.asset(
//      'assets/lecture_720p.mp4',
//     )..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized
//         setState(() {});
//       });
//   }
  // @override
  // void initState() {
  //   super.initState();
  //   // Example: print courseId when widget initializes
  // }
  Timer? _dashboardTokenTimer;



void _startDashboardTokenMonitoring() {
  // Stop any existing timer
  _dashboardTokenTimer?.cancel();
  
  // Check token every minute when in Dashboard
  _dashboardTokenTimer = Timer.periodic(Duration(minutes: 1), (timer) {
    if (mounted) {
      controller.checkDashboardToken();
    }
  });
}

// @override
// void dispose() {
//   // Stop the Dashboard timer

  
//   super.dispose();
// }

  bool selectedsection=false;
  bool selectpdf=false;
  bool selectexamsassiggnment=false;
  bool contentsection=false;
// final isMobile=
  var allCourseInfos;
  var allCourseInfos2;
  var content;
PageController _pageController=PageController(
    viewportFraction: 0.22, // ~1 / 4.5
initialPage: 1

);
// bool _hasNavigated=false;
  bool _hasNavigated = false;
   
  // void _handlePress() async{
  //   if (!_hasNavigated) {
  //     await Navigator .push(context,MaterialPageRoute(builder: (context) =>FullscreenVideoScreen())
  //     );
  //     setState(() {
  //     _hasNavigated=true;
  //     });

      // Navigate to your fullscreen video screen
     
    // } else {
    //   // Show popup
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text("Notice"),
    //       content: Text("You already visited the video screen."),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.pop(context),
    //           child: Text("OK"),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  // }
int _currentPage=0;
bool isSelected1=true;
bool isSelected2=false;
bool isSelected3=false;
bool isSelected4=false;
List contentList=[];
int contentCount=0;
  @override
  Widget build(BuildContext context) {
    print("Course ID: ${widget.index}");
List l=[];
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(1, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
  void scrollToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 990;
    final isMobile2 = screenWidth < 400;
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
                    onTap: () {showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );},
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  // Image.asset('assets/Group 87935.png', width: 55),
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
                          // Image.asset('icons/Vector (3).png', width: 40, height: 41),
                          // Image.asset('icons/Vector (2).png', width: 39.02, height: 40)
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
                            // Image.asset('assets/Group 87935.png', width: 55),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
    
      body:GetBuilder<HomeController>(//init: HomeController()
      // ,
      builder: (controller){
        
    //      final section = controller.courses_lesson.map((e)=>e.section);

    // // Avoid errors if section is null
    // if (section == null || section.isEmpty) {
    //   return const Text('No lessons available');
    // }

    // // ✅ Count total lessons inside this section
    // int totalLessons = 0;
    // for (var sec in section) {
    //   if (sec?[widget.index]['lesson'] != null) {
    //     totalLessons += (sec?[widget.index]['lesson'] as List).length;
    //   }
    // }

    // // Just an example: progress based on how many lessons exist
    // // If you want a fixed "lesson index progress", replace this with your logic
    // double percent = totalLessons == 0 ? 0 : (totalLessons / 10).clamp(0.0, 1.0);
        return SingleChildScrollView(
        child:Container(decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245),borderRadius: BorderRadius.only(topLeft:Radius.circular(8) 
        ,topRight:Radius.circular(8) )),

        child:  Column(
          children: [
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
           
     
            // Wrap(
            //   spacing: 16,
            //   runSpacing: 16,
            //   alignment: WrapAlignment.center,
            //   children: [
    
  SizedBox(height: 24,)
        ,
          Container( child:Column(
            spacing: 24,
            children: [
          Container(child: Wrap(spacing: 1,
            alignment: WrapAlignment.start,
            children: [
    
        
           InkWell(
            
            child: Text('الرئيسية',style: 
            TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 181, 181, 181)),
          ),onTap:(){
            Get.to(Homeafterlogin());
            // Navigator.push(context,MaterialPageRoute(builder: (context){
            //   return Homeafterlogin();
            // }));
          } )
           
           ,  Container( width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181)),),
            InkWell(
            onTap: (){
// Navigator .push(context,MaterialPageRoute(builder: (context){
//   return Subjecttype();
// }));
     Get.to(Subjecttype());         
            },
            child:  Text('الصف الثالث الثانوي'
            ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
            )
            ),   
             Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181)),),
      //       Text('الفيزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
      //     ,    Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
      //       (Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181)),)
      // ,
           
           InkWell(child:Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
           ,
           onTap: (){
            Get.to(Subjectbooks());
        //     Navigator.push(context,MaterialPageRoute(builder: (context){
        //   return Subjectbooks();
        // }));
        },
           ) 
          
          , Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181))),
            InkWell(
              onTap: (){
                Get.to( Subjects(courseId: widget.courseId,courseInfos: controller.course_info 
                ));
      //           Navigator.push(context,MaterialPageRoute(builder: (context){
      //     return Subjects(courseId: widget.courseId,courseInfos: controller.course_info 
      // );
      //   }));
              },
              child: Text('شوف المحاضرة',style: TextStyle(color:  Color.fromARGB(255, 181, 181, 181)),)
        ,)   , Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_forward_ios,color: Color.fromARGB(255, 181, 181, 181))),
             Text('اختار محاضرة الاسبوع الاول',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
            ,
            
          ],),)  
           ,
           
           Container(width:isMobile?343:1120,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,)
           , Text('المحاضره للأسبوع الاول',textAlign: TextAlign.start,style:
             TextStyle(fontWeight: FontWeight.w600,
           fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),),SizedBox(height: 12,)
          ,  Text( 'فيديو حل على قانون اوم',textAlign: TextAlign.end,
          style: TextStyle(fontWeight: FontWeight.w400,
           fontSize: 24,color: Color.fromARGB(255, 80, 124, 181)),),SizedBox(height: 12,)
           ,Container(width: 1120,child:Row(spacing: 16, children: [
            // Image.asset('assets/')


           ],) ,)
           

,

          // Top colored header with icon
//           Container(
// height: 60,    
//         width: 275,
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//           gradient: LinearGradient(
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//       colors: [
//         Color.fromRGBO(6, 70, 152, 1),
//         Color.fromRGBO(118, 162, 212, 1),
//       ],
//     ), // Use same as your Figma blue
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child:  Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'الفزياء',
//                   style: TextStyle(color: Colors.white),
//                 ),
//           Container(
//             height: 200,width: 251,
//             child: Image.asset('assets/Frame 1597882438 (8).png'), // Replace with your asset
//           ),
                
//               ],
//             ),
//           ),

//           // const SizedBox(height: 16),

          // Subject icon or image
   
            
        
        ]
      ),
    ),
 Container(
  width: 1120, child:  Wrap( spacing: 16,
  runAlignment: WrapAlignment.center,
  children: [
 
  SizedBox(
            height: 40,  // width:1120
              width:isMobile?343: 1120,child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
         Container(child:Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
            Text('مستوى التقدم فى الماده',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 16, fontWeight: FontWeight.w400),),
            Text('${controller.percents.toStringAsFixed(0)}% مكتمل',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 12, fontWeight: FontWeight.w400)),],) ), 
            Container(  width: screenWidth,  child:
            Wrap(alignment: WrapAlignment.center,  children:
            [ new LinearPercentIndicator( width:isMobile?343:1120, lineHeight: 8.0,
    barRadius: Radius.circular(16), percent: (controller. percents / 100).clamp(0.0, 1.0), alignment:
     MainAxisAlignment.end, isRTL: true, progressColor: Color.fromARGB(255, 77, 195, 44)) ,])    ,)                                          ],)),
 Column(
  spacing: 24,crossAxisAlignment: CrossAxisAlignment.center
  ,
  children: [

Container(
  width:isMobile?343: 836,
  height: isMobile?314:474,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft:Radius.circular(8) ,topRight: Radius.circular(8)),
  ),
  
    child:
    //  Stack(alignment: Alignment.center,
    //   children: [
        //  videocontroller.value.isInitialized
        //     ? AspectRatio(
        //         aspectRatio: videocontroller.value.aspectRatio,
        //         child: VideoPlayer(videocontroller),
        //       )
        //     // : const CircularProgressIndicator(),
        //     : const Center(child: CircularProgressIndicator()),

        // === Playback Controls Positioned on top of the video ===
     _buildVideoPlayer(), 
//       Positioned(
//           top:isMobile?122: 206,
//           left:isMobile?70: 257,
//           child: Container(//alignment: Alignment.center,
//             width:isMobile?188: 322,
//  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(8)
//   ,topRight: Radius.circular(8))),           height: 60,
//             child: Wrap
//             (
//               alignment: WrapAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon:  Icon(Icons.forward_10, color: Colors.white, size:isMobile?42: 60),
//                   onPressed: () => controller.seekBy(const Duration(seconds: 10)),
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     // videocontroller.isPlaying
//                     //     ? Icons.pause_circle_filled
//                         // :
//                          Icons.play_circle_fill,
//                     size:isMobile?42: 60,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                     //  videocontroller.value.isPlaying
//                     //       ? videocontroller!.pause()
//                     //       : videocontroller!.play();
//                     });
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.replay_10, color: Colors.white, size:isMobile?42: 60),
//                   onPressed: () => controller.seekBy(const Duration(seconds: -10)),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         // === Bottom Controls Bar ===
        // Positioned(
        //   top:isMobile?249: 398,
        //   child: Container(
        //     width:isMobile?343: 837,
        //     height:isMobile?65: 76,decoration: BoxDecoration( color: Colors.black54,
        //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8) )
        //     ),
           
        //     child: Row(mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         IconButton(
        //           icon: const Icon(Icons.replay_10, color: Colors.white),
        //           onPressed: () => controller.seekBy(const Duration(seconds: -10)),
        //         ),
        //         IconButton(
        //           icon: Icon(
        //           //  videocontroller.value.isPlaying
        //           //       ? Icons.pause
        //           //       : 
        //                 Icons.play_arrow,
        //             color: Colors.white,
        //           ),
        //           onPressed: () {
        //             setState(() {
        //             //  videocontroller.value.isPlaying
        //                   // ? videocontroller!.pause()
        //                   // : videocontroller.play();
        //             });
        //           },
        //         ),
        //         IconButton(
        //           icon: const Icon(Icons.forward_10, color: Colors.white),
        //           onPressed: () => controller.seekBy(const Duration(seconds: 10)),
        //         ),
        //         // Expanded(
        //         //   child: VideoProgressIndicator(
        //         //   //  videocontroller,
        //         //     // allowScrubbing: true,
        //         //     // colors: const VideoProgressColors(
        //         //     //   playedColor: Colors.blue,
        //         //     //   bufferedColor: Colors.grey,
        //         //     //   backgroundColor: Colors.white38,
        //         //     // ),
        //         //   ),
        //         // ),
        //         const SizedBox(width: 8),
        //         const Icon(Icons.volume_up, color: Colors.white),
        //         const SizedBox(width: 8),
        //         InkWell(
        //           // onTap: _handlePress,
        //           child: const Icon(Icons.fullscreen, color: Colors.white),
        //         ),
        //         const SizedBox(width: 8),
        //         // Text(
        //         //   "${formatDuration(videocontroller!.value.position)} / ${formatDuration(videocontroller!.value.duration)}",
        //         //   style: const TextStyle(color: Colors.white, fontSize: 12),
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
   
   
     
    
 
  ),

    Container( width: 837,
               child:
                Column(
                  spacing: 24,
                  children: [
  isMobile?widget.isUsed?
 Container()   :   Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 6, 69, 152)),
        width: 343,height: 106,padding: EdgeInsets.only(left: 8,right:8),
      child:Column(children: [ 
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children: [
        Wrap(children: [
        Container(
          child: Column(
            spacing: 8,
            children: [
AutoTranslateText(text:'المادة:الفزياء',
  weight: FontWeight.w500,fontSize: 14,
  color: Color.fromARGB(255, 255, 255, 255),),
AutoTranslateText(text:'5 محاضرات',
  weight: FontWeight.w500,fontSize: 14,
  color: Color.fromARGB(255, 255, 255, 255),)],)),
          // Image.asset('assets/Frame 1597882438 (8).png',width: 51,height: 49.87,)
          ],) 
   ,   AutoTranslateText(text: '150 جنيه ',color: Color.fromARGB(255, 242, 195, 42)
        ,weight:FontWeight.w500 ,fontSize: 18
        ,),    ],),
      // SizedBox(height: 8,),
      Container(width: 327,height: 32,
      child: TextButton(
      style: TextButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: (){

    // controller.      
controller.addlessontocart(sectionId: widget.section);
        }, child: AutoTranslateText(
      color:  Color.fromARGB(255, 6, 69, 152),
        text: 'اشترك دلؤتي')),
      )
      ,
       SizedBox(height: 10,) ],)
      
      ):Container() 
    ,
Container(child: Wrap(alignment: WrapAlignment.center,
  spacing: 8,
  children: [
    InkWell( child:Container( 
      width:isMobile?80.75:200 ,height:100,decoration:
       BoxDecoration(  color:selectedsection==false&&
selectpdf==false&&
selectexamsassiggnment==true&&selectpdf==false?Color.fromARGB(255, 6, 69, 152):
 Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:
    MainAxisAlignment.center, children: [
      selectedsection==false&&
selectpdf==false&&
selectexamsassiggnment==true&&selectpdf==false
?
Image.asset('icons/Component232_2.png',cacheWidth: 32,cacheHeight: 32,):
Image.asset('assets/Component234.png',cacheWidth: 32,cacheHeight: 32,)
,
Text('الامتحنات والواجبات',style: TextStyle(fontWeight: 
FontWeight.w500,fontSize:isMobile?12:16,
color:selectedsection==false&&
selectpdf==false&&
selectexamsassiggnment==true&&selectpdf==false?
Colors.white:Color.fromARGB(255, 222, 61, 49)),)

],)

),

onTap: ()async{
   await controller.sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? ''
    //     ,
      title:   'واجبات و امتحنات'.toString()
        ,
   sectionId:   widget.section.toString()
        );
  // selectpdf==false;
  // await controller. sectionidlessontype( 
  //   //  controller.course_info
  //   //     .map((e) => e.section?[widget.index]['id'].toString())
  //   //     .first ?? '',
  //       'واجبات و امتحنات'.toString()
       
       
  //       );
 var g= controller.courses_lesson
    .map((e) => e.section?.map((e)=>e['id']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? '').toString();
      print(g);
          contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

// Count the actual content items (not characters in a joined string)
controller.update();
contentCount = contentList.length;
// If you need to print the contents for debugging:
print('Content items: $contentList');
 selectedsection=false;
selectpdf=false;
selectexamsassiggnment=true;selectpdf==false;
},),

InkWell(
  
  child:Container(width:isMobile?80.75:200  ,height:100,decoration: BoxDecoration(  color:
   selectedsection==true&&contentsection==false&&
selectpdf==false&&
selectexamsassiggnment==true?
   Color.fromARGB(255, 6, 69, 152):Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [

 selectedsection==true&&contentsection==false&&
selectpdf==false&&
selectexamsassiggnment==true?
Image.asset('icons/Component9232.png',cacheWidth: 32,cacheHeight: 32,):
Image.asset('assets/Component232_1.png',cacheWidth: 32,cacheHeight: 32,)
,
Text('pdf',style: TextStyle(fontWeight: FontWeight.w500,fontSize:isMobile?12:16,
color: selectedsection==true&&contentsection==false&&
selectpdf==false&&
selectexamsassiggnment==true? Colors.white:Color.fromARGB(255, 242, 195, 42)

),)

],) 
),  onTap: ()async{

 selectedsection=true;contentsection=false;
selectpdf=false;
selectexamsassiggnment=true;
   await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? ''
    //     ,
       title: 'pdf'.toString()
        ,
   sectionId:   widget.section.toString()
        );
  // await controller. sectionidlessontype( 
  //   //  controller.course_info
  //   //     .map((e) => e.section?[widget.index]['id'].toString())
  //   //     .first ?? '',
  //       'pdf'.toString());
        controller.update();
  contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

// Count the actual content items (not characters in a joined string)
contentCount = contentList.length;

// If you need to print the contents for debugging:
print('Content items: $contentList');
},
 ),

InkWell(
  onTap: ()async{
    print(widget .section);
controller.watched(sectionId:widget.section);
selectedsection=true;
selectpdf=false;
selectexamsassiggnment=false;
//        selectpdf==false;
  var gg=     controller.courses_lesson
    .map((e) => e);
print(gg);
   await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? ''
    //     ,
      title:   'المحاضرات'.toString()
        ,
   sectionId:   widget.section.toString()
        );
//          var g= 
//  print(g);
  //        allCourseInfos2 = controller.course_info
  //     .map((e) => e.section?.map((e) => e))
  //     .where((c) => c?.first['id'].toString() == 
  //         controller.course_info
  //             .map((e) => e.section?[widget.index]['id'].toString())
  //             .first)
  //     .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
  // l = allCourseInfos2
  //     .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
   
    // Extract content as a list of strings first
//  contentList = controller.courses_lesson
//     .expand((e) => e.section?[widget.index]['lesson']?.map((lesson) => lesson['content'] ?? []) ?? [])
//     .toList();

// // Count the actual content items (not characters in a joined string)
//  contentCount = contentList.length;

// // If you need to print the contents for debugging:
// print('Content items: $contentList');
// print('Number of content items: $contentCount');
        contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

// Count the actual content items (not characters in a joined string)
contentCount = contentList.length;

// If you need to print the contents for debugging:
print('Content items: $contentList');
  },
  child:Container(
  width:isMobile?80.75:200 ,height:100,decoration: BoxDecoration(
  color:selectedsection==true&&
selectpdf==false&&
selectexamsassiggnment==false?Color.fromARGB(255, 6, 69, 152): Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
selectedsection==true&&
selectpdf==false&&
selectexamsassiggnment==false?
Image.asset('icons/Component232_2.png',cacheWidth: 32,cacheHeight: 32,):
Image.asset('icons/Component9232.png',cacheWidth: 32,cacheHeight: 32,)
,
Text('المحاضرات',style: TextStyle(fontWeight: FontWeight.w500,fontSize:isMobile?12:16,color:
selectedsection==true&&
selectpdf==false&&
selectexamsassiggnment==false?Colors.white:Color.fromARGB(255, 6, 69, 152) ),)

],)
), )
,
InkWell(
  child:Container( width:isMobile?80.75:200  ,height:100
,decoration: BoxDecoration(
  color: selectedsection==false&&
contentsection==true&&
selectexamsassiggnment==false&&
selectpdf==false?Color.fromARGB(255, 6, 69, 152):Colors.white,border:Border.all(width: 1,color: Colors.grey)
 , borderRadius: BorderRadius.circular(8),
  ) ,child: 
Column(
  spacing:8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:
   MainAxisAlignment.center, children: [
   selectedsection==false&&
contentsection==true&&
selectexamsassiggnment==false&&
selectpdf==false?
  Image.asset('assets/Component233.png',cacheWidth: 32,cacheHeight: 32,):
  Image.asset('icons/blue.png',cacheWidth: 32,cacheHeight: 32,)
,
Text('محتوي الدرس',style: TextStyle(fontWeight:
 FontWeight.w500,fontSize:isMobile?12:16,
 color:selectedsection==false&&
contentsection==true&&
selectexamsassiggnment==false&&
selectpdf==false? Color.fromARGB(255, 245, 245, 245): Color.fromARGB(255, 6, 69, 152)),)

],)
) ,onTap: () async{

//  await controller.sectionidlessontype(
//    '', widget.section );
  await controller.fetchsectionidlesson(
    controller.course_info
        .map((e) => e.section?[widget.index]['id'].toString())
        .first ?? '');

   allCourseInfos = controller.course
      .map((e) => e.section?.map((e) => e))
      .where((c) => c?.first['id'].toString() == 
          controller.course_info
              .map((e) => e.section?[widget.index]['id'].toString())
              .first)
      .expand((c) => c?.map((e) => e) ?? []);

   allCourseInfos2 = controller.course
      .map((e) => e.section?.map((e) => e))
      .where((c) => c?.first['id'].toString() == 
          controller.course_info
              .map((e) => e.section?[widget.index]['id'].toString())
              .first)
      .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
  l = allCourseInfos2
      .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
      // .map((lesson) => lesson['name'].toString()) 
      // .toList();

  print('Lesson names: $l');
selectedsection=false;
contentsection=true;
selectexamsassiggnment==false;
selectpdf==false;
}),

],),),SizedBox(height:8),
selectedsection==false&&selectexamsassiggnment==false&&selectpdf==false&&contentsection==true?
Container( width:isMobile? 343:837 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text(
  textAlign: TextAlign.start,textDirection: TextDirection.rtl,
  'محتوى الدرس',style: TextStyle(
  
  color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: isMobile?347: 837,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return 
SingleChildScrollView(child: 

Container ( width:isMobile?343: 837,height: 52,
padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)
,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  // contentList[indexcontent]['isUsed']==true? 
//     Image.asset('assets/Group (10).png',
//     cacheWidth:12 ,cacheHeight:17 ,
// ),
Container(width:isMobile?293: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [
  Text('${l[indexlesson]['name']}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24, )
  ],) ,)
      ],)));
      }),
 Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
// Container(width:isMobile?293: 787,height: 24, child:Row(spacing:isMobile?0: 12,crossAxisAlignment: CrossAxisAlignment.center, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)],) ,),
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
//  ],),)
// ,
, Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [ 


  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width:isMobile?293: 787,height: 24, 
// child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
// children: [

//   // Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   // fontWeight: FontWeight.w500,fontSize: 16
//   // ),),
  
//   // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)],) ,)
//  ],),)


// ,Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width:isMobile?293: 787,height: 24, child:Row(spacing: 12,crossAxisAlignment: CrossAxisAlignment.center, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)],) ,)
//  ],),)

// ,Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)],) ,)
//  ],),)


//   ],) )
// ,SizedBox(height: 8,)
// ],),)
 ]))]))])):selectedsection==false&&selectexamsassiggnment==true&&selectpdf==false&&contentsection==false?
Container( width: isMobile?347: 837, child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text('الامتحنات و الواجبات',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: isMobile?347: 837,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(contentList.length,(indexlesson){  
return
InkWell(

    onTap: () async {
  
      print('mode${controller.lessonQuestions.map((e)=>e.questions?.map((e)=>e.type_ques).join()).join()}');
   
//                                            final question = controller.lessonQuestions
//     .expand((e) => e.questions ?? [])
//     .elementAt(index); print(chooses[chooseIndex]);
//     //           final question = controller.lessonQuestions
//     // .expand((e) => e.questions ?? [])
//     // .elementAt(index);
// print('answer${chooses[chooseIndex]}');
//               _selectAnswer(
//                question.id,chooses[chooseIndex]
              //  );
      final contentList = controller.courses_lesson
        .expand((e) => e.section?.map((e)=>e['lesson']) ?? [])
        .expand((content) => content is List ? content : [content])
        .toList();

  
List.generate(controller.lessonQuestions.length,(indexlesson){   
    final lessonId = contentList[indexlesson]['id'];
    if (lessonId != null) {
       controller.fetchUserQuestionsby(id: lessonId, page: 1);
    }
    
    final allQuestions = controller.lessonQuestions
      .expand((lesson) => lesson.questions ?? [])
      .toList();
    
    print('Total questions: ${allQuestions.length}');
    
    final chooseQuestions = allQuestions
      .where((q) => q.type_ques == 'chooses')
      .toList();
    
    print('Choose questions: ${chooseQuestions.length}');
    
    for (int i = 0; i < chooseQuestions.length; i++) {
      final q = chooseQuestions[i];
      print('Choose Question ${i+1}:');
      print('  - ID: ${q.id}');
      print('  - Type: ${q.type_ques}');
      print('  - Solved: ${q.solved}');
      print('  - Student Answer: ${q.studentAnswerExam}');
      print('  - Is solved == true: ${q.solved == true}');
    }
    
    if (chooseQuestions.isEmpty) {
      print('No choose questions found');
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Assignment2()));
    } else {
      final allSolved = chooseQuestions.every((q) => q.solved == true);
      print('All choose questions solved == true: $allSolved');
      
      if (allSolved) {
        print('Navigating to ExamresultAnswerSheet');
      controller.fetchResult(lessonId); 
      Get.to(ExamresultAnswerSheet(lessonIds:lessonId));
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ExamresultAnswerSheet(lessonIds:lessonId)));
      } else {
        print('Navigating to Assignment2');
        Get.to( assignment2(lessonIds: lessonId,));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Assignment2(lessonIds: lessonId,)));
      }}}
  );  print( ' mode${controller.lessonQuestions.map((e)=>e.questions?.map((e)=>e.type_ques).join()).join()}');
    //  final count = controller.lessonQuestions
    // .map((l) => l.questions?.map((e)=>e['chooses']as List).length);
    // print('mmmmmm$count');
    // .length;
controller. fetchPercentlesson(lessonId:contentList?[indexlesson]?['id'].toString());
  // controller.cou
   print( 
  controller.lessonQuestions.map((e)=>e.questions.map((e)=>e.type_ques).join()).join()
  );
  
  //     Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Assignment2(
  //      lessonIds:contentList?[indexlesson]?['id']
       
  //         // pdfId:  '58', pageNumber: 1, // Replace with actual PDF ID
  //         // initialPage: 1,
  //       ),
        
  //     ),
    
  // );
  

final currentIndex = indexlesson;
final currentContentList = List.from(contentList); // or contentList.toList()
 
if (currentIndex < currentContentList.length) {
  final lessonId = currentContentList[currentIndex]['id'];
  var data = await controller.fetchUserQuestionsby(
    id: lessonId,
    page: 1,
  );

  print('final ${controller.lessonQuestions}');
  print('finalss ${controller.lessonQuestions.map((e)=>e.questions?.length??0).join()}');
  // List.generate(controller.lessonQues),
  // print('finalss ${controller.lessonQuestions.map((e)=>e.questions?.map((e)=>e['chooses']).join()).join()}');
//  final count = controller.lessonQuestions
//     .expand((l) => l.questions ?? [])
//     .where((q) => q['chooses'] != null)
//     .length;
//  final count2 = controller.lessonQuestions
//     .expand((l) => l.questions ?? [])
//     .where((q) => q['chooses'] .map((e)=>e) );
   

// print('finalss $count2');

  //   .map((e) => e.questions?.length ?? 0)
  //   .reduce((sum, length) => sum + length)}');
// List.generate(controller.lessonQuestions
//     .map((e) => e.questions?.length ?? 0)
//     .reduce((sum, length) => sum + length), generator)
}
// await controller.fetchUserQuestion(
//   id: contentList[indexlesson]['id'],
//   page: 1,
// );
// print('final:${controller.userquestions.length}'); // البيانات محفوظة في الكنترولر
// print(data.length); // نفس البيانات مرجعة من الدالة
// controller.fetchQuestions();
// print('final${lessson}');
// =userquestions


// allCourseInfos = controller. cc
//       .map((e) => e.section?.map((e) => e))
//       .where((c) => c?.first['id'].toString() == 
//           controller.course_info
//               .map((e) => e.section?[widget.index]['id'].toString())
//               .first)
//       .expand((c) => c?.map((e) => e) ?? []);
  },
  child: 

 Container ( width: isMobile?347: 837,height: 52,padding:isMobile?EdgeInsets.only(): EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
Container(width:isMobile?239: 787,height: 24, child:Row(
  spacing:isMobile?0: 12,mainAxisAlignment: MainAxisAlignment.start, 
children: [

  Text('${
 contentList[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)
  ],) ,)
,
Text('${contentList[indexlesson]['percentageAnswer']}%'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  )
)

      ],)));
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Wrap(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )

],),)
:selectedsection==false&&selectexamsassiggnment==false&&selectpdf==true&&contentsection==false?
Container( width: isMobile?347: 837,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text('pdf',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: isMobile?347: 837,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return 
InkWell(
  onTap: (){
    //  Navigator.push(context, MaterialPageRoute(builder: (context){return PdfViewerScreen();}));
  },
  child: 
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.start, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)
  
  ],) ,)
      ],)));
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  // Image.asset('assets/Group (10).png',
  // cacheWidth:12 ,cacheHeight:17 ,
  // ),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )

],),)
      :selectpdf==false &&selectexamsassiggnment==true && selectpdf==false &&contentsection==false?
Container( width:isMobile?347: 837,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start
  
  ,

  children: [
    
Text('pdf',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,// ,  selected==false? 

Container( width: isMobile?347: 837,height: 382,child:Column(
  spacing: 14,crossAxisAlignment: CrossAxisAlignment.center,
  children: [ 
  ...List.generate(contentList.length!,(indexcontent){
    if(contentList[indexcontent]['content'].map((e)=>e['name'])=='المحاضرات'  )
// InkWell(onTap: (){},child: ,)
{if(contentList[indexcontent]['isUsed']==true) 
return InkWell( onTap: (){},child:Container ( width: 837,height: 52
,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('${
contentList[indexcontent]['name'].toString()
 
 
 }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  // Image.asset('assets/video-play.png',width: 24,height: 24,)
  ],) ,)
  
  
      ],)) 
      
       
      
      ) ;
      
      return  InkWell( onTap: (){},child:Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('${
contentList[indexcontent]['name'].toString()
 
 
 }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  // Image.asset('assets/video-play.png',width: 24,height: 24,)
  
  ],) ,)
      ],)) 
      
       
      
      ) ;
      
      }
return InkWell(onTap: (){
  controller. fetchPercentlesson(lessonId:contentList?[indexcontent]?['id'].toString());
 Get.to(LessonPdfViewer(section: widget.section,lessonId: 
        contentList[indexcontent]['id'],totalPages: contentList[indexcontent]['pdfImages'].length        //  pageNumber:1 ,pdfId: '65',
      //  courseId:widget.courseId ,
      // ,progress:contentList?[indexcontent]?['percentage'],
     ,  index: widget.index,lesson: widget.lesson,
       
       
          // pdfId:  '58', pageNumber: 1, // Replace with actual PDF ID
          // initialPage: 1,
        ),);
  // Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LessonPdfViewer(section: widget.section,lessonId: 
  //       contentList[indexcontent]['id'],totalPages: contentList[indexcontent]['pdfImages'].length        //  pageNumber:1 ,pdfId: '65',
  //     //  courseId:widget.courseId ,
  //     // ,progress:contentList?[indexcontent]?['percentage'],
  //    ,  index: widget.index,lesson: widget.lesson,
       
       
  //         // pdfId:  '58', pageNumber: 1, // Replace with actual PDF ID
  //         // initialPage: 1,
  //       ),
        
  //     ),
    
  // );
  },child: 
  Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap( alignment: WrapAlignment.spaceBetween, children: [
Container(width:isMobile?270: 787,height: 24, child:Row(//spacing:isMobile?8: 12,
// mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
// alignment: WrapAlignment.center, 
children: [

  Text('${
contentList[indexcontent]['name'].toString()
 
 
 }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)
  ],) ,),
  Text('${
contentList[indexcontent]['percentage'].toString()
 
 
 }%',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
// contentList[indexcontent]['isUsed']==true?Container()
//     :Image.asset('assets/Group (10).png',cacheWidth: 12,cacheHeight: 17),
      ],))
  ,) ;
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  // if(contentList[indexconten]['isUsed']==true) ?Container():
  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )
  

],),)
       :
Container( width: isMobile?347: 837,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text('المحاضرات',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,// ,  selected==false? 
 Container( width:isMobile?347: 837,child:Column(
  spacing: 14,
  children: [ 
  ...List.generate(contentCount!,(indexcontent){  
if(contentList[indexcontent]['isUsed']==true)   
return InkWell( onTap: ()async{
controller. fetchPercentlesson(lessonId:contentList?[indexcontent]?['id'].toString());
// await controller.initializePlayer2('${contentList?[indexcontent]?['id'].toString()}');
//  print('${contentList?[indexcontent]?['id'].toString()}');
 
 Get.to(Videobyid(index: widget.index,
    lesson: widget.lesson,//,progress:contentList?[indexcontent]?['viewPercent'].toString(),
    courseId:widget.courseId,sectionId:widget.section));
  // Navigator.push(context,MaterialPageRoute(builder: (context){
  //   return Videobyid(index: widget.index,
  //   lesson: widget.lesson,//,progress:contentList?[indexcontent]?['viewPercent'].toString(),
  //   courseId:widget.courseId,sectionId:widget.section);
  //   }));
  print('${contentList[indexcontent]['id']}');
  // controller.initializePlayer2(contentList[indexcontent]['id']);
  
  }

,child:Container ( width: isMobile?347: 837,height: 52,padding:isMobile?EdgeInsets.only(top: 14,bottom: 14,left: 16,right: 16):
 EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)
,borderRadius:BorderRadius.circular(12),border: Border.all(
  width:1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
   
Container(width:isMobile?270: 787,height: 24, child:Row(//spacing:isMobile?8: 12,
// mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
children: [

  Text('${contentList[indexcontent]['name'].toString()}'
  ,style:TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)
   ],) ,)
   , Text('${contentList[indexcontent]['viewPercent'].toString()}%'
  ,style:TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,), 
  ],))
    ,);

  return
InkWell( onTap: ()async{
  controller. fetchPercentlesson(lessonId:contentList?[indexcontent]?['id'].toString());
 controller.addLessonToCart(id: contentList[indexcontent]['id']!);
 Addtocart();
 
 // await controller.initializePlayer2('${contentList?[indexcontent]?['id'].toString()}');
//  print('${contentList?[indexcontent]?['id'].toString()}');
  // Navigator.push(context,MaterialPageRoute(builder: (context){
  //   return Videobyid(index: widget.index,lesson: widget.lesson,courseId:widget.courseId,);
  //   }));
  // print('${contentList[indexcontent]['id']}');
  // controller.initializePlayer2(contentList[indexcontent]['id']);
  
  }
,child:Container ( width: isMobile?347: 837,height: 52,padding:isMobile?EdgeInsets.only(top: 14,bottom: 14,left: 16,right: 16):
 EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)
,borderRadius:BorderRadius.circular(12),border: Border.all(
  width:1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
   
Container(width:isMobile?293: 787,height: 24, child:Row(//spacing:isMobile?8: 12,
// mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
children: [

  Text('${contentList[indexcontent]['name'].toString()}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  // Image.asset('assets/video-play.png',cacheWidth: 24,cacheHeight: 24,)
   ],) ,)
  //  , contentList[indexcontent]['isUsed']==true?Container():
  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),  
  , Text('${contentList[indexcontent]['viewPercent'].toString()}'
  ,style:TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  ],))
    ,);
   }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(
color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  
  // Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),

 ],),)


  ],) ) 
 

  

],),) 
       
               ],),
               )
             ]) 

,  !isMobile? Container(
  width: 267,
  padding: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue.shade100),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 6,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        children: [
          Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8))  ,
            // child:
            //  Image.asset(
            //   'assets/Frame 1597882438 (8).png',
            //   height: 200,
            //   width: 267,
            //   // fit: BoxFit.cover,
            // ),
          ),
         
          Positioned(
            top: 2,
            left: 0,
            right: 0,
            child: Container(width: 267,height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(6, 69, 152, 0.685),
                    Color.fromRGBO(118, 162, 212, 0.658),
                  ],
                ),
              ),
              // child: const Center(
                child: Text(textAlign: TextAlign.start,
                  'الفيرياء',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              // ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),

      // Subject title and lectures
    Container( width: 251,height: 98,child:Wrap( children: [
      // contentList[indexcontent]['isUsed']==true?Container(): 
      // Image.asset('assets/Group (12).png',height: 30,width: 30,),
      Container(width: 205,height: 98,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         
          
          const Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المادة:الفيزياء' ,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
              "محاضرات5",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
              " جنيه150",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ) ,)
     ],) ,)  
,


      // Subscribe Button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context){}));
            // Navigator.push(context, MaterialPageRoute(builder: (context){return subjectBooks2();}));
      // showDialog(
              //   context: context,
              //   builder: (context) => Menuebarpaym2(price: price, sectionId: id, course:widget. courseId),
              // );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'اشترك دلوقتي',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  ),

)
 :Container() ],)
  
  
 )
              
  ,          





      
            _buildFooter(context),
            const SizedBox(height: 10),
            const Text(
              'Copyright © 2023 Ashtar App | Terms of Use | Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
        
   ]))])));}));
  }
  Widget _buildAppBarButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: textColor),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      child: Text(label),
    );
  }
 
   
  Widget _buildButton(String text, {bool isPrimary = false}) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:
              isPrimary ? Colors.white : Colors.transparent,
          side: isPrimary
              ? null
              : const BorderSide(color: Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isPrimary ? const Color.fromARGB(255, 6, 69, 152) : Colors.white,
          ),
        ),
      ),
    );
  }

   Widget _buildClassCard(String title, String imagePath,context,bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
    
      child: Column(
        children: [
          Container(
             
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
            // height: 150
            // ,
            width:isMobile? 362.67:300,
            padding: const EdgeInsets.all(8),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
        ],
      ),
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

  // Widget _buildClassCard(String title, String imagePath) {
  //   return Container(
  //     width: 362,
  //     decoration: BoxDecoration(
  //       color: const Color.fromARGB(255, 212, 221, 232),
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           height: 150,
  //           padding: const EdgeInsets.all(8),
  //           child: Image.asset(imagePath, fit: BoxFit.contain),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             title,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.w600,
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 6, 69, 152),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Image.asset('assets/Frame (10).png', width: 43, height: 40),
          const SizedBox(height: 8),
          const Text(
            'الأستاذ شريف البدري',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            textAlign: TextAlign.right,
          ),
          const Text(
            'مدرس ماده العلوم',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          const Text(
            'أستاذ العلوم المميز: حاز على شهادة التخرج من كلية الآداب والتربية بتقدير امتياز مع مرتبة الشرف، ويتمتع بخبرة واسعة تمتد لثلاثين عامًا في ميدان تدريس اللغة العربية. يتميز بتدريس مناهج الثانوية العامة بكل دقة واهتمام، وقد أُطلِق عليه لقب "صانع الأوائل" نظرًا لتفانيه الدائم وجهوده الحثيثة في تحفيز وتوجيه طلابه نحو تحقيق النجاح والتفوق. ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 80, 124, 181),
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

Widget _buildFooter(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    width: double.infinity,
    color: const Color.fromARGB(255, 6, 69, 152),
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                SizedBox(
                  width: screenWidth < 600 ? double.infinity : 500,
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
                      // _buildInfoRow('icons/location.png',
                      //     '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      // const SizedBox(height: 12),
                      // _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      // const SizedBox(height: 12),
                      // _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
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
                      Wrap(
                alignment: WrapAlignment.start,        children: [
                          _storeButton('icons/Frame_16.png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('icons/Frame_15.png', 'App Store'),
                        ],
                      )
                    ],
                  ),
                ),

                // Column: About Section
                SizedBox(
                  width: screenWidth < 600 ? double.infinity : 600,
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
                              color: Color.fromARGB(255, 242, 195, 42),
                              fontSize: 24),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        // child:
                        
                        //  Image.asset(
                        //   'assets/Group 87935.png',
                        //   width: 80,
                        //   height: 65.7,
                        // ),
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
          ],
        ),
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
 Widget menuButton(BuildContext context, String label, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          // Add navigation here if needed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: textColor),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
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
}
// Future<void> sectionidlessontype(String title) async {
//   try {
//     final queryParams = <String, String>{};
//     if (title.isNotEmpty) {
//       queryParams['title'] = title;
//     }

//     final Uri uri = Uri.http(
//       'localhost:3000',
//       '/lesson/typelesson',
//       queryParams,
//     );

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     final response = await http.get(
//       uri,
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       print('Raw API Response: ${response.body}'); // Debugging

//       final dynamic courseData = jsonResponse['course'];

//       if (courseData is List) {
//         courses_lesson = courseData.map((item) => Course.fromJson(item)).toList();
//         print('Successfully loaded ${courses_lesson.length} courses');
//       } else {
//         print('Error: course data is not a List');
//       }

//       update();
//     } else {
//       print('Failed to fetch: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error in sectionidlessontype: $e');
//   }
// } 
    

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';

// void main() {
//   // Required for media_kit initialization
//   WidgetsFlutterBinding.ensureInitialized();
//   MediaKit.ensureInitialized();
  
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Video Player Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Lecturenotpaid(
//         courseId: '1',
//         index: 0,
//         lesson: 'lesson1',
//       ),
//     );
//   }
// }

// class Lecturenotpaid extends StatefulWidget {
//   final String courseId;
//   final int index;
//   final  lesson;
  
//   const Lecturenotpaid({
//     Key? key,
//     required this.courseId,
//     required this.index,
//     required this.lesson,
//   }) : super(key: key);

//   @override
//   State<Lecturenotpaid> createState() => _LecturenotpaidState();
// }

// class _LecturenotpaidState extends State<Lecturenotpaid> {
//   late Player _player;
//   late VideoController _videoController;
//   bool _isPlayerInitialized = false;
//   bool _isPlaying = false;
//   bool _isLoading = true;
//   String _errorMessage = '';

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _initializePlayer();
//   // }

//   Future<void> _initializePlayer() async {
//     try {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = '';
//       });

//       // Initialize player
//       _player = Player();
//       _videoController = VideoController(_player);

//       // Set up event listeners
//       _player.streams.error.listen((error) {
//         print('Player error: $error');
//         setState(() {
//           _errorMessage = 'Video error: $error';
//           _isPlayerInitialized = false;
//           _isLoading = false;
//         });
//       });

//       _player.streams.completed.listen((completed) {
//         if (completed) {
//           setState(() {
//             _isPlaying = false;
//           });
//         }
//       });

//       _player.streams.playing.listen((playing) {
//         setState(() {
//           _isPlaying = playing;
//         });
//       });

//       _player.streams.buffering.listen((buffering) {
//         print('Buffering: $buffering');
//       });

//       // Open video - using a sample video URL
//       // You can replace this with your asset or network video
//       await _player.open(
//         Media('http://192.168.1.6:3000/courses/playy/23'),
//         play: false, // Start paused
//       );

//       setState(() {
//         _isPlayerInitialized = true;
//         _isLoading = false;
//       });

//     } catch (e) {
//       print('Error initializing player: $e');
//       setState(() {
//         _errorMessage = 'Failed to load video: $e';
//         _isPlayerInitialized = false;
//         _isLoading = false;
//       });
//     }
//   }

//   void _playPause() {
//     if (!_isPlayerInitialized) return;
    
//     if (_isPlaying) {
//       _player.pause();
//     } else {
//       _player.play();
//     }
//   }

//   void _seekForward() {
//     if (!_isPlayerInitialized) return;
//     final current = _player.state.position;
//     final duration = _player.state.duration;
//     final newPosition = current + const Duration(seconds: 10);
//     if (newPosition < duration) {
//       _player.seek(newPosition);
//     }
//   }

//   void _seekBackward() {
//     if (!_isPlayerInitialized) return;
//     final current = _player.state.position;
//     final newPosition = current - const Duration(seconds: 10);
//     if (newPosition > Duration.zero) {
//       _player.seek(newPosition);
//     }
//   }

//   void _toggleFullscreen() {
//     // Simple fullscreen implementation
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ),
//           body: Center(
//             child: _isPlayerInitialized
//                 ? Video(controller: _videoController)
//                 : Text(
//                     'Video not available',
//                     style: TextStyle(color: Colors.white),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   String _formatDuration(Duration duration) {
//     final minutes = duration.inMinutes.toString().padLeft(2, '0');
//     final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   Widget _buildVideoPlayer() {
//     if (_isLoading) {
//       return Container(
//         height: 200,
//         color: Colors.black,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
//               SizedBox(height: 16),
//               Text(
//                 'Loading video...',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     if (_errorMessage.isNotEmpty) {
//       return Container(
//         height: 200,
//         color: Colors.black,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.error_outline, color: Colors.red, size: 50),
//               SizedBox(height: 16),
//               Text(
//                 _errorMessage,
//                 style: TextStyle(color: Colors.white, fontSize: 14),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _initializePlayer,
//                 child: Text('Retry'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     if (!_isPlayerInitialized) {
//       return Container(
//         height: 200,
//         color: Colors.black,
//         child: Center(
//           child: Text(
//             'Video player not initialized',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       );
//     }

//     return Container(
//       height: 200,
//       child: Stack(
//         children: [
//           Video(controller: _videoController),
          
//           // Center play/pause button
//           Positioned.fill(
//             child: Align(
//               alignment: Alignment.center,
//               child: IconButton(
//                 icon: Icon(
//                   _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
//                   color: Colors.white.withOpacity(0.8),
//                   size: 50,
//                 ),
//                 onPressed: _playPause,
//               ),
//             ),
//           ),

//           // Bottom controls
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [Colors.black54, Colors.transparent],
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.white, size: 20),
//                     onPressed: _seekBackward,
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                     onPressed: _playPause,
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.white, size: 20),
//                     onPressed: _seekForward,
//                   ),
//                   Expanded(
//                     child: StreamBuilder<Duration>(
//                       stream: _player.streams.position,
//                       builder: (context, snapshot) {
//                         final position = snapshot.data ?? Duration.zero;
//                         final duration = _player.state.duration;
//                         final progress = duration.inSeconds > 0 
//                             ? position.inSeconds / duration.inSeconds 
//                             : 0.0;
                        
//                         return Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8),
//                           child: LinearProgressIndicator(
//                             value: progress,
//                             backgroundColor: Colors.white30,
//                             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   StreamBuilder<Duration>(
//                     stream: _player.streams.position,
//                     builder: (context, snapshot) {
//                       final position = snapshot.data ?? Duration.zero;
//                       final duration = _player.state.duration;
//                       return Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(
//                           "${_formatDuration(position)} / ${_formatDuration(duration)}",
//                           style: TextStyle(color: Colors.white, fontSize: 12),
//                         ),
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.fullscreen, color: Colors.white, size: 20),
//                     onPressed: _toggleFullscreen,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Lecture'),
//         backgroundColor: Color.fromARGB(255, 6, 70, 152),
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Video Player Section
//               Text(
//                 'Physics Lecture - Week 1',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 6, 69, 152),
//                 ),
//               ),
//               SizedBox(height: 16),
              
//               _buildVideoPlayer(),
              
//               SizedBox(height: 24),
              
//               // Course Info
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 6, 69, 152),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Course Information',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Icon(Icons.book, color: Colors.white),
//                         SizedBox(width: 8),
//                         Text(
//                           'Subject: Physics',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Icon(Icons.video_library, color: Colors.white),
//                         SizedBox(width: 8),
//                         Text(
//                           '5 Lectures',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Icon(Icons.attach_money, color: Color.fromARGB(255, 242, 195, 42)),
//                         SizedBox(width: 8),
//                         Text(
//                           'Price: 150 EGP',
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 242, 195, 42),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Subscribe action
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: Color.fromARGB(255, 6, 69, 152),
//                         ),
//                         child: Text('Subscribe Now'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(height: 24),
              
//               // Content Sections
//               Text(
//                 'Course Content',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 6, 69, 152),
//                 ),
//               ),
//               SizedBox(height: 16),
              
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 12,
//                 children: [
//                   _buildContentButton(
//                     icon: Icons.video_library,
//                     title: 'Lectures',
//                     color: Color.fromARGB(255, 6, 182, 141),
//                   ),
//                   _buildContentButton(
//                     icon: Icons.picture_as_pdf,
//                     title: 'PDFs',
//                     color: Color.fromARGB(255, 242, 195, 42),
//                   ),
//                   _buildContentButton(
//                     icon: Icons.assignment,
//                     title: 'Assignments',
//                     color: Color.fromARGB(255, 222, 61, 49),
//                   ),
//                   _buildContentButton(
//                     icon: Icons.article,
//                     title: 'Content',
//                     color: Color.fromARGB(255, 6, 69, 152),
//                   ),
//                 ],
//               ),
              
//               SizedBox(height: 24),
              
//               // Lesson List
//               _buildLessonItem('Introduction to Physics', Icons.play_circle_fill),
//               _buildLessonItem('Laws of Motion', Icons.play_circle_fill),
//               _buildLessonItem('Energy and Work', Icons.play_circle_fill),
//               _buildLessonItem('Practice Problems', Icons.assignment),
//               _buildLessonItem('Summary PDF', Icons.picture_as_pdf),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContentButton({
//     required IconData icon,
//     required String title,
//     required Color color,
//   }) {
//     return Container(
//       width: 80,
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: color, size: 24),
//           SizedBox(height: 8),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               color: color,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLessonItem(String title, IconData icon) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.only(bottom: 8),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Color.fromARGB(255, 6, 69, 152)),
//           SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: Color.fromARGB(255, 6, 69, 152),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           Icon(Icons.chevron_right, color: Colors.grey),
//         ],
//       ),
//     );
//   }
// }


// // class _MenuItem extends StatelessWidget {
// //   final String title;
// //   final bool isActive;
// //   const _MenuItem({required this.title, this.isActive = false});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 10),
// //       child: Text(
// //         title,
// //         textDirection: TextDirection.rtl,
// //         style: TextStyle(
// //           color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
// //           fontSize: 16,
// //           fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
// //         ),
// //       ),
// //     );
// //   }
// // }