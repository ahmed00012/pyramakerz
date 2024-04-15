

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragTargetWidget extends StatefulWidget {
  final int correctData;
  final VoidCallback? onSuccess;
  final VoidCallback? onTap;
  final String img;
  final bool whiteImg;
  const DragTargetWidget({Key? key, required this.correctData, this.onSuccess,
    required this.img, this.whiteImg = false,this.onTap}) : super(key: key);

  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.9);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        ),
      ),
      child: InkWell(
        onTap: (){
          _controller.forward().then((_) {
            _controller.reverse();
          });
          widget.onTap?.call();
        },
        child: DragTarget<int>(
          builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
              ) {
            return  ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset( widget.img,
                height: 0.2.sh,width: 0.2.sw,fit: BoxFit.fill,color: widget.whiteImg? Colors.white : null,),
            );
          },
          onAcceptWithDetails: (DragTargetDetails<int> details) async{
            if(details.data == widget.correctData) {
            widget.onSuccess?.call();
            }

          },
        ),
      ),
    );
  }
}
