import 'dart:math';
import 'package:flutter/material.dart';

class MeteorAnimation extends StatefulWidget {
  final double width;
  final double height;
  final int meteorCount;
  final double minSpeed;
  final double maxSpeed;
  final double minLength;
  final double maxLength;

  const MeteorAnimation({
    super.key,
    required this.width,
    required this.height,
    this.meteorCount = 8,
    this.minSpeed = 1,
    this.maxSpeed = 3,
    this.minLength = 10,
    this.maxLength = 30,
  });

  @override
  _MeteorAnimationState createState() => _MeteorAnimationState();
}

class _MeteorAnimationState extends State<MeteorAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<Meteor> _meteors = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
      _updateMeteors();
    })
      ..repeat();

    _generateMeteors();
  }

  void _generateMeteors() {
    for (int i = 0; i < widget.meteorCount; i++) {
      _meteors.add(Meteor.random(
        _random,
        widget.width,
        widget.height,
        widget.minSpeed,
        widget.maxSpeed,
        widget.minLength,
        widget.maxLength,
      ));
    }
  }

  void _updateMeteors() {
    for (final meteor in _meteors) {
      meteor.update();
      if (meteor.isOutOfBounds(widget.width, widget.height)) {
        meteor.reset(
          _random,
          widget.width,
          widget.height,
          widget.minSpeed,
          widget.maxSpeed,
          widget.minLength,
          widget.maxLength,
        );
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MeteorPainter(_meteors),
      size: Size(widget.width, widget.height),
    );
  }
}

class Meteor {
  double x;
  double y;
  double length;
  double speed;

  Meteor(this.x, this.y, this.length, this.speed);

  void update() {
    x += speed;
    y += speed;
  }

  void reset(Random random, double maxWidth, double maxHeight, double minSpeed, double maxSpeed, double minLength, double maxLength) {
    x = random.nextDouble() * maxWidth;
    y = -random.nextDouble() * maxHeight;
    length = minLength + random.nextDouble() * (maxLength - minLength);
    speed = minSpeed + random.nextDouble() * (maxSpeed - minSpeed);
  }

  bool isOutOfBounds(double maxWidth, double maxHeight) {
    return x > maxWidth || y > maxHeight;
  }

  static Meteor random(Random random, double maxWidth, double maxHeight, double minSpeed, double maxSpeed, double minLength, double maxLength) {
    final x = random.nextDouble() * maxWidth;
    final y = random.nextDouble() * maxHeight;
    final length = minLength + random.nextDouble() * (maxLength - minLength);
    final speed = minSpeed + random.nextDouble() * (maxSpeed - minSpeed);
    return Meteor(x, y, length, speed);
  }
}

class MeteorPainter extends CustomPainter {
  final List<Meteor> meteors;

  MeteorPainter(this.meteors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (final meteor in meteors) {
      canvas.drawLine(
        Offset(meteor.x, meteor.y),
        Offset(meteor.x - meteor.length, meteor.y - meteor.length),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
