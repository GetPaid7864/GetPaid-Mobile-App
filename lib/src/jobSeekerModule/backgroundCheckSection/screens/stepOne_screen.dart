import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/backgroundCheckSection/screens/step_two_screen.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../widgets/custom_stepper_widget.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen({Key? key}) : super(key: key);

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
                      text: "Cancel",
                      horizontalPadding: 0,
                      bordercolor: AppColors.greyColor.withOpacity(0.3),
                      textcolor: AppColors.blackColor,
                      backgroundcolor: AppColors.whitecolor,
                      onTap: () {
                        Navigator.maybePop(context);
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CommonButtonWidget(
                      text: "Save & Next",
                      horizontalPadding: 0,
                      bordercolor: AppColors.appcolor,
                      backgroundcolor: AppColors.appcolor,
                      onTap: () {
                        toNext(context: context, widget: const StepTwoScreen());
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
                  "1/3",
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
            CustomStepperWidget(
              color1: AppColors.appcolor,
              color2: AppColors.greyColor.withOpacity(0.4),
              color3: AppColors.greyColor.withOpacity(0.4),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                FrontEndTextUtils.pleaseanswerfollowingqueries,
                style: fontW7S12(context)!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
