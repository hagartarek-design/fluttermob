

























































































































































import 'dart:math';

import 'package:flutter/material.dart';
class GreyCircle extends StatelessWidget {
  const GreyCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178.9506,
      height: 178.9506,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
    );
  }
}

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.8219,
      height: 127.8219,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class QuarterCircleClipper extends CustomClipper<Path> {
  final double startAngle;
  final double sweepAngle;
  QuarterCircleClipper(this.startAngle, this.sweepAngle);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height / 2);
    path.arcTo(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
class GreenHalfCircle extends StatelessWidget {
  const GreenHalfCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(-pi / 2, pi), 
      child: Container(
        width: 224.2693,
        height: 224.2693,      decoration: BoxDecoration( color: Colors.green,borderRadius: BorderRadius.circular(5)),
       
      ),
    );
  }
}



































class RedQuarterCircle extends StatelessWidget {
  const RedQuarterCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
        -pi / 2 + pi + pi / 3, 
        pi / 2,                
      ),
      child: Container(
        width: 196.5458,
        height: 196.5458,
            decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}

class YellowArc extends StatelessWidget {
  const YellowArc({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
        
        -pi / 2 + pi, 
        pi / 3,       
      ),
      child: Container(
      decoration: BoxDecoration(   color: Colors.yellow,borderRadius: BorderRadius.circular(5)),  width: 210.1,
        height: 210.1,
     
      ),
    );
  }
}
