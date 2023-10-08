import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoplay extends StatefulWidget {
  String url;
  videoplay({
    required this.url,
  });

  @override
  State<videoplay> createState() => _videoplayState(
        url: url,
      );
}

class _videoplayState extends State<videoplay> {
  String url;
  _videoplayState({
    required this.url,
  });
  VideoPlayerController? _controller;

  void initState() {
    _controller = VideoPlayerController.network(
      url,
    )
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => _controller!.play());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller!.value.isInitialized
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  child: VideoPlayer(_controller!),
                ),
                SizedBox(
                  height: 20,
                ),
                VideoProgressIndicator(
                  _controller!,
                  allowScrubbing: true,
                  padding: EdgeInsets.only(top: 5.0),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
    );
  }
}
