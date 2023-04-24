import 'package:flutter/material.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/jobDetailsTab/applicatnst_tab.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/jobDetailsTab/job_description_tab.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../../dashboardSection/widgets/dashboard_card_widget.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                            text: "Close Job",
                            backgroundcolor: AppColors.redColor,
                            horizontalPadding: 0,
                            onTap: () {})),
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
        body: Column(
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
                          "Creative Ui/Ux Designer",
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
                      count: "15",
                      text: "Applicants",
                      onTap: () {},
                      color: AppColors.cyanColor,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    flex: 5,
                    child: DashboaedCardWidget(
                      count: "2",
                      text: "Short Listed",
                      onTap: () {},
                      color: AppColors.greyColor.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                    indicatorPadding: const EdgeInsets.only(),
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: AppColors.appcolor,
                        borderRadius: BorderRadius.circular(12)),
                    indicatorColor: AppColors.appcolor,
                    labelColor: AppColors.whitecolor,
                    unselectedLabelColor: AppColors.blackColor,
                    padding: const EdgeInsets.only(),
                    tabs: const [
                      Tab(
                        text: "Job Details",
                      ),
                      Tab(
                        text: "Applicants",
                      ),
                    ]),
              ),
            ),
            const Expanded(
              child: TabBarView(children: [
                JobDescriptionTab(),
                ApplicantsTab(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
