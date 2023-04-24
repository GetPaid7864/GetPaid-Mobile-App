import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class ShortListedJobCardWidget extends StatelessWidget {
  const ShortListedJobCardWidget({Key? key}) : super(key: key);

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
                        Text(
                          "Wajahat UI UX",
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
                          "mwajahat.038@gmail.com",
                          style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,

                            color: AppColors.greyColor.withOpacity(0.8),
                            //decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1,
                              color: AppColors.greyColor.withOpacity(0.3))),
                      child: Icon(Icons.bookmark_border),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/images/morevert.svg"),
                  ],
                ),
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
                      "Experience",
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
                      "2 Years",
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
                      "Contact",
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
                      "+92236372736",
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
                      "Rating",
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
                      "5 star",
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
