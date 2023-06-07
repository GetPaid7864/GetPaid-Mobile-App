import 'package:flutter/material.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/Models/recruiter_dashboard_model.dart';
import 'package:get_paid/src/recruiterModule/jobSection/providers/recruiter_jobs_provider.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../../dashboardSection/widgets/dashboard_card_widget.dart';
import '../../proposalSection/screens/main_proposal_screen.dart';

class JobDetailsScreen extends StatefulWidget {
  final Active active;

  const JobDetailsScreen({Key? key, required this.active}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  void initState() {
    // context
    //     .read<RecruiterJobsProvider>()
    //     .getRecruiterJobsDetailsProvider(widget.active.jobId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<RecruiterJobsProvider>(
          builder: (context, recruiterJobsProvider, __) {
        return WillPopScope(
          onWillPop: () async {
            recruiterJobsProvider.recruiterJobDetailsModel = null;
            return true;
          },
          child: Scaffold(
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
                                text: "Close Job",
                                backgroundcolor: AppColors.redColor,
                                horizontalPadding: 0,
                                onTap: () async {
                                  return await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: AppColors.whitecolor,
                                          content: SizedBox(
                                            height: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Are You Sure You Want To Close Job?",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Consumer<
                                                              RecruiterJobsProvider>(
                                                          builder: (context,
                                                              recruiterJobsProvider,
                                                              __) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            recruiterJobsProvider
                                                                .deleteJobProvider(
                                                                    widget
                                                                        .active
                                                                        .jobId
                                                                        .toString());
                                                            Navigator.maybePop(
                                                                context);

                                                            pe(msg: "yes selected");
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  primary: Colors
                                                                      .red
                                                                      .shade800),
                                                          child: const Text(
                                                            "Yes",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .whitecolor),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                    const SizedBox(width: 15),
                                                    Expanded(
                                                        child: ElevatedButton(
                                                      onPressed: () {
                                                        pe(msg: "no selected");
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.grey
                                                            .withOpacity(0.1),
                                                      ),
                                                      child: const Text("No",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                    ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                })),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: CommonButtonWidget(
                                text: "Edit Job",
                                backgroundcolor: AppColors.appcolor,
                                horizontalPadding: 0,
                                onTap: () {}))
                      ],
                    ),
                  ),
                )
              ],
            ),
            body:
                // recruiterJobsProvider.recruiterJobDetailsModel == null
                //     ? const Center(
                //         child: SpinKitPulse(
                //         size: 32,
                //         color: AppColors.appcolor,
                //       ))
                //     :
                SingleChildScrollView(
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
                              recruiterJobsProvider.recruiterJobDetailsModel =
                                  null;
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
                                widget.active.title.toString(),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: DashboaedCardWidget(
                            count: widget.active.totalProposals.toString(),
                            text: "Proposals",
                            onTap: () {
                              toNext(
                                  context: context,
                                  widget: MainProposalScreen(
                                    active: widget.active,
                                  ));
                            },
                            color: AppColors.cyanColor,
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Expanded(
                          flex: 5,
                          child: DashboaedCardWidget(
                            count: widget.active.totalShortlisted.toString(),
                            text: "Short Listed",
                            onTap: () {},
                            color: AppColors.greyColor.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
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
                            text: widget.active.description.toString(),
                            style: fontW3S12(context)!.copyWith(
                                color: AppColors.blackColor.withOpacity(0.6)))),
                  ),

                  const SizedBox(
                    height: 15,
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

                                        color: AppColors.greyColor
                                            .withOpacity(0.8),
                                        //decoration: TextDecoration.underline
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      widget.active.status.toString(),
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
                                      "Budget",
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
                                      "\$${widget.active.salary}",
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
                                      "Job Type",
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
                                      widget.active.workplace.toString(),
                                      style: fontW7S12(context)!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,

                                        color: AppColors.blackColor
                                            .withOpacity(0.8),
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
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        if (widget.active.checkIn == true) ...[
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
                            padding:
                                const EdgeInsets.only(left: 20, right: 100),
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

                                        color: AppColors.greyColor
                                            .withOpacity(0.8),
                                        //decoration: TextDecoration.underline
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      widget.active.dates
                                          .toString()
                                          .replaceAll("00:00:00.000", ""),
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
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 1,
                                      color:
                                          AppColors.greyColor.withOpacity(0.4),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Time",
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
                                          widget.active.time
                                              .toString()
                                              .replaceAll("TimeOfDay(", "")
                                              .replaceAll(")", ""),
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
                          itemCount: widget.active.skills!.length,
                          scrollDirection: Axis.horizontal,
                          // Replace `myList` with your own list of data
                          itemBuilder: (BuildContext context, int index) {
                            // Use the `index` to access the current item in the list
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 10),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 32,
                                    //width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: AppColors.greyColor
                                            .withOpacity(0.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Center(
                                        child: Text(
                                          widget.active.skills![index]
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

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: AppColors.appcolor.withOpacity(0.1),
                  //       borderRadius: BorderRadius.circular(13),
                  //     ),
                  //     child: TabBar(
                  //         labelStyle: fontW4S12(context)!.copyWith(
                  //             color: AppColors.whitecolor,
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 12),
                  //         indicatorPadding: const EdgeInsets.only(),
                  //         indicatorWeight: 2,
                  //         indicatorSize: TabBarIndicatorSize.tab,
                  //         indicator: BoxDecoration(
                  //             color: AppColors.appcolor,
                  //             borderRadius: BorderRadius.circular(12)),
                  //         indicatorColor: AppColors.appcolor,
                  //         labelColor: AppColors.whitecolor,
                  //         unselectedLabelColor: AppColors.blackColor,
                  //         padding: const EdgeInsets.only(),
                  //         tabs: const [
                  //           Tab(
                  //             text: "Job Details",
                  //           ),
                  //           Tab(
                  //             text: "Applicants",
                  //           ),
                  //         ]),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: TabBarView(children: [
                  //     JobDescriptionTab(
                  //       recruiterAllJobsDatum: widget.recruiterAllJobsDatum,
                  //     ),
                  //     ApplicantsTab(),
                  //   ]),
                  // )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
