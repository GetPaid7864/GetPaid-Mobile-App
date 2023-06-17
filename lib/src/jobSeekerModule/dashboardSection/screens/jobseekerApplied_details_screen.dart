import 'package:flutter/material.dart';
import 'package:get_paid/commonWidgets/cacheNetworkImageWidget.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/screens/submit_a_proposal_applied_screen.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../models/jobseeker_dashboard_model.dart';

class JobSeekerAppliedJobDetailsScreen extends StatefulWidget {
  final Applied applied;

  const JobSeekerAppliedJobDetailsScreen({Key? key, required this.applied})
      : super(key: key);

  @override
  State<JobSeekerAppliedJobDetailsScreen> createState() =>
      _JobSeekerAppliedJobDetailsScreenState();
}

class _JobSeekerAppliedJobDetailsScreenState
    extends State<JobSeekerAppliedJobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            color: AppColors.blackColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Message",
                          backgroundcolor: AppColors.redColor,
                          horizontalPadding: 0,
                          textfont: 14,
                          onTap: () async {})),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Apply Now",
                          backgroundcolor: AppColors.appcolor,
                          horizontalPadding: 0,
                          textfont: 14,
                          onTap: () {
                            toNext(
                                context: context,
                                widget: SubmitProposalAppliedScreen(
                                  applied: widget.applied,
                                ));
                          }))
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  focalRadius: 0.9,
                  tileMode: TileMode.clamp,
                  colors: [
                    AppColors.lightGrey.withOpacity(0.1),
                    AppColors.appcolor.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Title",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // "Title",
                          widget.applied.jobDetails!.title.toString(),
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Job Description",
                style: fontW7S12(context)!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: widget.applied.jobDetails!.description.toString(),
                      style: fontW3S12(context)!.copyWith(
                          color: AppColors.blackColor.withOpacity(0.6)))),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Posted by",
                style: fontW7S12(context)!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: AppColors.lightGrey),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CacheNetworkImageWidget(
                            imgUrl: "",
                            radius: 13,
                            height: 45,
                            width: 45,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.applied.jobDetails!.postedBy!.name
                                    .toString(),
                                style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.applied.jobDetails!.postedBy!.email
                                    .toString(),
                                style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color:
                                        AppColors.blackColor.withOpacity(0.4)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33),
                            color: AppColors.whitecolor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 19,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.applied.jobDetails!.postedBy!.stars!.length
                                  .toString(),
                              style: fontW7S12(context)!.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Requirements",
                style: fontW7S12(context)!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: AppColors.lightGrey),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                widget.applied.jobDetails!.status.toString(),
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
                                "Budget",
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
                                "\$${widget.applied.jobDetails!.salary}",
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
                                "Job Type",
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
                                widget.applied.jobDetails!.workplace.toString(),
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
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TimeFrame",
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  if (widget.applied.jobDetails!.checkIn == true) ...[
                    Text(
                      "Requires Check-In",
                      style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.appcolor,
                          fontSize: 11),
                    ),
                  ] else ...[
                    Text(
                      "Do Not Requires Check-In",
                      style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.redColor,
                          fontSize: 11),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: AppColors.lightGrey),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Date",
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
                                widget.applied.jobDetails!.dates
                                    .toString()
                                    .replaceAll("00:00:00.000", ""),
                                style: fontW7S12(context)!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,

                                  color: AppColors.blackColor.withOpacity(0.8),
                                  //decoration: TextDecoration.underline
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 1,
                                color: AppColors.greyColor.withOpacity(0.4),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Time",
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,

                                      color:
                                          AppColors.greyColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.applied.jobDetails!.time
                                        .toString()
                                        .replaceAll("TimeOfDay(", "")
                                        .replaceAll(")", ""),
                                    style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,

                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
                                      //decoration: TextDecoration.underline
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Skills Required",
                style: fontW7S12(context)!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 60,
                child: ListView.builder(
                    itemCount: widget.applied.jobDetails!.skills!.length,
                    scrollDirection: Axis.horizontal,
                    // Replace `myList` with your own list of data
                    itemBuilder: (BuildContext context, int index) {
                      // Use the `index` to access the current item in the list
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 32,
                              //width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: AppColors.greyColor.withOpacity(0.2)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Center(
                                  child: Text(
                                    widget.applied.jobDetails!.skills![index]
                                        .toString(),
                                    style: fontW7S12(context)!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
