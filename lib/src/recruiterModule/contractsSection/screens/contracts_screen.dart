import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/providers/recruiter_contracts_provider.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/screens/contractsTab/active_contracts.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/screens/contractsTab/all_contracts_tab.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/screens/contractsTab/draft_contracts.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/screens/contractsTab/expired_contracts.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/post_a_job_screen.dart';
import 'package:get_paid/src/recruiterModule/jobSection/widgets/job_stat_card_widget.dart';
import 'package:provider/provider.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class ContractsScreen extends StatefulWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  State<ContractsScreen> createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  @override
  void initState() {
    context
        .read<RecruiterContractsProvider>()
        .getContractsOfRecruiterProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Consumer<RecruiterContractsProvider>(
          builder: (context, recruiterContractsProvider, __) {
        return Scaffold(
          body: recruiterContractsProvider.recruiterContractsModel == null
              ? const Center(
                  child: SpinKitPulse(
                    size: 32,
                    color: AppColors.appcolor,
                  ),
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
                          padding: const EdgeInsets.only(left: 12, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Contracts",
                                style: fontW7S12(context)!.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 22),
                              ),
                              SvgPicture.asset(
                                "assets/images/notificationicon.svg",
                                // height: 150,
                                // width: 150,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CommonButtonWidget(
                          text: "Post A Job",
                          onTap: () {
                            toNext(context: context, widget: PostAJobScreen());
                          },
                          horizontalPadding: 20,
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
                          child: JobStatCardWidget(
                            count: recruiterContractsProvider
                                .recruiterContractsModel!.data!.all!.length
                                .toString(),
                            text: "Total Contracts",
                            onTap: () {},
                            color: AppColors.cyanColor,
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Expanded(
                          flex: 5,
                          child: JobStatCardWidget(
                            count: recruiterContractsProvider
                                .recruiterContractsModel!.data!.active!.length
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
                              text: "Active",
                            ),
                            Tab(
                              text: "Expired",
                            ),
                            Tab(
                              text: "Drafts",
                            )
                          ]),
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(children: [
                      AllContractsTab(),
                      ActiveContracts(),
                      ExpiredContracts(),
                      DraftContracts()
                    ]),
                  )
                ]),
        );
      }),
    );
  }
}
