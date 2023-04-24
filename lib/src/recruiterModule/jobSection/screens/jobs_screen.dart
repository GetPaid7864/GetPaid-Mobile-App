import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/jobTabs/active_jobs_tab.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/jobTabs/drafts_job_tab.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/jobTabs/expired_job_tab.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/post_a_job_screen.dart';
import 'package:get_paid/src/recruiterModule/jobSection/widgets/job_stat_card_widget.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        "Jobs",
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
          SizedBox(
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
                    count: "15",
                    text: "Active Jobs",
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
                    count: "15",
                    text: "Applicants",
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
          Expanded(
            child: TabBarView(
                children: [ActiveJobsTab(), ExpiredJobsTab(), DraftsJobsTab()]),
          )
        ]),
      ),
    );
  }
}
