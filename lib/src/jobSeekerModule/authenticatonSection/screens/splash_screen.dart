import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/onboarding/onboarding_one_screen.dart';
import 'package:get_paid/utils/frontend_text_utils.dart';
import 'package:get_paid/utils/theme.dart';

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
    Timer(const Duration(seconds: 2), () async {
      toRemoveAll(context: context, widget: const OnBoardingScreenOne());
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
