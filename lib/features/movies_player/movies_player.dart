import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String urlMovies;
  const VideoPlayer({super.key, required this.urlMovies});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? _chewieController;
  late VideoPlayerController _videoPlayerController;
  Future initVideo() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.urlMovies));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController, autoPlay: true);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.black,
        foregroundColor: ColorsManger.white,
      ),
      backgroundColor: ColorsManger.black,
      body: Center(
          child: _chewieController != null
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: _chewieController!),
                )
              : CircularProgressIndicator(
                  color: ColorsManger.yellow,
                )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController!.dispose();
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
  }
}
