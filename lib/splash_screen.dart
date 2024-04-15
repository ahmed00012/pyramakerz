import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'first_quiz/peresentation/first_quiz_screen.dart';
import 'first_quiz/provider/first_quiz_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset('assets/EVTVPE30XVJSVGOR.mp4')
          ..initialize().then((_) {
            videoPlayerController.play();
            Future.delayed(Duration(seconds: 6), () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider(
                          create: (context) => FirstQuizProvider(),
                          child: FirstQuizScreen())),
                  (route) => false);
            });
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(
            videoPlayerController,
          ),
        ),
      ),
    );
  }
}
