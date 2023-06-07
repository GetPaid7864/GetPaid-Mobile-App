import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/sign_in_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';
import '../providers/recruiter_auth_provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  static String route = "/VerifyOtpScreen";
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterAuthProvider>(
        builder: (context, recruiterAuthProvider, __) {
      return LoadingOverlay(
        isLoading: recruiterAuthProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 40,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Verify OTP",
                        style: fontW7S12(context)!
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please enter otp to verify phone number",
                        style: fontW3S12(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PinCodeTextField(
                    length: 5,
                    obscureText: false,
                    cursorColor: AppColors.whitecolor,
                    // obscuringCharacter: "*",
                    validator: ((value) {
                      if (value?.isEmpty ?? true) {
                        return "please enter otp";
                      }
                      if (int.tryParse(value ?? '')?.isNaN ?? true) {
                        return "enter valid otp";
                      }
                      return null;
                    }),

                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(7),
                      fieldHeight: 50,
                      borderWidth: 0.1,
                      selectedColor: AppColors.appcolor.withOpacity(0.8),
                      selectedFillColor: AppColors.blackColor.withOpacity(0.8),
                      activeColor: AppColors.blackColor.withOpacity(0.8),
                      fieldWidth: 45,
                      inactiveColor: AppColors.blackColor.withOpacity(0.2),
                      inactiveFillColor: AppColors.blackColor.withOpacity(0.2),
                      activeFillColor: AppColors.appcolor.withOpacity(0.8),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    // backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,

                    //  errorAnimationController: errorController,
                    //    controller: textEditingController,
                    onCompleted: (v) {
                      setState(() {
                        recruiterAuthProvider.otp = v;
                        dp(msg: "ON complete", arg: v);
                      });
                      recruiterAuthProvider.sendVerifyOtpRequest(
                          recruiterAuthProvider.otp.toString());
                      //recruiterAuthProvider.verifyOTP(widget.comingStatus);
                    },

                    onChanged: (value) {
                      setState(() {
                        recruiterAuthProvider.otp = value;
                        dp(msg: "ON changes", arg: value);
                      });
                      // setState(() {
                      //   currentText = value;
                      // });
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: navstate.currentState!.context,
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                CommonButtonWidget(
                    text: "Verify ",
                    onTap: () {
                      recruiterAuthProvider.sendVerifyOtpRequest(
                          recruiterAuthProvider.otp.toString());
                    }),
                SizedBox(
                  height: 10,
                ),
                CommonButtonWidget(
                    text: "Sign In ",
                    onTap: () {
                      toRemoveAll(
                          context: context, widget: RecruiterSignInScreen());
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
