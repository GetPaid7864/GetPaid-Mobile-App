import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_paid/helpers/ApiHelpers/dio_service.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/create_account_screen.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/verify_otp_screen.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';
import '../../bottomNavBarSection/screens/bottomNavScreen.dart';

class RecruiterAuthServices {
  ///posting login api request
  ///D
  DioServices dioServices = DioServices();

  Future<Response?> postLoginRequest(String email, String password) async {
    Map<String, dynamic> variables = {
      'email': email,
      'password': password,
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response = await dioServices.postAuth(Apis.login, body: {
      'email': email,
      'password': password,
    });
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      await HiveLocalStorage.write(
          boxName: TextUtils.currentRouteBox,
          key: TextUtils.currentRouteKey,
          value: RecruiterSignInScreen.route);

      await HiveLocalStorage.write(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
          value: jsonResponse["access_token"]);

      await HiveLocalStorage.write(
          boxName: TextUtils.recruiterIDBox,
          key: TextUtils.recruiterIdKey,
          value: jsonResponse["result"]["_id"].toString());
      showSuccessSnackBarMessage(content: "Login Successfully");
      toNext(
          context: navstate.currentState!.context, widget: BottomNavScreen());

      String userToken = await HiveLocalStorage.readHiveValue(
        boxName: TextUtils.userTokenBox,
        key: TextUtils.userTokenKey,
      );
      String userID = await HiveLocalStorage.readHiveValue(
        boxName: TextUtils.recruiterIDBox,
        key: TextUtils.recruiterIdKey,
      );

      dp(msg: "hive user token", arg: userToken.toString());
      dp(msg: "hive user id", arg: userID.toString());
    } else if (response.statusCode == 500 &&
        response.data["message"] == "Phone number not verified") {
      dp(msg: "status message", arg: response.data["message"]);
      showErrorSnackBarMessage(content: "Phone number not verified");
    } else if (response.statusCode == 500 &&
        response.data["message"] == "Incorrect email or password.") {
      showErrorSnackBarMessage(content: response.data["message"].toString());
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///posting signup api request
  Future<Response?> postSignupRequest(
    String name,
    String aboutYou,
    String password,
    String phoneNumber,
    String email,
  ) async {
    Map<String, dynamic> variables = {
      "name": name,
      "about": aboutYou,
      "password": password,
      "phoneNumber": phoneNumber,
      "email": email
    };
    log(variables.toString());
    FormData body = FormData.fromMap(variables);
    Response response = await dioServices.postAuth(Apis.register, body: {
      "name": name,
      "about": aboutYou,
      "password": password,
      "phoneNumber": phoneNumber,
      "email": email
    });
    var jsonResponse = response.data;

    dp(msg: "user token", arg: jsonResponse);

    if (response.statusCode == 200) {
      await HiveLocalStorage.write(
          boxName: TextUtils.currentRouteBox,
          key: TextUtils.currentRouteKey,
          value: RecruiterSignUpScreen.route);

      await HiveLocalStorage.write(
          boxName: TextUtils.userTokenBox,
          key: TextUtils.userTokenKey,
          value: jsonResponse["data"]["access_token"]);

      await HiveLocalStorage.write(
          boxName: TextUtils.recruiterIDBox,
          key: TextUtils.recruiterIdKey,
          value: jsonResponse["data"]["_id"].toString());
      toRemoveAll(
          context: navstate.currentState!.context, widget: VerifyOtpScreen());

      showSuccessSnackBarMessage(
          content: "Registered Successfully!Otp Code Sent to your number");
      toNext(
          context: navstate.currentState!.context,
          widget: const VerifyOtpScreen());
      String userToken = await HiveLocalStorage.readHiveValue(
        boxName: TextUtils.userTokenBox,
        key: TextUtils.userTokenKey,
      );
      String userID = await HiveLocalStorage.readHiveValue(
        boxName: TextUtils.recruiterIDBox,
        key: TextUtils.recruiterIdKey,
      );

      dp(msg: "hive user token", arg: userToken.toString());
      dp(msg: "hive  recruiter user id", arg: userID.toString());
    } else if (response.statusCode == 400 &&
        response.data["message"] == "User already exists!") {
      dp(msg: "status message", arg: response.data["message"]);
      showErrorSnackBarMessage(content: "User already exists!");
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }

  ///posting signup api request
  Future<Response?> postVerifyOtpRequest(
    String otp,
  ) async {
    String recruiterUserID = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.recruiterIDBox,
      key: TextUtils.recruiterIdKey,
    );
    dp(msg: "recruiter user id", arg: recruiterUserID);
    Map<String, dynamic> variables = {
      "recruiterId": recruiterUserID,
      "otp": otp,
    };
    log(variables.toString());
    // FormData body = FormData.fromMap(variables);
    Response response = await dioServices.putAuth(Apis.verifyPhoneOtp, body: {
      "recruiterId": recruiterUserID,
      "otp": otp,
    });
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      await HiveLocalStorage.write(
          boxName: TextUtils.currentRouteBox,
          key: TextUtils.currentRouteKey,
          value: VerifyOtpScreen.route);

      showSuccessSnackBarMessage(
          content: "OTP Verified Successfully!Now SignIn");
      toNext(
          context: navstate.currentState!.context,
          widget: const RecruiterSignInScreen());
    } else if (response.statusCode == 404 &&
        response.data["message"] == "Invalid OTP") {
      showErrorSnackBarMessage(content: "Invalid OTP");
    } else {
      showErrorSnackBarMessage(content: "SomeThing Went Wrong");
    }

    return response;
  }
}
