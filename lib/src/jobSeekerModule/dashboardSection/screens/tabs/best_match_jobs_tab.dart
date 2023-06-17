import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/jobseeker_dashboard_provider.dart';
import '../../widgets/most_recent_jobs_card_widget.dart';

class BestMatchJobsTab extends StatelessWidget {
  const BestMatchJobsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerDashBoardProvider>(
        builder: (context, jobSeekerDashBoardProvider, __) {
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            jobSeekerDashBoardProvider
                    .jobSeekerDashBoardModel!.data!.bestMatch!.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "No Best Match Jobs Found",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: jobSeekerDashBoardProvider
                            .jobSeekerDashBoardModel!.data!.bestMatch!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        // number of items in the list
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          // returns a widget for each item in the list
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: MostRecentJobCardsWidget(
                              recentJob: jobSeekerDashBoardProvider
                                  .jobSeekerDashBoardModel!
                                  .data!
                                  .recentJobs![index],
                            ),
                          );
                        }),
                  )
          ],
        ),
      );
    });
  }
}
