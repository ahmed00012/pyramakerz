
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class QuizQuestion extends StatefulWidget {
 final int exampleNumber;
 final int desireNumber;
 final VoidCallback onSuccess;
 final List<int> choices;
  const QuizQuestion({Key? key,required this.exampleNumber,required this.desireNumber,
    required this.onSuccess,
  required this.choices}) : super(key: key);

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  int? currentChoice;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  children: List.generate(
                      widget.exampleNumber~/2,
                          (index) => Row(
                        children: [
                          Image.asset(
                            'assets/square.png',
                            height: 0.08.sh,
                            fit: BoxFit.fill,
                            color: Colors.yellow,
                          ),
                          Image.asset(
                            'assets/square.png',
                            height: 0.08.sh,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 0.12.sh,
                  width: 0.12.sh,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.green,
                      border: Border.all(color: Colors.yellow)),
                  child: Center(
                    child: Text(widget.exampleNumber.toString(),
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w900,
                            fontSize: 0.03.sw)),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: List.generate(
                      widget.desireNumber,
                          (index) => Row(
                        children: [
                          Image.asset(
                            'assets/square.png',
                            height: 0.08.sh,
                            fit: BoxFit.fill,
                            color:
                            index % 2 != 0 ? Colors.yellow : null,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 0.12.sh,
                  width: 0.12.sh,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.green,
                      border: Border.all(color: Colors.yellow)),
                  child: Center(
                    child: Text(
                        '${currentChoice ?? '?'}',
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w900,
                            fontSize: 0.03.sw)),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 60.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.choices.map((e) => Row(
            children: [
              RoundCheckBox(
                border: Border.all(color: Colors.orange, width: 5),
                checkedColor: Colors.orange,
                isChecked: currentChoice == e,
                uncheckedColor: Colors.transparent,
                onTap: (selected) {
                  setState(() {
                    currentChoice = e;
                  });
                  if(currentChoice == widget.desireNumber){
                    widget.onSuccess();
                    setState(() {
                      currentChoice = null;
                    });
                  }
                },
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                e.toString(),
                style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 0.045.sw),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          )).toList(),
        ),
        SizedBox(
          height: 0.08.sw,
        ),
      ],
    );
  }
}
