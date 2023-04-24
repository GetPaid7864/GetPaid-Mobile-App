import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/backgroundCheckSection/screens/views/background_check_view.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../widgets/custom_stepper_widget.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: CommonButtonWidget(
                      text: "Back to Main Menu",
                      horizontalPadding: 0,
                      bordercolor: AppColors.appcolor,
                      backgroundcolor: AppColors.appcolor,
                      onTap: () {
                        toRemoveAll(
                            context: context,
                            widget: const BackgroundCheckView());
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FrontEndTextUtils.backgroundChek,
                  style: fontW7S12(context)!
                      .copyWith(fontSize: 23, fontWeight: FontWeight.w700),
                ),
                Text(
                  "3/3",
                  style: fontW7S12(context)!.copyWith(
                      fontSize: 17,
                      color: AppColors.appcolor,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomStepperWidget(
              color1: AppColors.appcolor,
              color2: AppColors.appcolor,
              color3: AppColors.appcolor,
            ),
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: [
                Image.asset(
                  'assets/images/celebgif.gif',
                  height: 320,
                  width: 380,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 100),
                  child: SvgPicture.asset(
                    "assets/images/succesicon.svg",
                    height: 130,
                    width: 130,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  selectionColor: AppColors.appcolor,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  textScaleFactor: 1,
                  text: TextSpan(children: [
                    TextSpan(
                        text: FrontEndTextUtils.backgroundCheckSuccessful,
                        style: fontW7S12(context)!.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blackColor)),
                  ])),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: RichText(
                  selectionColor: AppColors.appcolor,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: FrontEndTextUtils.yourBackgroundCheck,
                          style: fontW4S12(context)!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor)),
                      TextSpan(
                          text: FrontEndTextUtils.twoWorkingDays,
                          style: fontW4S12(context)!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.appcolor)),
                      TextSpan(
                          text: FrontEndTextUtils.Youllbenotifiedoftheoutcome,
                          style: fontW4S12(context)!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor)),
                    ],

                    style: fontW3S12(context),
                    spellOut: true,
                    //  text: FrontEndTextUtils.bySigningIn,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
