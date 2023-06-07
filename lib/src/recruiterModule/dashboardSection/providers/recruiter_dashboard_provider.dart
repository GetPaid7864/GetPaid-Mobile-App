import 'package:flutter/cupertino.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/Models/recruiter_dashboard_model.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/services/recruiter_dashboard_services.dart';

import '../../../../helpers/showsnackbar.dart';

class RecruiterDashBoardProviders extends ChangeNotifier {
  RecruiterDashBoardServices recruiterDashBoardServices =
      RecruiterDashBoardServices();
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  RecruiterDashBoardModel? recruiterDashBoardModel;

  getRecruiterDashBoardDataProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        recruiterDashBoardModel = await recruiterDashBoardServices
            .getAllDashBoardData()
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
