import 'dart:html';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  MyVideoPlayer({Key? key, required this.videoFile}) : super(key: key);
  final File videoFile;
  @override
  _MyVideoPlayerState createState()=> _MyVideoPlayerState();
}
class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    //_controller= VideoPlayerController.file(widget.videoFile);
    _initializeVideoPlayerFuture= _controller.initialize();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.done) {
          //Play video once it's loaded
          _controller.play();
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: GestureDetector(
              onTap: () async {
                await _controller.seekTo(Duration.zero);
                _controller.play();
              },
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}