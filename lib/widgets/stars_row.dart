import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class StarsRow extends StatelessWidget {
  final bool firstStar;
  final bool secondStar;
  final bool thirdStar;
  const StarsRow(
      {Key? key,
      this.firstStar = false,
      this.secondStar = false,
      this.thirdStar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            RoundCheckBox(
              onTap: (value) {},
              isChecked: firstStar,
              border: Border(),
              uncheckedColor: Colors.transparent,
              checkedColor: Colors.transparent,
              uncheckedWidget: Image.asset(
                'assets/star.png',
                height: 35,
                width: 35,
                fit: BoxFit.fill,
              ),
              checkedWidget: Image.asset(
                'assets/star(1).png',
                height: 35,
                width: 35,
                fit: BoxFit.fill,
              ),
            ),
            // ScaleTransition(
            //   scale: Tween(begin: 0.7, end: 1.0).animate(
            //       CurvedAnimation(parent: _firstController, curve: Curves.easeOut)),
            //   child: Image.asset(
            //     (widget.firstStar || widget.secondStar || widget.thirdStar)?
            //     'assets/star(1).png' :  'assets/star.png',
            //     height: 35,width: 35,fit: BoxFit.fill,),
            // ),
            SizedBox(
              width: 5.w,
            ),
            // Padding(
            //   padding:  EdgeInsets.only(bottom: 15.h),
            //   child:  ScaleTransition(
            //     scale: Tween(begin: 0.7, end: 1.0).animate(
            //         CurvedAnimation(parent: _secondController, curve: Curves.easeOut)),
            //     child: Image.asset(
            //       (widget.firstStar && widget.secondStar) || (widget.firstStar && widget.thirdStar)
            //           || (widget.secondStar && widget.thirdStar) ?
            //       'assets/star(1).png':
            //       'assets/star.png',height: 35,width: 35,fit: BoxFit.fill,),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: RoundCheckBox(
                onTap: (value) {},
                isChecked: secondStar,
                border: Border(),
                uncheckedColor: Colors.transparent,
                checkedColor: Colors.transparent,
                uncheckedWidget: Image.asset(
                  'assets/star.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.fill,
                ),
                checkedWidget: Image.asset(
                  'assets/star(1).png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),

            RoundCheckBox(
              onTap: (value) {},
              isChecked: thirdStar,
              border: Border(),
              uncheckedColor: Colors.transparent,
              checkedColor: Colors.transparent,
              uncheckedWidget: Image.asset(
                'assets/star.png',
                height: 35,
                width: 35,
                fit: BoxFit.fill,
              ),
              checkedWidget: Image.asset(
                'assets/star(1).png',
                height: 35,
                width: 35,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
