import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../base_provider.dart';
import '../../third_quiz/presentation/third_quiz.dart';
import '../../third_quiz/provider/third_quiz_provider.dart';


class SecondQuizProvider extends BaseProvider {
  static SecondQuizProvider get(BuildContext context) =>
      Provider.of<SecondQuizProvider>(context, listen: false);


  bool firstStar = false;
  bool secondStar = false;
  bool thirdStar = false;

  onDropInTarget(
      {bool? first, bool? second, bool? third, required BuildContext context}) {
    if (first != null) {
      firstStar = true;
      playSound(finish: false);
    } else if (second != null) {
      secondStar = true;
      playSound(finish: false);
    } else if (third != null) {
      thirdStar = true;
      playSound(finish: true);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) =>ChangeNotifierProvider(
                create: (context) => ThirdQuizProvider(),
                child: ThirdQuizScreen())),
                (route) => false);
      });
    }
    notifyListeners();
  }




}
