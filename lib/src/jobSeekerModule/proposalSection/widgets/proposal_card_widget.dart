import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/date_formatter.dart';
import 'package:readmore/readmore.dart';

import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../models/jobseeker_proposal_model.dart';
import '../screens/proposal_details_screen.dart';

class JobSeekerProposalsCardsWidget extends StatefulWidget {
  final All applied;

  const JobSeekerProposalsCardsWidget({
    Key? key,
    required this.applied,
  }) : super(key: key);

  @override
  State<JobSeekerProposalsCardsWidget> createState() =>
      _JobSeekerProposalsCardsWidgetState();
}

class _JobSeekerProposalsCardsWidgetState
    extends State<JobSeekerProposalsCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toNext(
            context: context,
            widget: JobSeekerProposalDetailsScreen(
              all: widget.applied,
            ));
      },
      child: Container(
        // height: 270,
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
                        widget.applied.jobDetails!.title.toString(),
                        //   "",
                        // "Creative UI UX Designer",
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
                            // widget.active.createdAt!.format("Y-M-d   h:i A"),
                            "Fixed Price: \$${widget.applied.jobDetails!.salary}",
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
                                widget.applied.createdAt!),
                            //"1 min ago",
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Cover Letter",
                style: fontW7S12(context)!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,

                  color: AppColors.greyColor.withOpacity(0.8),
                  //decoration: TextDecoration.underline
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 12),
            //     child: RichText(
            //         text: TextSpan(
            //       style: fontW7S12(context)!.copyWith(
            //         fontWeight: FontWeight.w400,
            //         fontSize: 12,
            //         color: AppColors.blackColor.withOpacity(0.7),
            //       ),
            //       text: widget.applied.coverLetter.toString(),
            //     ))
            //     //"We are looking for a Creative UI UX Designer who can  looking landing page to an elegant and modern User Interface.")),
            //     ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ReadMoreText(
                widget.applied.coverLetter.toString(),
                trimLines: 2,
                style: fontW7S12(context)!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.blackColor.withOpacity(0.7)),
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                        widget.applied.status.toString(),
                        // widget.active.status.toString(),
                        style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,

                          color: widget.applied.status.toString() == "Active"
                              ? AppColors.appcolor
                              : AppColors.redColor,
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
                        height: 6,
                      ),
                      Text(
                        widget.applied.jobDetails!.workplace.toString(),
                        // widget.active.workplace.toString(),
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
                        widget.applied.jobDetails!.jobLocation.toString(),
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
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.greyColor.withOpacity(0.4),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButtonWidget(
                        buttonHeight: 42,
                        text: "Message",
                        radius: 23,
                        backgroundcolor: AppColors.cyanColor,
                        bordercolor: AppColors.cyanColor,
                        textfont: 12,
                        textcolor: AppColors.blackColor,
                        horizontalPadding: 0,
                        onTap: () {}),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: CommonButtonWidget(
                        buttonHeight: 42,
                        text: "Withdraw",
                        radius: 23,
                        textfont: 12,
                        backgroundcolor: AppColors.redColor,
                        horizontalPadding: 0,
                        bordercolor: AppColors.redColor,
                        onTap: () {
                          // toNext(
                          //     context: context,
                          //     widget: SubmitProposalAppliedScreen(
                          //       applied: widget.applied,
                          //     ));
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
