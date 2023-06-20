import 'package:flutter/material.dart';

class CustomStepperProfileSetupWidget extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;

  const CustomStepperProfileSetupWidget({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.color5,
    required this.color6,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color1),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color2),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color3),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color4),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color5),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color6),
          ),
        ),
      ],
    );
  }
}
