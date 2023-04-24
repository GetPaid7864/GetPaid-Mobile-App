import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

import '../../widgets/onboarding_button_widget.dart';
import 'onboarding_screen_two.dart';

class OnBoardingScreenOne extends StatelessWidget {
  const OnBoardingScreenOne({Key? key}) : super(key: key);

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
