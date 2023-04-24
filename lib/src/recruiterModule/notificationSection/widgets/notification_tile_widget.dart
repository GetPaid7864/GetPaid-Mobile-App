import 'package:flutter/material.dart';
import 'package:get_paid/utils/theme.dart';

import '../../../../utils/appcolors.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        //height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.lightGrey),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: AppColors.whitecolor),
                        child: const Center(
                          child: Icon(
                            Icons.notifications,
                            color: AppColors.appcolor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Wajhat Just Message You",
                            style: fontW4S12(context)!.copyWith(
                                fontSize: 13,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            height: 27,
                            width: 250,
                            child: RichText(
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                text: TextSpan(
                                  text:
                                      "Creative UI UX Designer Job post was expired.",
                                  style: fontW3S12(context)!.copyWith(
                                      fontSize: 11,
                                      color: AppColors.greyColor,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "23 minutes ago",
                    style: fontW3S12(context)!.copyWith(
                        fontSize: 11,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
