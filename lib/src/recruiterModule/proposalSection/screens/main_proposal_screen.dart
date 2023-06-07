import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/Models/recruiter_dashboard_model.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/provider/recruiter_proposal_provider.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/screens/proposalTabs/all_proposals_tab.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/screens/proposalTabs/shortlisted_proposals_tab.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class MainProposalScreen extends StatefulWidget {
  final Active active;

  const MainProposalScreen({Key? key, required this.active}) : super(key: key);

  @override
  State<MainProposalScreen> createState() => _MainProposalScreenState();
}

class _MainProposalScreenState extends State<MainProposalScreen> {
  @override
  void initState() {
    context
        .read<RecruiterProposalProvider>()
        .getRecruiterJobProposals(widget.active.jobId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<RecruiterProposalProvider>(
          builder: (context, recruiterProposalProvider, __) {
        return LoadingOverlay(
          isLoading: recruiterProposalProvider.isLoading,
          opacity: 0.1,
          progressIndicator: const SpinKitPulse(
            size: 40,
            color: AppColors.appcolor,
          ),
          child: Scaffold(
            body: recruiterProposalProvider.recruiterProposalModel!.data == null
                ? const SpinKitPulse(
                    size: 32,
                    color: AppColors.appcolor,
                  )
                : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      height: 180,
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
                                    icon: Icon(Icons.arrow_back)),
                                // Text(
                                //   "Jobs",
                                //   style: fontW7S12(context)!.copyWith(
                                //       fontWeight: FontWeight.w700,
                                //       fontSize: 22),
                                // ),
                                // SvgPicture.asset(
                                //   "assets/images/notificationicon.svg",
                                //   // height: 150,
                                //   // width: 150,
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Proposals For",
                                  style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greyColor,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  widget.active.title.toString(),
                                  style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.blackColor,
                                      fontSize: 28),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                                text: "All",
                              ),
                              Tab(
                                text: "ShortListed",
                              ),
                              // Tab(
                              //   text: "Drafts",
                              // )
                            ]),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        AllProposalsTab(), ShortListedProposalsTab(),

                        //  DraftsJobsTab()
                      ]),
                    )
                  ]),
          ),
        );
      }),
    );
  }
}
