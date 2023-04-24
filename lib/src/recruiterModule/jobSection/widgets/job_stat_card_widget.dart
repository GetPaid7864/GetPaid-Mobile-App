import 'package:flutter/material.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class JobStatCardWidget extends StatelessWidget {
  final String count;
  final String text;
  final VoidCallback onTap;
  final Color color;

  const JobStatCardWidget({
    super.key,
    required this.count,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      //width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
              width: 1, color: AppColors.greyColor.withOpacity(0.6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              count,
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
