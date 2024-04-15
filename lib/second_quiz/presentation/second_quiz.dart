import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers/second_quiz/presentation/widgets/first_question.dart';
import 'package:pyramakers/second_quiz/presentation/widgets/second_question.dart';
import 'package:pyramakers/second_quiz/presentation/widgets/third_question.dart';
import 'package:pyramakers/widgets/background.dart';

import '../../widgets/stars_row.dart';
import '../../widgets/title_widget.dart';
import '../provider/second_quiz_provider.dart';

class SecondQuizScreen extends StatelessWidget {
  const SecondQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SecondQuizProvider>(
          builder: (context, secondQuizProvider, child) {
        return Stack(
          children: [
            const BackgroundWidget(),
            StarsRow(
              firstStar: secondQuizProvider.firstStar,
              secondStar: secondQuizProvider.secondStar,
              thirdStar: secondQuizProvider.thirdStar,
            ),
            if (!secondQuizProvider.thirdStar)
              const TitleWidget(
                title: 'Find the correct answer',
              ),
            if (!secondQuizProvider.firstStar)
              FirstQuestion(
                onSuccess: () {
                  secondQuizProvider.onDropInTarget(
                      context: context, first: true);
                },
                onTapNumber: (number) {
                  secondQuizProvider.playSound(sound: number);
                },
              ),
            if (!secondQuizProvider.secondStar && secondQuizProvider.firstStar)
              SecondQuestion(
                onSuccess: () {
                  secondQuizProvider.onDropInTarget(
                      context: context, second: true);
                },
                onTapNumber: (number) {
                  secondQuizProvider.playSound(sound: number);
                },
              ),
            if (secondQuizProvider.firstStar &&
                secondQuizProvider.secondStar &&
                !secondQuizProvider.thirdStar)
              ThirdQuestion(
                onSuccess: () {
                  secondQuizProvider.onDropInTarget(
                      context: context, third: true);
                },
                onTapNumber: (number) {
                  secondQuizProvider.playSound(sound: number);
                },
              ),
            if (secondQuizProvider.firstStar &&
                secondQuizProvider.secondStar &&
                secondQuizProvider.thirdStar)
              Lottie.asset(
                'assets/win.json',
                height: 1.sh,
                width: 1.sw,
                fit: BoxFit.fill,
              ),
          ],
        );
      }),
    );
  }
}
