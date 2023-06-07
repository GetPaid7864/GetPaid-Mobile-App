import 'package:flutter/cupertino.dart';
import 'package:get_paid/src/recruiterModule/profileSection/services/recruiter_profile_services.dart';

import '../../../../helpers/showsnackbar.dart';
import '../models/recruiter_profile_model.dart';

class RecruiterProfileProvider extends ChangeNotifier {
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  RecruiterProfileServices recruiterProfileServices =
      RecruiterProfileServices();

  GetRecruiterProfileModel? getRecruiterProfileModel;

  getRecruiterProfileProvider() async {
    try {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
        makeLoadingTrue();

        getRecruiterProfileModel = await recruiterProfileServices
            .getAllRecruiterProfileData()
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
