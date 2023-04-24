import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

import '../../widgets/onboarding_button_widget.dart';
import 'onboarding_screen_three.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  const OnBoardingScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/Onboarding2.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OnBoardingButtonWidget(
              onTap: () {
                toRemoveAll(
                    context: context, widget: const OnBoardingScreenThree());
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
