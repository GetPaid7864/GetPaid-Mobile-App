import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/helpers/showsnackbar.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/create_account_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/jobSeekerModule/bottomNavBar/screens/jobseeker_botttom_navbar.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/recruiterModule/bottomNavBarSection/screens/bottomNavScreen.dart';
import 'package:get_paid/utils/frontend_text_utils.dart';
import 'package:get_paid/utils/theme.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../utils/text_utils.dart';
import 'choose_your_account_type.dart';
import 'onboarding/onboarding_one_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    var userToken = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.userTokenBox,
      key: TextUtils.userTokenKey,
    );

    var currentRoute = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.currentRouteBox,
      key: TextUtils.currentRouteKey,
    );

    var currentOnBoardingRoute = await HiveLocalStorage.readHiveValue(
      boxName: TextUtils.currentOnBoardingRouteBox,
      key: TextUtils.currentOnBoardingRouteKey,
    );
    dp(msg: "current router", arg: currentRoute.toString());
    Timer(const Duration(seconds: 2), () async {
      if (currentOnBoardingRoute == OnBoardingScreenOne.routeName) {
        toNext(context: context, widget: const ChooseYourAccountType());
        if (userToken != null &&
            currentRoute == RecruiterSignInScreen.routeName) {
          toRemoveAll(context: context, widget: const BottomNavScreen());
        } else if (userToken != null &&
            currentRoute == JobSeekerSignInScreen.routeName) {
          toRemoveAll(
              context: context, widget: const JobSeekerBottomNavScreen());
        } else if (userToken != null &&
            currentRoute == JobSeekerSignUpScreen.routeName) {
          toRemoveAll(
              context: context, widget: const JobSeekerBottomNavScreen());
        }
      } else {
        toNext(context: context, widget: const OnBoardingScreenOne());
      }
      // if (userToken != null &&
      //     currentRoute == RecruiterSignInScreen.routeName) {
      //   toNext(context: context, widget: BottomNavScreen());
      // } else {
      //   toRemoveAll(context: context, widget: const OnBoardingScreenOne());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Powered by GetPaid",
              style: fontW3S12(context),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/templogopng.png",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
                // excludeFromSemantics: false,
                // matchTextDirection: false,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            FrontEndTextUtils.appName,
            style: fontW7S12(context),
          ),
        ],
      ),
    );
  }
}
