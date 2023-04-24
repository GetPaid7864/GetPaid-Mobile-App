import 'package:flutter/material.dart';

class CustomStepperWidget extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const CustomStepperWidget({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color1),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color2),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color3),
          ),
        ),
      ],
    );
  }
}
