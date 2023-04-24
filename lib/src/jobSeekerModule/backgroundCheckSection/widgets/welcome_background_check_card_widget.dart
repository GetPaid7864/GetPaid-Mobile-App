import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class WelcomeBackgroundCheckCardWidget extends StatelessWidget {
  final String numberImage;
  final String titleText;
  final String descText;
  final VoidCallback onTap;

  const WelcomeBackgroundCheckCardWidget({
    super.key,
    required this.numberImage,
    required this.titleText,
    required this.descText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // height: 100,
          color: AppColors.whitecolor,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 2,
            color: AppColors.whitecolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: Row(
                children: [
                  SvgPicture.asset(
                    numberImage,
                    height: 55,
                    width: 55,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titleText,
                        style: fontW7S12(context)!.copyWith(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          descText,
                          style: fontW4S12(context)!.copyWith(
                              fontSize: 13, color: AppColors.greyColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
