import 'package:flutter/cupertino.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/choose_your_account_type.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/services/recruiter_auth_services.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/text_utils.dart';

class RecruiterAuthProvider extends ChangeNotifier {
  RecruiterAuthServices recruiterAuthServices = RecruiterAuthServices();

  bool isLoading = false;
  bool showconfirmobsecure = true;
  bool showpasswordobsecure = true;

  String? userNumber;
  String? completeUserNumber;
  String? countryPicked;

  String? otp;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

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
      recruiterAuthServices.postLoginRequest(email, password).whenComplete(() {
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

  sendRegisterApiRequest(
    String name,
    String aboutYou,
    String password,
    String email,
  ) async {
    dp(msg: "complete user number", arg: email);
    try {
      makeLoadingTrue();
      recruiterAuthServices
          .postSignupRequest(
              name, aboutYou, password, completeUserNumber.toString(), email)
          .whenComplete(() {
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

  sendVerifyOtpRequest(
    String otp,
  ) async {
    try {
      makeLoadingTrue();
      recruiterAuthServices.postVerifyOtpRequest(otp).whenComplete(() {
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

  resendOtp(
    String phoneNumber,
  ) async {
    try {
      makeLoadingTrue();
      recruiterAuthServices.postResendOtp(phoneNumber).whenComplete(() {
        makeLoadingFalse();
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
