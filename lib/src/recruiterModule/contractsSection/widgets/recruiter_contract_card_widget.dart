import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/commonWidgets/cacheNetworkImageWidget.dart';
import 'package:get_paid/helpers/date_formatter.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

import 'package:get_paid/src/jobSeekerModule/dashboardSection/screens/jobseeker_job_details_screen.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/screens/submit_a_proposal_Screen.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../models/recruiter_contracts_model.dart';

class RecruiterContractCardsWidget extends StatefulWidget {
  final All all;

  const RecruiterContractCardsWidget({
    Key? key,
    required this.all,
  }) : super(key: key);

  @override
  State<RecruiterContractCardsWidget> createState() =>
      _RecruiterContractCardsWidgetState();
}

class _RecruiterContractCardsWidgetState
    extends State<RecruiterContractCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // toNext(
        //     context: context,
        //     widget: JobSeekerJobDetailsScreen(
        //       recentJob: widget.all,
        //     ));
      },
      child: Container(
        // height: 260,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: AppColors.lightGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        widget.all.jobDetails!.title.toString(),
                        //   "",
                        //"Creative UI UX Designer",
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
                      Row(
                        children: [
                          Text(
                            // "",
                            // widget.all.jobDetails!.createdAt!
                            //     .format("Y-M-d   h:i A"),
                            "Fixed Price: \$${widget.all.jobDetails!.salary}",
                            style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,

                              color: AppColors.appcolor.withOpacity(0.8),
                              //decoration: TextDecoration.underline
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            DateFormatter.dateFormatter(
                                widget.all.jobDetails!.createdAt!),
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  CacheNetworkImageWidget(
                      imgUrl: widget.all.proposedBy!.photo.toString(),
                      radius: 13),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.all.proposedBy!.personalInfo!.firstName} ${widget.all.proposedBy!.personalInfo!.lastName}",
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
                        widget.all.proposedBy!.email.toString(),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Last CheckIn",
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
                        // "",
                        DateFormatter.dateFormatter(
                            widget.all.timesheets!.last.date!),
                        // widget.active.status.toString(),
                        style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,

                          // color: widget.recentJob.status.toString() == "Active"
                          //     ? AppColors.appcolor
                          //     : AppColors.redColor,
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
                        height: 3,
                      ),
                      Text(
                        "Time Frame",
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
                        // "",
                        widget.all.jobDetails!.time!
                            .replaceAll("TimeOfDay(", "")
                            .replaceAll(")", ""),
                        // widget.active.jobLocation.toString(),
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
            ),
          ],
        ),
      ),
    );
  }
}
