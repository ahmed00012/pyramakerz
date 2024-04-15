

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/trv9_44up_210408.jpg',height: 1.sh,
      width: 1.sw,fit: BoxFit.fill,);
  }
}
