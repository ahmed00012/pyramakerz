import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
 final String title;
  const TitleWidget({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          padding: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow,width: 5),
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.green,

          ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 0.025.sw,
                color: Colors.yellow,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
