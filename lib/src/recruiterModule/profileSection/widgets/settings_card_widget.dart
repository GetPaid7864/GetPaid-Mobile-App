import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class SettingsCardWidget extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;

  const SettingsCardWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(icon),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        text,
                        style: fontW4S12(context)!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: AppColors.blackColor.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.greyColor.withOpacity(0.4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
