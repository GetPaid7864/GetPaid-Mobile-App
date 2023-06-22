import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/dashboardSection/widgets/applied_job_card_widget.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/providers/job_seeker_proposal_provider.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/widgets/proposal_card_widget.dart';
import 'package:provider/provider.dart';

class JobSeekerSubmittedProposalsTab extends StatelessWidget {
  const JobSeekerSubmittedProposalsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerProposalProvider>(
        builder: (context, jobSeekerProposalProvider, __) {
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            jobSeekerProposalProvider
                    .jobSeekerProposalModel!.data!.shortlisted!.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "No Shortlisted Proposals Found",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: jobSeekerProposalProvider
                            .jobSeekerProposalModel!.data!.shortlisted!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        // number of items in the list
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          // returns a widget for each item in the list
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: JobSeekerProposalsCardsWidget(
                              applied: jobSeekerProposalProvider
                                  .jobSeekerProposalModel!
                                  .data!
                                  .shortlisted![index],
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
