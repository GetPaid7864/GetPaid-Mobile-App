import 'package:flutter/cupertino.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/models/recruiter_proposal_model.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/services/recruiter_proposal_service.dart';

import '../../../../helpers/showsnackbar.dart';

class RecruiterProposalProvider extends ChangeNotifier {
  RecruiterProposalServices recruiterProposalServices =
      RecruiterProposalServices();

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  RecruiterProposalModel? recruiterProposalModel;

  getRecruiterJobProposals(String jobID) async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        recruiterProposalModel = await recruiterProposalServices
            .getRecruiterJobProposals(jobID)
            .whenComplete(() {
          makeLoadingFalse();
        });

        notifyListeners();
      });
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }

  sendUpdateProposalFromPendingToApprovedRequest(
      String recruiterId,
      String jobSeekerID,
      String jobID,
      String bidAmount,
      String coverLetter,
      String selectedStartTime,
      String selectedEndTime,
      bool isSwitched,
      String selectedOption) async {
    try {
      makeLoadingTrue();
      recruiterProposalServices
          .updateProposalFromPendingToApproved(
              recruiterId,
              jobSeekerID,
              jobID,
              bidAmount,
              "$selectedStartTime-$selectedEndTime",
              isSwitched,
              selectedOption!,
              coverLetter)
          .whenComplete(() {
        makeLoadingFalse();
        // getAllRecruiterJobsProvider();
        // disCardJob();
      });

      notifyListeners();
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }
}
