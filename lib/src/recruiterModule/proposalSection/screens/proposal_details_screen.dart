import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/helpers/date_formatter.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/models/recruiter_proposal_model.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/cacheNetworkImageWidget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class RecruiterProposalDetailsScreen extends StatefulWidget {
  final All all;

  const RecruiterProposalDetailsScreen({Key? key, required this.all})
      : super(key: key);

  @override
  State<RecruiterProposalDetailsScreen> createState() =>
      _RecruiterProposalDetailsScreenState();
}

class _RecruiterProposalDetailsScreenState
    extends State<RecruiterProposalDetailsScreen> {
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
                          backgroundcolor: AppColors.whitecolor,
                          textcolor: AppColors.blackColor,
                          horizontalPadding: 0,
                          onTap: () async {})),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Accept",
                          backgroundcolor: AppColors.appcolor,
                          horizontalPadding: 0,
                          onTap: () {}))
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
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
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.maybePop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "Proposal Details",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.blackColor,
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 3,
                        color: AppColors.whitecolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CacheNetworkImageWidget(
                                        imgUrl: widget
                                            .all.jobDetails!.postedBy!.email
                                            .toString(),
                                        radius: 13,
                                        height: 50,
                                        width: 50,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.all.jobDetails!.postedBy!
                                                    .email
                                                    .toString(),
                                                style: fontW7S12(context)!
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,

                                                  color: AppColors.blackColor
                                                      .withOpacity(0.8),
                                                  //decoration: TextDecoration.underline
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                widget.all.jobDetails!.postedBy!
                                                    .phoneNumber
                                                    .toString(),
                                                style: fontW7S12(context)!
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,

                                                  color: AppColors.greyColor
                                                      .withOpacity(0.9),
                                                  //decoration: TextDecoration.underline
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const SizedBox(
                                          //   width: 35,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset("assets/images/morevert.svg")
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: AppColors.greyColor.withOpacity(0.4),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Time Frame",
                                        style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,

                                          color: AppColors.greyColor
                                              .withOpacity(0.8),
                                          //decoration: TextDecoration.underline
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "12:40 AM",
                                        style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,

                                          color: AppColors.blackColor,
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
                                        "Check In",
                                        style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,

                                          color: AppColors.greyColor
                                              .withOpacity(0.8),
                                          //decoration: TextDecoration.underline
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        widget.all.jobDetails!.checkInOccurrence
                                            .toString(),
                                        style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,

                                          color: AppColors.blackColor
                                              .withOpacity(0.8),
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

                                          color: AppColors.greyColor
                                              .withOpacity(0.8),
                                          //decoration: TextDecoration.underline
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Text(
                                            "${widget.all.jobDetails!.postedBy!.stars!.length} Star",
                                            style: fontW7S12(context)!.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,

                                              color: Colors.green,
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Job",
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 85,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 3,
                  //  color: AppColors.lightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.all.jobDetails!.title
                                              .toString(),
                                          style: fontW7S12(context)!.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,

                                            color: AppColors.blackColor
                                                .withOpacity(0.8),
                                            //decoration: TextDecoration.underline
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Fixed Price : \$${widget.all.jobDetails!.salary}",
                                              style:
                                                  fontW7S12(context)!.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,

                                                color: Colors.green,
                                                //decoration: TextDecoration.underline
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              DateFormatter.dateFormatter(widget
                                                  .all.jobDetails!.updatedAt!),
                                              // widget.all.jobDetails!.updatedAt!
                                              //     .format(),
                                              style:
                                                  fontW7S12(context)!.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,

                                                color: AppColors.greyColor,
                                                //decoration: TextDecoration.underline
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(
                                    //   width: 35,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/images/morevert.svg")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Proposed Bid",
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
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
                                "\$${widget.all.jobDetails!.salary}",
                                //"\$500",
                                // widget.active.dates
                                //     .toString()
                                //     .replaceAll("00:00:00.000", ""),
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
                                    "Job Type",
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
                                    widget.all.jobDetails!.workplace.toString(),
                                    //"On Site",
                                    // widget.active.time
                                    //     .toString()
                                    //     .replaceAll("TimeOfDay(", "")
                                    //     .replaceAll(")", ""),
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TimeFrame",
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  if (widget.all.checkIn == true) ...[
                    Text(
                      "Will Check-In",
                      style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.appcolor,
                          fontSize: 11),
                    ),
                  ] else ...[
                    Text(
                      "Will Not Check-In",
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
                                // "12-june-2018",
                                widget.all.jobDetails!.dates
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
                                    //  "12:45 AM",
                                    widget.all.jobDetails!.time
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
          ],
        ),
      ),
    );
  }
}
