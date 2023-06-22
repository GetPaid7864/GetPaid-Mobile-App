import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/job_seeker_proposal_provider.dart';
import '../../widgets/proposal_card_widget.dart';

class JobSeekerDraftProposalsTab extends StatelessWidget {
  const JobSeekerDraftProposalsTab({Key? key}) : super(key: key);

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
                    .jobSeekerProposalModel!.data!.saved!.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "No Saved Proposals Found",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: jobSeekerProposalProvider
                            .jobSeekerProposalModel!.data!.saved!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        // number of items in the list
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          // returns a widget for each item in the list
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: JobSeekerProposalsCardsWidget(
                              applied: jobSeekerProposalProvider
                                  .jobSeekerProposalModel!.data!.saved![index],
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
