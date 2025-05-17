import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';

class CustomRating extends StatefulWidget {
  final String name;
  final int value;
  final int maxValue;
  final Color backgroundColor;
  final Color valueColor;
  final double width;
  final double height;

  const CustomRating({
    super.key,
    required this.name,
    required this.value,
    required this.maxValue,
    this.backgroundColor = kGrey03,
    this.valueColor = kGreen,
    this.width = 150,
    this.height = 20,
  });

  @override
   createState() => _CustomRatingState();
}

class _CustomRatingState extends State<CustomRating> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: k2sec,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: widget.value / widget.maxValue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: kBlack),
        ),
        const SizedBox(height: kSize10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CustomPaint(
                  painter: _LinearProgressPainter(
                    _animation.value,
                    widget.maxValue,
                    widget.backgroundColor,
                    widget.valueColor,
                  ),
                  child: SizedBox(width: widget.width, height: widget.height),
                );
              },
            ),
            const SizedBox(width: 20),
            Text(
              '${widget.value}/${widget.maxValue}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LinearProgressPainter extends CustomPainter {
  final double progress;
  final int maxItems;
  final Color backgroundColor;
  final Color progressColor;
  late List<Color> gradientColors = [kGrey03, kGrey03];

  _LinearProgressPainter(
      this.progress,
      this.maxItems,
      this.backgroundColor,
      this.progressColor,
      );

  @override
  void paint(Canvas canvas, Size size) {


    if (progress > 0.1 && progress < 0.3) {
      gradientColors = [kGrey02, kRed];
    }

    if (progress > 0.3 && progress < 0.7) {
      gradientColors = [kGrey02, kYellow];
    }
    if (progress > 0.7 || progress == 1) {
      gradientColors = [kGrey02, kGreen];
    }

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final backgroundRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(10),
    );
    canvas.drawRRect(backgroundRRect, backgroundPaint);

    final progressWidth = size.width * progress;

    final gradient = LinearGradient(
      colors: gradientColors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final valuePaint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, progressWidth, size.height))
      ..style = PaintingStyle.fill;

    final progressRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, progressWidth, size.height),
      const Radius.circular(10),
    );
    canvas.drawRRect(progressRRect, valuePaint);
  }

  @override
  bool shouldRepaint(_LinearProgressPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        maxItems != oldDelegate.maxItems ||
        backgroundColor != oldDelegate.backgroundColor ||
        progressColor != oldDelegate.progressColor;
  }
}
