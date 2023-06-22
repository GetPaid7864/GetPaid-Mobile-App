import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/bottomNavBar/screens/jobseeker_botttom_navbar.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../../commonWidgets/button_widget.dart';
import '../../../../../helpers/hive_local_storage.dart';
import '../../../../../utils/text_utils.dart';
import '../../../../../utils/theme.dart';
import '../../../authenticatonSection/screens/create_account_screen.dart';

class ProfileStepSucessfull extends StatelessWidget {
  const ProfileStepSucessfull({Key? key}) : super(key: key);

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
                      text: "Back to DashBoard",
                      horizontalPadding: 0,
                      bordercolor: AppColors.appcolor,
                      backgroundcolor: AppColors.appcolor,
                      onTap: () async {
                        toRemoveAll(
                            context: context,
                            widget: const JobSeekerBottomNavScreen());

                        await HiveLocalStorage.write(
                            boxName: TextUtils.currentRouteBox,
                            key: TextUtils.currentRouteKey,
                            value: JobSeekerSignUpScreen.routeName);
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
                        text: "Profile Setup Successfully",
                        style: fontW7S12(context)!.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
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
                          text:
                              "Your background check is complete and cleared. Processing time is up to 24 hours. You'll be notified of the outcome.",
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
