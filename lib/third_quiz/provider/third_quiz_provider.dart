import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../base_provider.dart';
import '../../first_quiz/peresentation/first_quiz_screen.dart';
import '../../first_quiz/provider/first_quiz_provider.dart';


class ThirdQuizProvider extends BaseProvider {
  static ThirdQuizProvider get(BuildContext context) =>
      Provider.of<ThirdQuizProvider>(context, listen: false);

  bool firstStar = false;
  bool secondStar = false;
  bool thirdStar = false;

  onChooseCorrect(
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
            MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                    create: (context) => FirstQuizProvider(),
                    child: FirstQuizScreen())),
            (route) => false);
      });
    }
    notifyListeners();
  }
}
