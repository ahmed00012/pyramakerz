import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers/second_quiz/provider/second_quiz_provider.dart';
import '../../base_provider.dart';
import '../../second_quiz/presentation/second_quiz.dart';

class FirstQuizProvider extends BaseProvider {
  static FirstQuizProvider get(BuildContext context) =>
      Provider.of<FirstQuizProvider>(context, listen: false);
  bool redAccepted = false;
  bool blueAccepted = false;
  bool yellowAccepted = false;

  bool firstStar = false;
  bool secondStar = false;
  bool thirdStar = false;

  onDropInTarget(
      {bool? red, bool? yellow, bool? blue, required BuildContext context}) {
    if (red != null)
      redAccepted = true;
    else if (yellow != null)
      yellowAccepted = true;
    else if (blue != null) blueAccepted = true;

    colorStar(context);
    notifyListeners();
  }

  colorStar(BuildContext context) {
    if (yellowAccepted || redAccepted || blueAccepted) {
      firstStar = true;
      if (!(redAccepted && yellowAccepted && blueAccepted))
        playSound(finish: false);
    }
    if ((yellowAccepted && redAccepted) ||
        (yellowAccepted && blueAccepted) ||
        (redAccepted && blueAccepted)) {
      secondStar = true;
      if (!(redAccepted && yellowAccepted && blueAccepted))
      playSound(finish: false);
    }

    if (redAccepted && yellowAccepted && blueAccepted) {
      thirdStar = true;
      playSound(finish: true);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => ChangeNotifierProvider(
                create: (context) => SecondQuizProvider(),
                child: SecondQuizScreen())),
            (route) => false);
      });
    }
  }


}
