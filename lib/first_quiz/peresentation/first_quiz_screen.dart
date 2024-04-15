import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers/widgets/drag_target_widget.dart';
import 'package:pyramakers/widgets/draggable_widget.dart';
import '../../widgets/background.dart';
import '../../widgets/stars_row.dart';
import '../../widgets/title_widget.dart';
import '../provider/first_quiz_provider.dart';

class FirstQuizScreen extends StatelessWidget {
  const FirstQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FirstQuizProvider>(
          builder: (context, firstQuizProvider, child) {
        return Stack(
          children: [
            const BackgroundWidget(),
            StarsRow(
              firstStar: firstQuizProvider.firstStar,
              secondStar: firstQuizProvider.secondStar,
              thirdStar: firstQuizProvider.thirdStar,
            ),
            if (!firstQuizProvider.thirdStar)
            const TitleWidget(title:'Help ducks find their box',),

            if (!firstQuizProvider.thirdStar)
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DragTargetWidget(
                        correctData: 1,
                        img: 'assets/PicsArt_04-12-11.15.53.png',
                        onTap: (){
                          firstQuizProvider.playSound(sound: 'assets/sounds/red2.mp3');
                        },
                        onSuccess: () {
                          firstQuizProvider.onDropInTarget(
                              red: true, context: context);
                        },
                      ),
                      DragTargetWidget(
                        correctData: 2,
                        img: 'assets/PicsArt_04-12-11.16.32.png',
                        onTap: (){
                          firstQuizProvider.playSound(sound: 'assets/sounds/yellow.mp3');
                        },
                        onSuccess: () {
                          firstQuizProvider.onDropInTarget(
                              yellow: true, context: context);
                        },
                      ),
                      DragTargetWidget(
                        correctData: 3,
                        img: 'assets/1712956482489.png',
                        onTap: (){
                          firstQuizProvider.playSound(sound: 'assets/sounds/blue.mp3');
                        },
                        onSuccess: () {
                          firstQuizProvider.onDropInTarget(
                              blue: true, context: context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      firstQuizProvider.redAccepted
                          ? SizedBox(
                              height: 0.2.sh,
                              width: 0.2.sw,
                            )
                          : DraggableWidget(
                              data: 1,
                              img: 'assets/PicsArt_04-12-11.13.24.png',
                        onTap: (){
                          firstQuizProvider.playSound(sound: 'assets/sounds/red2.mp3');
                        },
                            ),
                      firstQuizProvider.blueAccepted
                          ? SizedBox(
                              height: 0.2.sh,
                              width: 0.2.sw,
                            )
                          : DraggableWidget(
                              data: 3,
                              img: 'assets/PicsArt_04-12-11.12.58.png',
                        onTap: (){
                          firstQuizProvider.playSound(sound: 'assets/sounds/blue.mp3');
                        },
                            ),
                      firstQuizProvider.yellowAccepted
                          ? SizedBox(
                              height: 0.2.sh,
                              width: 0.2.sw,
                            )
                          : DraggableWidget(
                              data: 2,
                              img: 'assets/1712956333586.png',
                        onTap: (){
                          firstQuizProvider.playSound(sound: 'assets/sounds/yellow.mp3');
                        },
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                ],
              ),
            if (firstQuizProvider.blueAccepted &&
                firstQuizProvider.yellowAccepted &&
                firstQuizProvider.redAccepted)
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
