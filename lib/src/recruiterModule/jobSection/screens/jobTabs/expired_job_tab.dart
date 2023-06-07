import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/providers/recruiter_dashboard_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../helpers/navigatorHelper.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../../dashboardSection/widgets/dashboard_job_card_widget.dart';
import '../job_details_screen.dart';

class ExpiredJobsTab extends StatelessWidget {
  const ExpiredJobsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterDashBoardProviders>(
        builder: (context, recruiterDashboardProvider, __) {
      return Scaffold(
        body: recruiterDashboardProvider.recruiterDashBoardModel == null
            ? const SpinKitPulse(
                color: AppColors.appcolor,
                size: 30,
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Expired Jobs",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        SvgPicture.asset(
                          "assets/images/filtericon.svg",
                          // height: 150,
                          // width: 150,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  recruiterDashboardProvider.recruiterDashBoardModel!
                          .dashboardData!.expired!.isEmpty
                      ? Center(
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 110,
                              ),
                              Text(
                                "No Expired Jobs Found",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: recruiterDashboardProvider
                                .recruiterDashBoardModel!
                                .dashboardData!
                                .expired!
                                .length,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            // number of items in the list
                            shrinkWrap: false,
                            scrollDirection: Axis.vertical,
                            //physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              // returns a widget for each item in the list
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: InkWell(
                                    onTap: () {
                                      toNext(
                                          context: context,
                                          widget: JobDetailsScreen(
                                            active: recruiterDashboardProvider
                                                .recruiterDashBoardModel!
                                                .dashboardData!
                                                .expired![index],
                                          ));
                                    },
                                    child: DashBoardJobCardsWidget(
                                      active: recruiterDashboardProvider
                                          .recruiterDashBoardModel!
                                          .dashboardData!
                                          .expired![index],
                                    )),
                              );
                            },
                          ),
                        ),
                ],
              ),
      );
    });
  }
}
