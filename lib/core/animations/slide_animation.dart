import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/domain/enum/slide_direction_enum.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final bool isEven;
  final SlideDirection direction;
  final Duration? duration;

  const SlideAnimation({
    super.key,
    required this.child,
    this.isEven = false,
    this.direction = SlideDirection.leftToRight,
    this.duration = k1sec,
  });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: widget.duration)..forward();

    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.0, 1.0, curve: Curves.easeInOut)));

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.3, 1.0, curve: Curves.easeInOut)));

    switch (widget.direction) {
      case SlideDirection.leftToRight:
        slideAnimation = Tween<Offset>(
          begin: widget.isEven ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 1.0, curve: Curves.easeInOut)));
        break;
      case SlideDirection.rightToLeft:
        slideAnimation = Tween<Offset>(
          begin: widget.isEven ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 1.0, curve: Curves.easeInOut)));
        break;
      case SlideDirection.topToBottom:
        slideAnimation = Tween<Offset>(
          begin: widget.isEven ? const Offset(0.0, -1.0) : const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 1.0, curve: Curves.easeInOut)));
        break;
      case SlideDirection.bottomToTop:
        slideAnimation = Tween<Offset>(
          begin: widget.isEven ? const Offset(0.0, 1.0) : const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 1.0, curve: Curves.easeInOut)));
        break;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(position: slideAnimation, child: ScaleTransition(scale: scaleAnimation, child: widget.child)),
    );
  }
}
