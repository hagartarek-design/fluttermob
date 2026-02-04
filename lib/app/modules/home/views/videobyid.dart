import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';
import 'package:my_app/Applinks.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/mennimenue.dart';

import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjects.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:video_player/video_player.dart';
import '';import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'videofullscreen.dart';
class Videobyid extends StatefulWidget {

  
  
  
  
  
    final String courseId;
  final index;
  final lesson;
  final sectionId;

  const Videobyid({
    super.key,required this.index,
    required this.lesson,
    required this.courseId,required this.sectionId 
  });

  @override
  State<Videobyid> createState() => _LectureNotPaidState();
}

class _LectureNotPaidState extends State<Videobyid> {
 
 
    late Player _player;
  late VideoController _videoController;
  bool _isPlayerInitialized = false;
  bool _isPlaying = false;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      
      _player = Player();
      _videoController = VideoController(_player);

      
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
            HomeController controller=Get.find<HomeController>();
         controller.  watched(sectionId:widget.sectionId);
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
        Media('${Applinks.baseurl}/courses/playy/${widget.lesson}'),
        play: false, 
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
      child:
       Stack(
        children: [
          Video(controller: _videoController),
          
          
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
    super.dispose();
  }
  
  
  
  
  
  
  
  
  

  var allCourseInfos;
  var allCourseInfos2;
  var content;
PageController _pageController=PageController(
    viewportFraction: 0.22, 
initialPage: 1

);

  bool _hasNavigated = false;

  void _handlePress() async{
    if (!_hasNavigated) {
      await Navigator .push(context,MaterialPageRoute(builder: (context) =>FullscreenVideoScreen())
      );
      setState(() {
      _hasNavigated=true;
      });

      
     
    } else {
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Notice"),
          content: Text("You already visited the video screen."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
    bool selectedsection=false;
  bool selectpdf=false;
  bool selectexamsassiggnment=false;
  bool contentsection=false;
int _currentPage=0;
bool isSelected1=true;
bool isSelected2=false;
bool isSelected3=false;
bool isSelected4=false;
List contentList=[];
int contentCount=0;
  @override
  Widget build(BuildContext context) {
    
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
    return Scaffold(
      appBar:isMobile? 
      
      
       AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 6, 70, 152),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
       InkWell( onTap: (){
showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const mennimenu(),
    );
       

       }, child:  Icon(Icons.menu, color:Colors.white ,))   
,
              
              Row(
                children: [
              Image.asset('assets/Group87935.png', width: 55),
                ],
              ),
            ],
          ),
        )
      


































   

   
      
      :AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 85,
        backgroundColor: const Color.fromARGB(255, 6, 69, 152),
        title: Center(
          child: Container(
            width: screenWidth * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          
                          
                        ),
                      ),
                    Image.asset('icons/Vector_3.png',width: 40,height: 41,),
                    Image.asset('icons/Vector_2.png',width: 39.02,height: 40,)
                    
                    
                    
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
      body:GetBuilder(init: HomeController()
      ,builder: (controller){return SingleChildScrollView(
        child:Container(
          
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245)
          ,borderRadius: BorderRadius.only(topLeft:Radius.circular(8) 
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
           
     
            
            
            
            
            
    
  SizedBox(height: 24,)
        ,
          Container( child:Column(
            spacing: 24,
            children: [
          Container(child: Wrap(spacing: 1,
            alignment: WrapAlignment.end,
            children: [
         Text('اختار الاقسام',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
            ,
            
            Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),)
      ,
           
            Text('اختار نشاطك',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
          
          
            ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
            Text('الفيزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
            ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
             Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
            
            ),  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181))),
            Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
          ), 
          
          ],),)  
           ,
           Container(width:1120,child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 12,)
           , Text('اختيار القسم',textAlign: TextAlign.end,style:
             TextStyle(fontWeight: FontWeight.w600,
           fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),),SizedBox(height: 12,)
          ,  Text('المحاضره للأسبوع الاول',textAlign: TextAlign.end,
          style: TextStyle(fontWeight: FontWeight.w400,
           fontSize: 24,color: Color.fromARGB(255, 80, 124, 181)),),SizedBox(height: 12,)
           ,Container(width: 1120,child:Wrap(spacing: 16, children: [
            


           ],) ,)
           

,

          


























                






          
   
            
        
        ]
      ),
    ),
 Container(
  width:isMobile?343:1120, child:  Wrap(
  alignment: WrapAlignment.start,
  children: [





























































  





         
          

            









































 Column(
  spacing: 24,
  children: [
  SizedBox(
            height: 40,  
              width:isMobile?343: 1120,child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
         Container(child:Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
            Text('مستوى التقدم فى الماده',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 16, fontWeight: FontWeight.w400),),
            Text('${controller.percentsvideo.toStringAsFixed(0)}% مكتمل',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181), fontSize: 12, fontWeight: FontWeight.w400)),
       ],) ), 
Container(  width: screenWidth,  child:
  Wrap( alignment: WrapAlignment.center,  children:
   [ new LinearPercentIndicator( width:isMobile?343:1120, lineHeight: 8.0,
    barRadius: Radius.circular(16), percent: (controller. percentsvideo / 100).clamp(0.0, 1.0), alignment:
     MainAxisAlignment.end, isRTL: true, progressColor: Color.fromARGB(255, 77, 195, 44)) ,])    ,

                         )                                          ],)),

                        










  
Container(
  width:isMobile?343: 1120,
  height:isMobile?314: 490,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8)
    ),
  ),
child: Container(
  width: isMobile ? 343 : 1120,
  height: isMobile ? 314 : 490,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8)
    ),
  ),
  child:_buildVideoPlayer()
)
),

  
    
       Container( 
               child:
                Column(children: [

 Container(child: Wrap(alignment: WrapAlignment.center,
  // spacing: 8,
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
Image.asset('icons/Component232.png',cacheWidth: 32,cacheHeight: 32,):
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
   sectionId:   widget.sectionId.toString()
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
Image.asset('icons/Component232.png',cacheWidth: 32,cacheHeight: 32,):
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
   sectionId:   widget.sectionId.toString()
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
    print(widget .sectionId);
controller.watched(sectionId:widget.sectionId);
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
   sectionId:   widget.sectionId.toString()
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
Image.asset('icons/Component232.png',cacheWidth: 32,cacheHeight: 32,):
Image.asset('icons/Component9232.png',cacheWidth: 32,cacheHeight: 32,)
,
Text('المحاضرات',style: TextStyle(fontWeight: FontWeight.w500,fontSize:isMobile?12:16,color:
selectedsection==true&&
selectpdf==false&&
selectexamsassiggnment==false?Colors.white:Color.fromARGB(255, 6, 182, 141) ),)

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

],),) ,SizedBox(height:8),
selectedsection==false&&selectexamsassiggnment==false&&selectpdf==false&&contentsection==true?
Container( width: 1120 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: 1120,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width: 112,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.end, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
  
  
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),






  

 ],),)

,Container ( width: isMobile?311:1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),


),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)
,
 Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),


),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container( width: 787,height: 24, 
child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)


,Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),


),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

,Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),


),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)


  ],) )

],),)
:selectedsection==false&&selectexamsassiggnment==true&&selectpdf==false&&contentsection==false?
Container( width: isMobile?311:1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width:isMobile?311: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(contentList.length,(indexlesson){  
return Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width:isMobile?311: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${
 contentList[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
  
  
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),






  

 ],),)
















  





















  



















  


















  




  ],) )

],),)
:selectedsection==false&&selectexamsassiggnment==false&&selectpdf==true&&contentsection==false?
Container( width:isMobile?311: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width:isMobile?311: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width:isMobile?311: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width: isMobile?311:1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
  
  
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),

],),)
],) )
],),)
      :selectpdf==false &&selectexamsassiggnment==true && selectpdf==false &&contentsection==false?
Container( width:isMobile?311: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,
Container( width:isMobile?311: 1120,height: 382,child:Column(
  spacing: 14,
  children: [ 
  ...List.generate(contentList.length!,(indexcontent){
    if(contentList[indexcontent]['content'].map((e)=>e['name'])=='المحاضرات'  )
return InkWell( onTap: (){


  
},child:Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width:isMobile?311: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${
contentList[indexcontent]['name'].toString()
 
 
 }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Text('${
contentList[indexcontent]['viewPercent'].toString()
 
 
 }%',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  ],) 
  )
      ],)) ,) ;
return  Container (height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)
,borderRadius:BorderRadius.circular(12),border: Border.all(
width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width: isMobile?311:787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [
Text('${contentList[indexcontent]['name'].toString()}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width:isMobile
?343: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
  
  
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),






  

 ],),)
















  





















  



















  


















  




  ],) )
  

],),)
       :
Container( width:isMobile?311: 1120,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,
Container( width:isMobile?311: 1120,child:Column(
  spacing: 14,
  children: [ 
    
  ...List.generate(contentCount!,(indexcontent){  
return 
InkWell(onTap: ()async{
 
await controller.initializePlayer2('${contentList?[indexcontent]?['id'].toString()}');
 print('${contentList?[indexcontent]?['id'].toString()}');
 Get.to(Videobyid(index:widget.index,lesson: widget.lesson,courseId: widget.courseId,sectionId: widget.sectionId,));
  // Navigator.push(context,MaterialPageRoute(builder: (context){
  //   return 
  //   }));
  
  
  
  }
,child:Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)
,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),
Container(width:isMobile?311: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
children: [

  Text('${contentList[indexcontent]['name'].toString()}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],))
    ,);
   }),
Container ( width:isMobile?311: 1120,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group_10.png',width: 12.74,height: 17.1,),

 ],),)


  ],) )
 

  

],),)
       
               ],),
               )
              ])


  ],)
  
  
 )
              
  ,          



SizedBox(height: 24,),

      
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
            height: 150,width:isMobile? 362.67:300,
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

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/Frame_10.png', width: 43, height: 40),
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
                      Row(
                mainAxisAlignment: MainAxisAlignment.end,        children: [
                          _storeButton('icons/Frame_16.png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('icons/Frame_15.png', 'App Store'),
                        ],
                      )
                    ],
                  ),
                ),

                
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
          ],
        ),
      ),
    ),
  );
}

Widget _buildInfoRow(String iconPath, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
  }}

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
          color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
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













































    

