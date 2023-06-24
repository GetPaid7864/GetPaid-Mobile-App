import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/helpers/date_formatter.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/providers/recruiter_contracts_provider.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/screens/contractDetailsTab/job_details_tab.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/screens/contractDetailsTab/time_tracking_tab.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/models/recruiter_proposal_model.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/provider/recruiter_proposal_provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/cacheNetworkImageWidget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class RecruiterContractDetailsScreen extends StatefulWidget {
  final String contractID;

  const RecruiterContractDetailsScreen({Key? key, required this.contractID})
      : super(key: key);

  @override
  State<RecruiterContractDetailsScreen> createState() =>
      _RecruiterContractDetailsScreenState();
}

class _RecruiterContractDetailsScreenState
    extends State<RecruiterContractDetailsScreen> {
  @override
  void initState() {
    context
        .read<RecruiterContractsProvider>()
        .getContractDetailsOfRecruiterProvider(widget.contractID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterContractsProvider>(
        builder: (context, recruiterContractsProvider, __) {
      return LoadingOverlay(
        isLoading: recruiterContractsProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 32,
          color: AppColors.appcolor,
        ),
        child: DefaultTabController(
          length: 2,
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
                                text: "Close Contract",
                                backgroundcolor: AppColors.redColor,
                                bordercolor: AppColors.redColor,
                                textcolor: AppColors.whitecolor,
                                horizontalPadding: 0,
                                onTap: () async {})),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: CommonButtonWidget(
                                text: "Message",
                                backgroundcolor: AppColors.appcolor,
                                horizontalPadding: 0,
                                onTap: () {}))
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: recruiterContractsProvider.recruiterContractDetailsModel ==
                    null
                ? const Center(
                    child: SpinKitPulse(
                      size: 32,
                      color: AppColors.appcolor,
                    ),
                  )
                : Column(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Contract Details",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CacheNetworkImageWidget(
                                                  imgUrl: recruiterContractsProvider
                                                      .recruiterContractDetailsModel!
                                                      .data!
                                                      .first
                                                      .proposedBy!
                                                      .photo
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${recruiterContractsProvider.recruiterContractDetailsModel!.data!.first.proposedBy!.personalInfo!.firstName} ${recruiterContractsProvider.recruiterContractDetailsModel!.data!.first.proposedBy!.personalInfo!.lastName}",
                                                          style: fontW7S12(
                                                                  context)!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,

                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.8),
                                                            //decoration: TextDecoration.underline
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          recruiterContractsProvider
                                                              .recruiterContractDetailsModel!
                                                              .data!
                                                              .first
                                                              .proposedBy!
                                                              .email!
                                                              .toString(),
                                                          style: fontW7S12(
                                                                  context)!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,

                                                            color: AppColors
                                                                .greyColor
                                                                .withOpacity(
                                                                    0.9),
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
                                            SvgPicture.asset(
                                                "assets/images/morevert.svg")
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: AppColors.greyColor
                                            .withOpacity(0.4),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "DOB",
                                                  style: fontW7S12(context)!
                                                      .copyWith(
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
                                                  recruiterContractsProvider
                                                      .recruiterContractDetailsModel!
                                                      .data!
                                                      .first
                                                      .proposedBy!
                                                      .personalInfo!
                                                      .dob!
                                                      .format("d-M-Y")
                                                      .toString(),
                                                  style: fontW7S12(context)!
                                                      .copyWith(
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
                                              color: AppColors.greyColor
                                                  .withOpacity(0.4),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Contact",
                                                  style: fontW7S12(context)!
                                                      .copyWith(
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
                                                  recruiterContractsProvider
                                                      .recruiterContractDetailsModel!
                                                      .data!
                                                      .first
                                                      .proposedBy!
                                                      .contact!
                                                      .phoneNumber
                                                      .toString(),
                                                  style: fontW7S12(context)!
                                                      .copyWith(
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
                                              color: AppColors.greyColor
                                                  .withOpacity(0.4),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Rating",
                                                  style: fontW7S12(context)!
                                                      .copyWith(
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
                                                      "${recruiterContractsProvider.recruiterContractDetailsModel!.data!.first.proposedBy!.stars!.length.toString()} Star",
                                                      style: fontW7S12(context)!
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.appcolor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: TabBar(
                              labelStyle: fontW4S12(context)!.copyWith(
                                  color: AppColors.whitecolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                              indicatorPadding: EdgeInsets.only(),
                              indicatorWeight: 2,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                  color: AppColors.appcolor,
                                  borderRadius: BorderRadius.circular(12)),
                              indicatorColor: AppColors.appcolor,
                              labelColor: AppColors.whitecolor,
                              unselectedLabelColor: AppColors.blackColor,
                              padding: EdgeInsets.only(),
                              tabs: const [
                                Tab(
                                  text: "Job Details",
                                ),
                                Tab(
                                  text: "Time Tracking",
                                ),
                              ]),
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(children: [
                          JobDetailsTab(), TimeTrackingTab(),

                          //  DraftsJobsTab()
                        ]),
                      )
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
