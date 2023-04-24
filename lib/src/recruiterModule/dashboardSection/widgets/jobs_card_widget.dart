import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class JobCardsWidget extends StatelessWidget {
  const JobCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: AppColors.lightGrey),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Creative UI UX Designer",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,

                        color: AppColors.blackColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "1 min ago",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,

                        color: AppColors.greyColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/images/morevert.svg"),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.greyColor.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Applicants",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,

                        color: AppColors.greyColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "129",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,

                        color: AppColors.blackColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 1,
                  color: AppColors.greyColor.withOpacity(0.4),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Type",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,

                        color: AppColors.greyColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "On-Site",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,

                        color: AppColors.blackColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 1,
                  color: AppColors.greyColor.withOpacity(0.4),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Type",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,

                        color: AppColors.greyColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Full-Time",
                      style: fontW7S12(context)!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,

                        color: AppColors.blackColor.withOpacity(0.8),
                        //decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
