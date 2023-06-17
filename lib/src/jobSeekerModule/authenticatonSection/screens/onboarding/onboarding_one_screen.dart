import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

import '../../../../../helpers/hive_local_storage.dart';
import '../../../../../utils/text_utils.dart';
import '../../widgets/onboarding_button_widget.dart';
import 'onboarding_screen_two.dart';

class OnBoardingScreenOne extends StatefulWidget {
  static String routeName = "/OnBoardingScreenOne";

  const OnBoardingScreenOne({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenOne> createState() => _OnBoardingScreenOneState();
}

class _OnBoardingScreenOneState extends State<OnBoardingScreenOne> {
  @override
  void initState() {
    setOnBoardingScreenRoute();
    super.initState();
  }

  setOnBoardingScreenRoute() async {
    await HiveLocalStorage.write(
        boxName: TextUtils.currentOnBoardingRouteBox,
        key: TextUtils.currentOnBoardingRouteKey,
        value: OnBoardingScreenOne.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/onboardingone.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OnBoardingButtonWidget(
              onTap: () {
                toRemoveAll(
                    context: context, widget: const OnBoardingScreenTwo());
              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
