import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class LanguageViewCardWidget extends StatelessWidget {
  final String language;
  final String fluency;
  final VoidCallback onTap;

  const LanguageViewCardWidget(
      {Key? key,
      required this.language,
      required this.fluency,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: AppColors.lightGrey),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.textfieldColor),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/language.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language,
                      style: fontW7S12(context)!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      fluency,
                      style: fontW7S12(context)!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.appcolor),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
