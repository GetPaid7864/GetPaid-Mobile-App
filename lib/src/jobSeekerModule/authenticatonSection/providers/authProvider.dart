import 'package:flutter/cupertino.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/text_utils.dart';
import '../screens/choose_your_account_type.dart';
import '../services/auth_services.dart';

class JobSeekerAuthProvider extends ChangeNotifier {
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

  JobSeekerAuthServices jobSeekerAuthServices = JobSeekerAuthServices();
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
    dp(msg: "complete user number", arg: email);
    try {
      makeLoadingTrue();
      jobSeekerAuthServices.postLoginRequest(email, password).whenComplete(() {
        makeLoadingFalse();
      }).whenComplete(() {});

      notifyListeners();
    } on Exception catch (e) {
      makeLoadingFalse();
      showErrorSnackBarMessage(
        content: e.toString(),
      );
      // TODO
    }
  }

  logoutFromApp(BuildContext context) async {
    await HiveLocalStorage.deleteHiveValue(
        boxName: TextUtils.recruiterIDBox, key: TextUtils.recruiterIdKey);
    await HiveLocalStorage.deleteHiveValue(
        boxName: TextUtils.userTokenBox, key: TextUtils.userTokenKey);
    await HiveLocalStorage.deleteHiveValue(
        boxName: TextUtils.currentRouteBox, key: TextUtils.currentRouteKey);
    toNext(
        context: navstate.currentState!.context,
        widget: const ChooseYourAccountType());

    await showSuccessSnackBarMessage(content: "Logout Successfully");
  }
}
