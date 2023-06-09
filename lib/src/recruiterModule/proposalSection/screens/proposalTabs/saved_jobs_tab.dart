import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../provider/recruiter_proposal_provider.dart';
import '../../widgets/RecruiterJobProposalCardWidget.dart';

class SavedProposalsTab extends StatelessWidget {
  const SavedProposalsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterProposalProvider>(
        builder: (context, recruiterProposalProvider, __) {
      return Scaffold(
        body: recruiterProposalProvider.recruiterProposalModel == null
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
                          "Saved Proposals",
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
                  recruiterProposalProvider
                          .recruiterProposalModel!.data!.saved!.isEmpty
                      ? Center(
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 110,
                              ),
                              Text(
                                "No Shortlisted Proposals Found",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: recruiterProposalProvider
                                .recruiterProposalModel!.data!.saved!.length,
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
                                      // toNext(
                                      //     context: context,
                                      //     widget: JobDetailsScreen(
                                      //       active: recruiterDashboardProvider
                                      //           .recruiterDashBoardModel!
                                      //           .dashboardData!
                                      //           .active![index],
                                      //     ));
                                    },
                                    child: RecruiterJobProposalCardsWidget(
                                      all: recruiterProposalProvider
                                          .recruiterProposalModel!
                                          .data!
                                          .saved![index],
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
