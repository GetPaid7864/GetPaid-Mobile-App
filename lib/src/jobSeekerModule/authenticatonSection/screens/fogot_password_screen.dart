import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/update_password_screen.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/textfield_widget.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';

class JobSeekerForgotPasswordScreen extends StatefulWidget {
  static String routeName = "JobSeekerForgotPasswordScreen";

  const JobSeekerForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<JobSeekerForgotPasswordScreen> createState() =>
      _JobSeekerForgotPasswordScreenState();
}

class _JobSeekerForgotPasswordScreenState
    extends State<JobSeekerForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    FrontEndTextUtils.forgotPassword,
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    FrontEndTextUtils.pleaseenteryouremailbelow,
                    style: fontW3S12(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
                  ],
                ),
              ),
              Text(
                FrontEndTextUtils.sendedYouEmailAddress,
                style: fontW3S12(context)!.copyWith(),
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButtonWidget(
                  horizontalPadding: 0,
                  text: FrontEndTextUtils.next,
                  radius: 12,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      toNext(
                          context: context,
                          widget: const UpdatePasswordScreen());
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
                    toRemoveAll(
                        context: context, widget: JobSeekerSignInScreen());
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
