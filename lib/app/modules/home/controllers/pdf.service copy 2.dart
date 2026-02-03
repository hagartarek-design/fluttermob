













































































































































import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoController;
  final RxBool isVideoLoading = false.obs;
  final RxString videoError = ''.obs;
  final RxBool isVideoPlaying = false.obs;
  final RxDouble videoProgress = 0.0.obs;
  final RxDouble videoBufferProgress = 0.0.obs;

  Future<void> initializeVideo(String videoUrl) async {
    try {
      isVideoLoading.value = true;
      videoError.value = '';
      
      
      await videoController?.dispose();
      
      videoController = VideoPlayerController.network(videoUrl)
        ..addListener(_videoListener);
      
      await videoController!.initialize();
      
      if (videoController!.value.hasError) {
        throw Exception('Video error: ${videoController!.value.errorDescription}');
      }
      
      await videoController!.play();
      isVideoPlaying.value = true;
      
    } catch (e) {
      videoError.value = 'Failed to load video: $e';
      print('Video error: $e');
    } finally {
      isVideoLoading.value = false;
    }
  }

  void _videoListener() {
    if (videoController == null) return;
    
    final value = videoController!.value;
    isVideoPlaying.value = value.isPlaying;
    
    if (value.duration.inSeconds > 0) {
      videoProgress.value = value.position.inSeconds / value.duration.inSeconds;
    }
    
    update();
  }

  void togglePlayPause() {
    if (videoController == null) return;
    
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  void seekBy(Duration offset) {
    if (videoController == null) return;
    
    final current = videoController!.value.position;
    final newPosition = current + offset;
    
    if (newPosition < Duration.zero) {
      videoController!.seekTo(Duration.zero);
    } else if (newPosition > videoController!.value.duration) {
      videoController!.seekTo(videoController!.value.duration);
    } else {
      videoController!.seekTo(newPosition);
    }
  }

  @override
  void onClose() {
    videoController?.removeListener(_videoListener);
    videoController?.dispose();
    super.onClose();
  }
}