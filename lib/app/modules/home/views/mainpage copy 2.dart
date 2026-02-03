



















































































































































































































































































































       

































































        






     






























































































































































import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
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

class WhiteCircle extends StatefulWidget {
  final int lessonIds;
  const WhiteCircle({super.key, required this.lessonIds});

  @override
  State<WhiteCircle> createState() => _WhiteCircleState();
}

class _WhiteCircleState extends State<WhiteCircle> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchResult(widget.lessonIds);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final degree = controller.result.value?.degree;

      return Container(
        width: 127.8,
        height: 127.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: degree == null
              ? const CircularProgressIndicator()
              : Text(
                 '${degree.toString()}%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 6, 69, 152),
                  ),
                ),
        ),
      );
    });
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
// class GreenHalfCircle extends StatelessWidget {
//   const GreenHalfCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: QuarterCircleClipper(-pi / 2, pi), 
//       child: Container(
//         width: 224.2693,
//         height: 224.2693,      decoration: BoxDecoration( color: Color.fromARGB(255, 39, 114, 83),borderRadius: BorderRadius.circular(5)),
       
//       ),
//     );
//   }
// }



































// class RedQuarterCircle extends StatelessWidget {
//   const RedQuarterCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: QuarterCircleClipper(
//         -pi / 2 + pi + pi / 3, 
//         pi / 2,                
//       ),
//       child: Container(
//         width: 196.5458,
//         height: 196.5458,
//             decoration: BoxDecoration( color: Color.fromARGB(255, 244, 67, 54), borderRadius: BorderRadius.circular(5)),
//       ),
//     );
//   }
// }

// class YellowArc extends StatelessWidget {
//   const YellowArc({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: QuarterCircleClipper(
        
//         -pi / 2 + pi, 
//         pi / 3,       
//       ),
//       child: Container(
//       decoration: BoxDecoration(   color: Color.fromARGB(255, 242, 195, 42),borderRadius: BorderRadius.circular(5)),  width: 210.1,
//         height: 210.1,
     
//       ),
//     );
//   }
// }


































































class YellowArc extends StatelessWidget {
  final double startPercent;
  final double percent;

  const YellowArc({
    super.key,
    required this.startPercent,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
        -pi / 2 + 2 * pi * startPercent,
        2 * pi * percent,
      ),
      child: Container(
        width: 210.1,
        height: 210.1,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 242, 195, 42),
        ),
      ),
    );
  }
}


class RedQuarterCircle extends StatelessWidget {
  final double startPercent;
  final double percent;

  const RedQuarterCircle({
    super.key,
    required this.startPercent,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
        -pi / 2 + 2 * pi * startPercent,
        2 * pi * percent,
      ),
      child: Container(
        width: 196.5458,
        height: 196.5458,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 67, 54),
        ),
      ),
    );
  }
}


class GreenHalfCircle extends StatelessWidget {
  final double percent;  final double startPercent; // 0.0 → 1.0
  const GreenHalfCircle({super.key, required this.percent,required this.startPercent});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
       -pi / 2 + 2 * pi * startPercent,
        2 * pi * percent,
      ),
      child: Container(
        width: 224.2693,
        height: 224.2693,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 39, 114, 83),
        ),
      ),
    );
  }
}
