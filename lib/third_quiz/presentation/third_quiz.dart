import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers/third_quiz/presentation/widgets/single_question.dart';
import '../../widgets/background.dart';
import '../../widgets/stars_row.dart';
import '../../widgets/title_widget.dart';
import '../provider/third_quiz_provider.dart';

class ThirdQuizScreen extends StatelessWidget {
  const ThirdQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThirdQuizProvider>(
          builder: (context, thirdQuizProvider, child) {
          return Stack(
            children: [
              const BackgroundWidget(),
              StarsRow(
                firstStar: thirdQuizProvider.firstStar,
                secondStar: thirdQuizProvider.secondStar,
                thirdStar: thirdQuizProvider.thirdStar,
              ),

              if (!thirdQuizProvider.thirdStar)
                const TitleWidget(title:'How many box ?',),
              if (!thirdQuizProvider.firstStar)
              QuizQuestion(
                exampleNumber: 2,
                desireNumber: 3,
                choices: [5,2,3],
                onSuccess: (){
                  thirdQuizProvider.onChooseCorrect(context: context,first: true);
                },
              ),

              if (!thirdQuizProvider.secondStar && thirdQuizProvider.firstStar)
                QuizQuestion(
                  exampleNumber: 6,
                  desireNumber: 5,
                  choices: [6,7,5],
                  onSuccess: (){
                    thirdQuizProvider.onChooseCorrect(context: context,second: true);
                  },
                ),
              if (thirdQuizProvider.firstStar && thirdQuizProvider.secondStar && !thirdQuizProvider.thirdStar)
                QuizQuestion(
                  exampleNumber: 2,
                  desireNumber: 4,
                  choices: [4,2,6],
                  onSuccess: (){
                    thirdQuizProvider.onChooseCorrect(context: context,third: true);
                  },
                ),
              if (thirdQuizProvider.firstStar && thirdQuizProvider.secondStar && thirdQuizProvider.thirdStar)
                Lottie.asset(
                  'assets/win.json',
                  height: 1.sh,
                  width: 1.sw,
                  fit: BoxFit.fill,
                ),
            ],
          );
        }
      ),
    );
  }
}
