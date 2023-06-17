import 'package:flutter/cupertino.dart';
import 'package:get_paid/src/jobSeekerModule/dashboardSection/models/jobseeker_dashboard_model.dart';
import 'package:get_paid/src/jobSeekerModule/dashboardSection/services/jobseeker_dashboard_services.dart';

import '../../../../helpers/showsnackbar.dart';

class JobSeekerDashBoardProvider extends ChangeNotifier {
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  JobSeekerDashBoardModel? jobSeekerDashBoardModel;

  JobSeekerDashBoardServices jobSeekerDashBoardServices =
      JobSeekerDashBoardServices();

  getJobSeekerDashBoardDataProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        jobSeekerDashBoardModel = await jobSeekerDashBoardServices
            .getAllJobSeekerDashBoardData()
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
