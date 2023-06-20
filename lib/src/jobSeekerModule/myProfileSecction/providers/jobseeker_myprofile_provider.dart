import 'package:flutter/cupertino.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/models/job_seeker_profile_model.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/services/jobseeker_profile_services.dart';

import '../../../../helpers/showsnackbar.dart';

class JobSeekerMyProfileProvider extends ChangeNotifier {
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  JobSeekerProfileModel? jobSeekerProfileModel;

  JobSeekerProfileServices jobSeekerProfileServices =
      JobSeekerProfileServices();

  getJobSeekerProfileProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        jobSeekerProfileModel = await jobSeekerProfileServices
            .getAllJobSeekerProfileData()
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
