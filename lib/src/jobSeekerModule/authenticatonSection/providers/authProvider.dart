import 'package:flutter/cupertino.dart';

import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  String? selectedAccountType;
  bool isLoading = false;

  bool jobSeeker = false;
  bool recruiter = false;

  updateJobSeekerSelection() {
    jobSeeker = true;
    recruiter = false;
    notifyListeners();
  }

  updateRecruiterSelection() {
    jobSeeker = false;
    recruiter = true;
    notifyListeners();
  }

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  AuthServices authServices = AuthServices();
  bool showconfirmobsecure = true;
  bool showpasswordobsecure = true;

  visiblePasswordChange() {
    if (showpasswordobsecure == true) {
      showpasswordobsecure = false;
    } else {
      showpasswordobsecure = true;
    }

    notifyListeners();
  }

  visibleConfirmPasswordChange() {
    if (showconfirmobsecure == true) {
      showconfirmobsecure = false;
    } else {
      showconfirmobsecure = true;
    }

    notifyListeners();
  }

  sendLoginApiRequest(String email, String password) async {
    try {
      makeLoadingTrue();

      authServices.postLoginRequest(email, password).whenComplete(() {
        makeLoadingFalse();
      });

      notifyListeners();
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
          context: navstate.currentState!.context, content: e.toString());
      // TODO
    }
  }
}
