import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';

import '../../../../helpers/ApiHelpers/dio_service.dart';
import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/api_constants.dart';
import '../../../../utils/text_utils.dart';
import '../../bottomNavBar/screens/jobseeker_botttom_navbar.dart';

class JobSeekerAuthServices {
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
    Response response =
        await dioServices.postAuth(Apis.jobSeekerLoginEndPoint, body: {
      'email': email,
      'password': password,
    });
    var jsonResponse = response.data;

    dp(msg: "json response", arg: jsonResponse);

    if (response.statusCode == 200) {
      await HiveLocalStorage.write(
          boxName: TextUtils.currentRouteBox,
          key: TextUtils.currentRouteKey,
          value: JobSeekerSignInScreen.routeName);

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
          context: navstate.currentState!.context,
          widget: const JobSeekerBottomNavScreen());

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
    } else if (response.statusCode == 401 &&
        response.data["message"] == "Incorrect email or password.") {
      showErrorSnackBarMessage(content: response.data["message"].toString());
    } else {
      dp(msg: "status message", arg: response.statusMessage.toString());
      // showErrorSnackBarMessage(content: "Incorrect email or password.");
    }

    return response;
  }
}
