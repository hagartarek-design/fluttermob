import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';



class FullscreenVideoScreen extends StatefulWidget {
  const FullscreenVideoScreen({super.key});

  @override
  _FullscreenVideoScreenState createState() => _FullscreenVideoScreenState();
}

class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
   
    _videoPlayerController = VideoPlayerController.network(
          'http://localhost:3000/courses/play/${24}',
  )..initialize().then((_) {
        setState(() {}); 
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      showControlsOnInitialize: true,
      
    );
  }

  @override
  void dispose() {
    
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _chewieController != null &&
              _videoPlayerController.value.isInitialized
          ? Center(
              child: Chewie(
                controller: _chewieController!,
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
