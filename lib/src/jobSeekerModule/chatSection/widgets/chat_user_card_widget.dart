import 'package:flutter/material.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class JobSeekerChatUserCardWidget extends StatelessWidget {
  const JobSeekerChatUserCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: AppColors.lightGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/avatarpng.png",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Sohaib",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Hi How are you?Where are you",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: AppColors.blackColor.withOpacity(0.4)),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(33),
                          color: AppColors.appcolor.withOpacity(0.6)),
                      child: Center(
                        child: Text(
                          "2",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: AppColors.whitecolor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "2 min agp",
                      style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: AppColors.greyColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
