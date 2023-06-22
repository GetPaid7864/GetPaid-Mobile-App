import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/providers/recruiter_contracts_provider.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/widgets/recruiter_contract_card_widget.dart';
import 'package:get_paid/utils/appcolors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../jobSeekerModule/dashboardSection/widgets/most_recent_jobs_card_widget.dart';

class AllContractsTab extends StatelessWidget {
  const AllContractsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterContractsProvider>(
        builder: (context, recruiterContactsProvider, __) {
      return LoadingOverlay(
        isLoading: recruiterContactsProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 32,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          body: recruiterContactsProvider.recruiterContractsModel == null
              ? const Center(
                  child: SpinKitPulse(
                    size: 32,
                    color: AppColors.appcolor,
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    recruiterContactsProvider
                            .recruiterContractsModel!.data!.all!.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 150),
                              child: Text(
                                "No Contracts Found!",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: recruiterContactsProvider
                                    .recruiterContractsModel!.data!.all!.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                // number of items in the list
                                shrinkWrap: false,
                                scrollDirection: Axis.vertical,
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  // returns a widget for each item in the list
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: RecruiterContractCardsWidget(
                                      all: recruiterContactsProvider
                                          .recruiterContractsModel!
                                          .data!
                                          .all![index],
                                    ),
                                  );
                                }),
                          )
                  ],
                ),
        ),
      );
    });
  }
}
