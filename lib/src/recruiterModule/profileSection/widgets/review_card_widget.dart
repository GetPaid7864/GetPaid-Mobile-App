import 'package:flutter/material.dart';
import 'package:get_paid/src/recruiterModule/profileSection/models/recruiter_profile_model.dart';
import 'package:get_paid/src/recruiterModule/profileSection/widgets/rating_bar_widget.dart';

import '../../../../commonWidgets/cacheNetworkImageWidget.dart';
import '../../../../helpers/date_formatter.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class ReviewCardWidget extends StatelessWidget {
  final Review review;

  const ReviewCardWidget({Key? key, required this.review}) : super(key: key);

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
                    CacheNetworkImageWidget(
                      imgUrl: review.jobseekers!.photo.toString(),
                      radius: 13,
                      height: 50,
                      width: 50,
                    ),
                    // Image.asset(
                    //   "assets/images/avatarpng.png",
                    //   height: 40,
                    //   width: 40,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBarWidget(
                          itemCount: review.rating!,
                          onRatingUpdate: (value) {},
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Wajahat UI UX",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          review.comment.toString(),
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: AppColors.blackColor.withOpacity(0.4)),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormatter.dateFormatter(review.createdAt!).toString(),
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
