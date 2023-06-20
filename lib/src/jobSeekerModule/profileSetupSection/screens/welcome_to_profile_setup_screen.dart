import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/screens/steps/profile_setup_step.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/widgets/welcome_profile_setup_widget.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';

class WelcomeProfileSetupScreen extends StatelessWidget {
  const WelcomeProfileSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            color: AppColors.whitecolor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Get Started",
                          backgroundcolor: AppColors.appcolor,
                          horizontalPadding: 0,
                          bordercolor: AppColors.appcolor,
                          textcolor: AppColors.whitecolor,
                          textfont: 17,
                          onTap: () async {
                            toNext(
                                context: context,
                                widget: const ProfileSetupStepOne());
                          })),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.whitecolor)),
                              TextSpan(
                                  text: FrontEndTextUtils.profileSetup,
                                  style: fontW4S12(context)!.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.appcolor)),
                              TextSpan(
                                  text: FrontEndTextUtils.process,
                                  style: fontW4S12(context)!.copyWith(
                                      fontSize: 24,
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
                                text:
                                    FrontEndTextUtils.welcometoProfileSetupdesc,
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
                    style: fontW7S12(context)!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
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
                              color: AppColors.whitecolor, fontSize: 14),
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
            WelcomeProfileSetupWidget(
              numberImage: "assets/images/oneStep.svg",
              titleText: "Personal Info",
              descText: "Start your  journey by creating your profile.",
              onTap: () {
                //  toNext(context: context, widget: const StepOneScreen());
              },
            ),
            const SizedBox(
              height: 5,
            ),
            WelcomeProfileSetupWidget(
              numberImage: "assets/images/twoStep.svg",
              titleText: "Contact Details",
              descText: "Connect with us, add your contact details.",
              onTap: () {
                //  toNext(context: context, widget: const StepOneScreen());
              },
            ),
            const SizedBox(
              height: 5,
            ),
            WelcomeProfileSetupWidget(
              numberImage: "assets/images/threeSteps.svg",
              titleText: "Languages",
              descText: "Unlock the world, add your languages.",
              onTap: () {
                //  toNext(context: context, widget: const StepOneScreen());
              },
            ),
            const SizedBox(
              height: 5,
            ),
            WelcomeProfileSetupWidget(
              numberImage: "assets/images/fourStep.svg",
              titleText: "Education",
              descText: "Add your education.",
              onTap: () {
                //  toNext(context: context, widget: const StepOneScreen());
              },
            ),
            const SizedBox(
              height: 5,
            ),
            WelcomeProfileSetupWidget(
              numberImage: "assets/images/fiveStep.svg",
              titleText: "Work Experience",
              descText: "Unlock the world, add your languages",
              onTap: () {
                //  toNext(context: context, widget: const StepOneScreen());
              },
            ),
            const SizedBox(
              height: 5,
            ),
            WelcomeProfileSetupWidget(
              numberImage: "assets/images/sixStep.svg",
              titleText: "Skills & Specialization",
              descText: "Unlock the world, add your languages",
              onTap: () {
                //  toNext(context: context, widget: const StepOneScreen());
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
