import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/helpers/showsnackbar.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/sign_in_screen.dart';
import 'package:get_paid/utils/appcolors.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../providers/authProvider.dart';
import '../widgets/account_type_card_widget.dart';

class ChooseYourAccountType extends StatelessWidget {
  const ChooseYourAccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/templogopng.png",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        FrontEndTextUtils.appName,
                        style: fontW4S12(context)!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  FrontEndTextUtils.chooseYour,
                  style:
                      fontW7S12(context)!.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  FrontEndTextUtils.accountType,
                  style:
                      fontW7S12(context)!.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  FrontEndTextUtils.pleaseChooseOneOfTheFollowing,
                  style: fontW3S12(context),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(builder: (context, authProvider, __) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: AccountTypeCardWidget(
                      title: FrontEndTextUtils.jobSeeker,
                      image: "assets/images/jobseeker.svg",
                      onTap: () {
                        authProvider.updateJobSeekerSelection();
                        authProvider.selectedAccountType =
                            FrontEndTextUtils.jobSeeker;
                      },
                      borderColor: authProvider.jobSeeker == true
                          ? AppColors.appcolor
                          : AppColors.whitecolor,
                      elevation: authProvider.jobSeeker == true ? 10 : 6,
                      fillColor: authProvider.jobSeeker == true
                          ? AppColors.fillColor
                          : AppColors.whitecolor,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 5,
                    child: AccountTypeCardWidget(
                      title: FrontEndTextUtils.recruiter,
                      image: "assets/images/recuruter.svg",
                      onTap: () {
                        authProvider.updateRecruiterSelection();
                        authProvider.selectedAccountType =
                            FrontEndTextUtils.recruiter;
                      },
                      borderColor: authProvider.recruiter == true
                          ? AppColors.appcolor
                          : AppColors.whitecolor,
                      elevation: authProvider.recruiter == true ? 10 : 6,
                      fillColor: authProvider.recruiter == true
                          ? AppColors.fillColor
                          : AppColors.whitecolor,
                    ),
                  ),
                ],
              );
            }),
            Spacer(),
            Consumer<AuthProvider>(builder: (context, authProvider, __) {
              return CommonButtonWidget(
                  horizontalPadding: 0,
                  text: FrontEndTextUtils.next,
                  radius: 12,
                  buttonHeight: 55,
                  onTap: () {
                    if (authProvider.selectedAccountType == null) {
                      showErrorSnackBarMessage(
                          content: "Please Select Account Type");
                    } else if (authProvider.selectedAccountType ==
                        FrontEndTextUtils.jobSeeker) {
                      toNext(context: context, widget: const SignInScreen());
                    } else if (authProvider.selectedAccountType ==
                        FrontEndTextUtils.recruiter) {
                      toNext(
                          context: context,
                          widget: const RecruiterSignInScreen());
                    }

                    // authProvider.sendLoginApiRequest(
                    //     emailController.text, passwordController.text);
                  });
            }),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
