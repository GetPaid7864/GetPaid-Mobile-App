import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/providers/recruiter_dashboard_provider.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/screens/search_recruiter_all_jobs_screen.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/screens/view_all_jobs.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/post_a_job_screen.dart';
import 'package:get_paid/utils/appcolors.dart';
import 'package:provider/provider.dart';

import '../../../../utils/theme.dart';
import '../../contractsSection/providers/recruiter_contracts_provider.dart';
import '../../jobSection/screens/job_details_screen.dart';
import '../../notificationSection/screens/notification_screen.dart';
import '../widgets/dashboard_card_widget.dart';
import '../widgets/dashboard_job_card_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    context
        .read<RecruiterDashBoardProviders>()
        .getRecruiterDashBoardDataProvider();
    context
        .read<RecruiterContractsProvider>()
        .getContractsOfRecruiterProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RecruiterDashBoardProviders, RecruiterContractsProvider>(
        builder: (context, recruiterDashBoardProvider,
            recruiterContractsProvider, __) {
      return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: recruiterDashBoardProvider.recruiterDashBoardModel == null &&
                recruiterContractsProvider.recruiterContractsModel == null
            ? const SpinKitPulse(
                color: AppColors.appcolor,
                size: 32,
              )
            : SingleChildScrollView(
                child: Column(
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
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Welcome Recruiter",
                                  style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                                InkWell(
                                  onTap: () {
                                    toNext(
                                        context: context,
                                        widget: const NotificationScreen());
                                  },
                                  child: SvgPicture.asset(
                                    "assets/images/notificationicon.svg",
                                    // height: 150,
                                    // width: 150,
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
                            child: SizedBox(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(33),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        "assets/images/searchicon.svg",
                                        color: AppColors.blackColor,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: InkWell(
                                        onTap: () {
                                          toNext(
                                              context: context,
                                              widget:
                                                  const SearchAllRecruiterJobsScreen());
                                        },
                                        child: SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Search For All Jobs",
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 10, left: 10),
                                                hintStyle: fontW3S12(context)!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .greyColor
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.w500)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SvgPicture.asset(
                                        "assets/images/filtericon.svg",
                                        color: AppColors.blackColor,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/dashboardpng.png",

                            // height: 150,
                            // width: 150,
                          ),
                          Positioned(
                            right: 110,
                            left: -60,
                            top: 105,
                            child: CommonButtonWidget(
                                buttonHeight: 42,
                                text: "Post A Job",
                                textfont: 11,
                                radius: 33,
                                horizontalPadding: 80,
                                onTap: () {
                                  toNext(
                                      context: context,
                                      widget: PostAJobScreen());
                                }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: DashboaedCardWidget(
                              count: recruiterDashBoardProvider
                                  .recruiterDashBoardModel!
                                  .dashboardData!
                                  .activeJobs!
                                  .toString(),
                              text: "Active Jobs",
                              onTap: () {
                                toNext(
                                    context: context,
                                    widget: const ViewAllRecruiterJobsScreen());
                              },
                              color: AppColors.cyanColor,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            flex: 5,
                            child: DashboaedCardWidget(
                              count: recruiterContractsProvider
                                  .recruiterContractsModel!.data!.all!.length
                                  .toString(),
                              text: "Active Contracts",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Active Jobs",
                            style: fontW7S12(context)!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  toNext(
                                      context: context,
                                      widget:
                                          const ViewAllRecruiterJobsScreen());
                                },
                                child: Text(
                                  "View All",
                                  style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,

                                    color: AppColors.appcolor,
                                    //decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 13,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    recruiterDashBoardProvider.recruiterDashBoardModel!
                            .dashboardData!.active!.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "No Active Jobs Found",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 450,
                            child: ListView.builder(
                              itemCount: recruiterDashBoardProvider
                                  .recruiterDashBoardModel!
                                  .dashboardData!
                                  .active!
                                  .length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              // number of items in the list
                              shrinkWrap: false,
                              scrollDirection: Axis.vertical,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                // returns a widget for each item in the list
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: InkWell(
                                    onTap: () {
                                      toNext(
                                          context: context,
                                          widget: JobDetailsScreen(
                                            active: recruiterDashBoardProvider
                                                .recruiterDashBoardModel!
                                                .dashboardData!
                                                .active![index],
                                          ));
                                    },
                                    child: DashBoardJobCardsWidget(
                                      active: recruiterDashBoardProvider
                                          .recruiterDashBoardModel!
                                          .dashboardData!
                                          .active![index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
      );
    });
  }
}
