import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraggableWidget extends StatefulWidget {
  final int data;
  final String img;
  final VoidCallback? onTap;
  const DraggableWidget(
      {Key? key, required this.img, required this.data, this.onTap})
      : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget>
    with SingleTickerProviderStateMixin {
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
        onTap: () {
          _controller.forward().then((_) {
            _controller.reverse();
          });
          widget.onTap?.call();
        },
        child: Draggable(
          data: widget.data,
          feedback: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              widget.img,
              height: 0.2.sh,
              width: 0.2.sw,
              fit: BoxFit.fill,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              widget.img,
              height: 0.2.sh,
              width: 0.2.sw,
              fit: BoxFit.fill,
            ),
          ),
          childWhenDragging: SizedBox(
            height: 0.2.sh,
            width: 0.2.sw,
          ),
        ),
      ),
    );
  }
}
