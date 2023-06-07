import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/recruiterModule/jobSection/models/recruiter_all_jobs_model.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class JobCardsWidget extends StatefulWidget {
  final RecruiterAllJobsDatum recruiterAllJobsDatum;

  const JobCardsWidget({Key? key, required this.recruiterAllJobsDatum})
      : super(key: key);

  @override
  State<JobCardsWidget> createState() => _JobCardsWidgetState();
}

class _JobCardsWidgetState extends State<JobCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: AppColors.lightGrey),
      child: Column(
        children: [
          const SizedBox(
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
                      widget.recruiterAllJobsDatum.title.toString(),
                      //   "",
                      //  "Creative UI UX Designer",
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
                      widget.recruiterAllJobsDatum.createdAt!
                          .format("Y-M-d   h:i A"),
                      // "1 min ago",
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
                      "Status",
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
                      widget.recruiterAllJobsDatum.status.toString(),
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
                      widget.recruiterAllJobsDatum.workplace.toString(),
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
                      "Job Location",
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
                      widget.recruiterAllJobsDatum.jobLocation.toString(),
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
