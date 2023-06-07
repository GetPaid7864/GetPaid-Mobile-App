import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/Models/recruiter_dashboard_model.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/job_details_screen.dart';

import '../../../../utils/theme.dart';
import '../widgets/dashboard_job_card_widget.dart';

class ViewAllRecruiterJobsScreen extends StatelessWidget {
  final DashboardData dashboardData;

  const ViewAllRecruiterJobsScreen({
    Key? key,
    required this.dashboardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              Text(
                "All Jobs",
                style: fontW7S12(context)!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                width: 40,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          dashboardData.all!.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 240),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "No Jobs Found",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: dashboardData.all!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                    active: dashboardData.active![index]));
                          },
                          child: DashBoardJobCardsWidget(
                            active: dashboardData.all![index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
