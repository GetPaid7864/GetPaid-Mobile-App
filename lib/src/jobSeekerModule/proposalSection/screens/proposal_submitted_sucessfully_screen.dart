import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/bottomNavBar/providers/jobseeker_bottom_navbar_provider.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../../bottomNavBar/screens/jobseeker_botttom_navbar.dart';

class ProposalSubmittedSuccessfully extends StatelessWidget {
  const ProposalSubmittedSuccessfully({Key? key}) : super(key: key);

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
            color: AppColors.blackColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      child: CommonButtonWidget(
                          text: "Back To Home",
                          backgroundcolor: AppColors.whitecolor,
                          horizontalPadding: 0,
                          textcolor: AppColors.blackColor,
                          textfont: 14,
                          onTap: () async {
                            toRemoveAll(
                                context: context,
                                widget: const JobSeekerBottomNavScreen());
                            Provider.of<JobSeekerBottomNavProvider>(context,
                                    listen: false)
                                .updateScreen(0);
                          })),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: CommonButtonWidget(
                          text: "View Proposals",
                          backgroundcolor: AppColors.appcolor,
                          horizontalPadding: 0,
                          textfont: 14,
                          onTap: () {
                            toRemoveAll(
                                context: context,
                                widget: const JobSeekerBottomNavScreen());
                            Provider.of<JobSeekerBottomNavProvider>(context,
                                    listen: false)
                                .updateScreen(2);
                          }))
                ],
              ),
            ),
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

            const SizedBox(
              height: 15,
            ),
            // const CustomStepperWidget(
            //   color1: AppColors.appcolor,
            //   color2: AppColors.appcolor,
            //   color3: AppColors.appcolor,
            // ),
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
                        text: FrontEndTextUtils.proposalSubmitted,
                        style: fontW7S12(context)!.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blackColor)),
                  ])),
            ),
            const SizedBox(
              height: 30,
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
                          text: FrontEndTextUtils.proposalSubmittedDesc,
                          style: fontW4S12(context)!.copyWith(
                              fontSize: 14,
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
