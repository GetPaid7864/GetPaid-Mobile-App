import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/providers/job_seeker_proposal_provider.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/screens/tabs/all_proposals.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/screens/tabs/draft_proposals.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/screens/tabs/submitted_proposals.dart';
import 'package:provider/provider.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class JobSeekerMainProposalScreen extends StatefulWidget {
  const JobSeekerMainProposalScreen({Key? key}) : super(key: key);

  @override
  State<JobSeekerMainProposalScreen> createState() =>
      _JobSeekerMainProposalScreenState();
}

class _JobSeekerMainProposalScreenState
    extends State<JobSeekerMainProposalScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<JobSeekerProposalProvider>().getJobSeekerProposalsProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Consumer<JobSeekerProposalProvider>(
          builder: (context, jobSeekerProposalProvider, __) {
        return Scaffold(
          body: jobSeekerProposalProvider.jobSeekerProposalModel == null
              ? const Center(
                  child: SpinKitPulse(
                    size: 32,
                    color: AppColors.appcolor,
                  ),
                )
              : Column(
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
                                  "Proposals",
                                  style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                                InkWell(
                                  onTap: () {
                                    // toNext(
                                    //     context: context,
                                    //     widget: const NotificationScreen());
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
                                          // toNext(
                                          //     context: context,
                                          //     widget:
                                          //     const SearchAllRecruiterJobsScreen());
                                        },
                                        child: SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    "Search For Proposals",
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
                      height: 20,
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
                                text: "All",
                              ),
                              Tab(
                                text: "Shortlisted",
                              ),
                              Tab(
                                text: "Saved",
                              ),
                            ]),
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(children: [
                        JobSeekerAllProposalsTab(),
                        JobSeekerSubmittedProposalsTab(),
                        JobSeekerDraftProposalsTab(),
                        // MostRecentJobsTab(), BestMatchJobsTab(),
                        // AppliedJobsTab()

                        //  DraftsJobsTab()
                      ]),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
