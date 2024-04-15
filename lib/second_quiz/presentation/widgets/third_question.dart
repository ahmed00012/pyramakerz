import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakers/widgets/drag_target_widget.dart';
import 'package:pyramakers/widgets/draggable_widget.dart';

class ThirdQuestion extends StatelessWidget {
  final VoidCallback onSuccess;
  final Function(String)? onTapNumber;
  const ThirdQuestion({Key? key, required this.onSuccess, this.onTapNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DraggableWidget(
              img: 'assets/1712956648741.png',
              data: 1,
              onTap: () {
                onTapNumber?.call('assets/sounds/four.mp3');
              },
            ),
            DraggableWidget(
              img: 'assets/1712956788101.png',
              data: 2,
              onTap: () {
                onTapNumber?.call('assets/sounds/three.mp3');
              },
            ),
            DraggableWidget(
              img: 'assets/1712956761174.png',
              data: 3,
              onTap: () {
                onTapNumber?.call('assets/sounds/seven.mp3');
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
            InkWell(
              onTap: () {
                onTapNumber?.call('assets/sounds/three.mp3');
              },
              child: Image.asset(
                'assets/three(2).png',
                height: 0.15.sh,
                width: 0.1.sw,
                fit: BoxFit.fill,
                color: Colors.yellow,
              ),
            ),
            Image.asset(
              'assets/plus.png',
              height: 0.15.sh,
              width: 0.1.sw,
              fit: BoxFit.fill,
            ),
            InkWell(
              onTap: () {
                onTapNumber?.call('assets/sounds/four.mp3');
              },
              child: Image.asset(
                'assets/four.png',
                height: 0.15.sh,
                width: 0.1.sw,
                fit: BoxFit.fill,
                color: Colors.yellow,
              ),
            ),
            Image.asset(
              'assets/equal.png',
              height: 0.15.sh,
              width: 0.1.sw,
              fit: BoxFit.fill,
            ),
            DragTargetWidget(
              correctData: 3,
              img: 'assets/1712956761174.png',
              onSuccess: onSuccess,
              whiteImg: true,
            )
          ],
        ),
        SizedBox(
          height: 0.08.sw,
        ),
      ],
    );
  }
}
