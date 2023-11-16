import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class insightScreen extends StatelessWidget {
  const insightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double a = 3 * math.pi / 2;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              startAngle: 3 * math.pi / 2,
              endAngle: 7 * math.pi / 2,
              tileMode: TileMode.repeated,
              colors: [
                lemonColor,
                redColor,
                Colors.transparent
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: backgroundColor,
              child: Text(a.toString(), style: TextStyle(color: textColor)),
            ),
          ),
          // child:
        ),
      ),
    );
  }
}
