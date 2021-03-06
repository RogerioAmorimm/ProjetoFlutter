import 'package:flutter/material.dart';

enum FadeDirection {
  startToEnd,
  endToStart,
  topToBottom,
  bottomToTop,
}

class FadeIn extends StatefulWidget {
  const FadeIn(
      {required this.child,
      Key? key,
      this.duration = const Duration(microseconds: 1250),
      this.fadeDirection = FadeDirection.startToEnd,
      this.offset = 1.0,
      this.curve = Curves.easeOut})
      : assert(offset > 0),
        super(key: key);

  final FadeDirection fadeDirection;
  final double offset;
  final Widget child;
  final Duration? duration;
  final Curve curve;
  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _updateAnimations();
    _controller.forward();
  }

  void _updateAnimations() {
    Offset begin;
    Offset end;
    final offset = widget.offset;

    switch (widget.fadeDirection) {
      case FadeDirection.startToEnd:
        begin = Offset(-offset, 0);
        end = const Offset(0, 0);
        break;
      case FadeDirection.endToStart:
        begin = Offset(offset, 0);
        end = const Offset(0, 0);
        break;
      case FadeDirection.topToBottom:
        begin = Offset(0, -offset);
        end = const Offset(0, 0);
        break;
      case FadeDirection.bottomToTop:
        begin = Offset(0, offset);
        end = const Offset(0, 0);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: widget.child,
        ),
      );
}
