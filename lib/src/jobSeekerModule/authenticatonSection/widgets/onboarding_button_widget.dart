import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appcolors.dart';

class OnBoardingButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const OnBoardingButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(70)),
        child: Center(
          child: SvgPicture.asset(
            "assets/images/nextdoubleicon.svg",
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}
