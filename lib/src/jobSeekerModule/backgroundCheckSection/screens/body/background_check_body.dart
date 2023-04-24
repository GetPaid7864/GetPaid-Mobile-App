import 'package:flutter/material.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../../utils/frontend_text_utils.dart';
import '../../../../../utils/theme.dart';
import '../../widgets/welcome_background_check_card_widget.dart';
import '../stepOne_screen.dart';
import '../stepThree_screen.dart';
import '../step_two_screen.dart';

class BackgroundCheckBody extends StatelessWidget {
  const BackgroundCheckBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonButtonWidget(
              text: "Get Started",
              horizontalPadding: 10,
              bordercolor: AppColors.appcolor,
              backgroundcolor: AppColors.appcolor,
              onTap: () {
                toNext(context: context, widget: const StepOneScreen());
              }),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            color: AppColors.blackColor,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.appcolor,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: RichText(
                        selectionColor: AppColors.appcolor,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: FrontEndTextUtils.welcometothe,
                                style: fontW4S12(context)!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whitecolor)),
                            TextSpan(
                                text: FrontEndTextUtils.backgroundCheck,
                                style: fontW4S12(context)!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.appcolor)),
                            TextSpan(
                                text: FrontEndTextUtils.process,
                                style: fontW4S12(context)!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whitecolor)),
                          ],

                          style: fontW3S12(context),
                          spellOut: true,
                          //  text: FrontEndTextUtils.bySigningIn,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                        selectionColor: AppColors.appcolor,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        textScaleFactor: 1,
                        text: TextSpan(children: [
                          TextSpan(
                              text: FrontEndTextUtils.welcometobackgrounddesc,
                              style: fontW4S12(context)!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.whitecolor)),
                        ])),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: AppColors.appcolor,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FrontEndTextUtils.steps,
                  style: fontW7S12(context),
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.appcolor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.whitecolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "5 ${FrontEndTextUtils.minutes}",
                        style: fontW4S12(context)!.copyWith(
                            color: AppColors.whitecolor, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          WelcomeBackgroundCheckCardWidget(
            numberImage: "assets/images/oneStep.svg",
            titleText: FrontEndTextUtils.backgroundChek,
            descText: FrontEndTextUtils.backgroundChekdesc,
            onTap: () {
              toNext(context: context, widget: const StepOneScreen());
            },
          ),
          const SizedBox(
            height: 5,
          ),
          WelcomeBackgroundCheckCardWidget(
            numberImage: "assets/images/twoStep.svg",
            titleText: FrontEndTextUtils.accountSetup,
            descText: FrontEndTextUtils.accountSetupdesc,
            onTap: () {
              toNext(context: context, widget: const StepTwoScreen());
            },
          ),
          const SizedBox(
            height: 5,
          ),
          WelcomeBackgroundCheckCardWidget(
            numberImage: "assets/images/threeSteps.svg",
            titleText: FrontEndTextUtils.backgroundCheckComplete,
            descText: FrontEndTextUtils.backgroundCheckCompletedesc,
            onTap: () {
              toNext(context: context, widget: const StepThreeScreen());
            },
          )
        ],
      ),
    );
  }
}
