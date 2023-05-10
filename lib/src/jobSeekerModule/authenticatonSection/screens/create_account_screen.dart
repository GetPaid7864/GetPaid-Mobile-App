import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/textfield_widget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../../backgroundCheckSection/screens/views/background_check_view.dart';
import '../providers/authProvider.dart';
import '../widgets/social_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, __) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FrontEndTextUtils.createAccount,
                      style: fontW7S12(context)!
                          .copyWith(fontWeight: FontWeight.w900),
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
                        textFieldHeight: 50,
                        maxlines: 1,
                        showSuffixIcon: false,
                        toppadding: 18,
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
                        height: 5,
                      ),
                      TextFieldWidget(
                        controller: phoneController,
                        textFieldHeight: 50,
                        maxlines: 1,
                        showSuffixIcon: false,
                        toppadding: 18,
                        hintText: FrontEndTextUtils.phone,
                        textInputType: TextInputType.phone,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Phone Number is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                        controller: passwordController,
                        textFieldHeight: 50,
                        maxlines: 1,
                        showSuffixIcon: true,
                        toppadding: 18,
                        hintText: FrontEndTextUtils.password,
                        textInputType: TextInputType.visiblePassword,
                        onsuffixIconTap: () {
                          authProvider.visiblePasswordChange();
                        },
                        obsecureText: authProvider.showpasswordobsecure,
                        suffixIcon: authProvider.showpasswordobsecure == true
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
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                        controller: confirmPasswordController,
                        textFieldHeight: 50,
                        maxlines: 1,
                        showSuffixIcon: true,
                        toppadding: 18,
                        onsuffixIconTap: () {
                          authProvider.visibleConfirmPasswordChange();
                        },
                        obsecureText: authProvider.showconfirmobsecure,
                        suffixIcon: authProvider.showconfirmobsecure == true
                            ? const Icon(
                                Icons.visibility_off,
                                color: AppColors.appcolor,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: AppColors.appcolor,
                              ),
                        hintText: FrontEndTextUtils.confirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Confirm Password";
                          } else if (value != passwordController.text) {
                            return "Password Not Matched";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CommonButtonWidget(
                    horizontalPadding: 0,
                    text: FrontEndTextUtils.createAccount,
                    radius: 12,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        toNext(context: context, widget: BackgroundCheckView());
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
                    text: FrontEndTextUtils.signIn,
                    radius: 12,
                    onTap: () {
                      toRemoveAll(context: context, widget: SignInScreen());
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
                        TextSpan(text: FrontEndTextUtils.byCreatingAccount),
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
      );
    });
  }
}