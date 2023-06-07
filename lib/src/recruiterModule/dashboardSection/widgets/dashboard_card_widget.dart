import 'package:flutter/material.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class DashboaedCardWidget extends StatelessWidget {
  final String count;
  final String text;
  final VoidCallback onTap;
  final Color color;

  const DashboaedCardWidget({
    super.key,
    required this.count,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      //width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
              width: 1, color: AppColors.greyColor.withOpacity(0.6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              count,
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 28),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33), color: color),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "View All",
                          style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.blackColor.withOpacity(0.5),
                            //decoration: TextDecoration.underline
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 11,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
