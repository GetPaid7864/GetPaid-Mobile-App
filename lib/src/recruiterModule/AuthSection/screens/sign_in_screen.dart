import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/commonWidgets/textfield_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/providers/recruiter_auth_provider.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/fogot_password_screen.dart';
import 'package:get_paid/utils/appcolors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../../../jobSeekerModule/authenticatonSection/widgets/social_button_widget.dart';
import 'create_account_screen.dart';

class RecruiterSignInScreen extends StatefulWidget {
  static String routeName = "/RecruiterSignInScreen";

  const RecruiterSignInScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterSignInScreen> createState() => _RecruiterSignInScreenState();
}

class _RecruiterSignInScreenState extends State<RecruiterSignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterAuthProvider>(
        builder: (context, recruiterauthProvider, __) {
      return LoadingOverlay(
        isLoading: recruiterauthProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 40,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
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
                    children: [
                      Text(
                        FrontEndTextUtils.signIn,
                        style: fontW7S12(context)!
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        FrontEndTextUtils.pleaseenteryourcredentials,
                        style: fontW3S12(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SocialButtonWidget(
                    text: FrontEndTextUtils.continueWithGoogle,
                    icon: 'assets/images/googleicon.svg',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SocialButtonWidget(
                    text: FrontEndTextUtils.continueWithLinkedIn,
                    icon: 'assets/images/linkdinicon.svg',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          controller: emailController,
                          textFieldHeight: 55,
                          maxlines: 1,
                          showSuffixIcon: false,
                          toppadding: 12,
                          hintText: FrontEndTextUtils.email,
                          textInputType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return "Email is required";
                            }
                            String email = value ?? '';
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);

                            if (!emailValid) {
                              return 'Please use valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          controller: passwordController,
                          textFieldHeight: 55,
                          maxlines: 1,
                          showSuffixIcon: true,
                          toppadding: 24,
                          hintText: FrontEndTextUtils.password,
                          textInputType: TextInputType.emailAddress,
                          onsuffixIconTap: () {
                            recruiterauthProvider.visiblePasswordChange();
                          },
                          obsecureText:
                              recruiterauthProvider.showpasswordobsecure,
                          suffixIcon:
                              recruiterauthProvider.showpasswordobsecure == true
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.appcolor,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: AppColors.appcolor,
                                    ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            } else if (!RegExp(
                                    r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
                                .hasMatch(value)) {
                              return "Please Enter Strong Password";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      toNext(
                          context: context,
                          widget: const RecruiterForgotPasswordScreen());
                    },
                    child: Text(
                      FrontEndTextUtils.forgotPassword,
                      style: fontW3S12(context)!.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButtonWidget(
                      horizontalPadding: 0,
                      text: FrontEndTextUtils.signIn,
                      radius: 12,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          recruiterauthProvider.sendLoginApiRequest(
                              emailController.text, passwordController.text);
                          // toNext(
                          //     context: context, widget: BackgroundCheckView());
                          // authProvider.sendLoginApiRequest(
                          //     emailController.text, passwordController.text);
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonButtonWidget(
                      horizontalPadding: 0,
                      bordercolor: AppColors.greyColor.withOpacity(0.4),
                      backgroundcolor: AppColors.whitecolor,
                      textcolor: AppColors.blackColor,
                      text: FrontEndTextUtils.createAccount,
                      radius: 12,
                      onTap: () {
                        toRemoveAll(
                            context: context,
                            widget: const RecruiterSignUpScreen());
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      selectionColor: AppColors.appcolor,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          TextSpan(text: FrontEndTextUtils.bySigningIn),
                          TextSpan(
                              text: FrontEndTextUtils.termsAndCondition,
                              style: fontW4S12(context)!.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.appcolor)),
                          TextSpan(text: FrontEndTextUtils.and),
                          TextSpan(
                              text: FrontEndTextUtils.privacyPolicy,
                              style: fontW4S12(context)!.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.appcolor)),
                        ],

                        style: fontW3S12(context),
                        spellOut: true,
                        //  text: FrontEndTextUtils.bySigningIn,
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
