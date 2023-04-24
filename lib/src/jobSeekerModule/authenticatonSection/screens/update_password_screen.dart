import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/button_widget.dart';
import '../../../../commonWidgets/textfield_widget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../providers/authProvider.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static String routeName = "UpdatePasswordScreen";
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

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
                      "Hi Sohaib",
                      style: fontW7S12(context)!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      FrontEndTextUtils.confirmationSuccesfull,
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
                        controller: passwordController,
                        textFieldHeight: 50,
                        maxlines: 1,
                        showSuffixIcon: true,
                        toppadding: 18,
                        hintText: FrontEndTextUtils.newPassword,
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
                            return "Please Enter New Password";
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
                    text: FrontEndTextUtils.saveChanges,
                    radius: 12,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        toRemoveAll(
                            context: context, widget: const SignInScreen());
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
