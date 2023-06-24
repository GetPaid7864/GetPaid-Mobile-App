import 'package:flutter/cupertino.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/models/recruiter_contract_details_model.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/models/recruiter_contracts_model.dart';
import 'package:get_paid/src/recruiterModule/contractsSection/services/recruiter_contracts_services.dart';

import '../../../../helpers/showsnackbar.dart';

class RecruiterContractsProvider extends ChangeNotifier {
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  RecruiterContractsService recruiterContractsService =
      RecruiterContractsService();

  RecruiterContractsModel? recruiterContractsModel;

  getContractsOfRecruiterProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        recruiterContractsModel = await recruiterContractsService
            .getContractsOfRecruiter()
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

  RecruiterContractDetailsModel? recruiterContractDetailsModel;

  getContractDetailsOfRecruiterProvider(String contractID) async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        recruiterContractDetailsModel = await recruiterContractsService
            .getContractDetailsOfRecruiter(contractID)
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
}
