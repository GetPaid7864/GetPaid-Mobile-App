import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/providers/authProvider.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/create_account_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../helpers/hive_local_storage.dart';
import '../../../../helpers/navigatorHelper.dart';
import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/local_storage_text_utils.dart';
import '../../../../utils/theme.dart';

class JobSeekerVerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;
  static String route = "/JobSeekerVerifyOtpScreen";

  const JobSeekerVerifyOtpScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<JobSeekerVerifyOtpScreen> createState() =>
      _JobSeekerVerifyOtpScreenState();
}

class _JobSeekerVerifyOtpScreenState extends State<JobSeekerVerifyOtpScreen> {
  int time = 0;
  late StopWatchTimer timmer;
  bool isDisable = true;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    timmer = StopWatchTimer(
        presetMillisecond: StopWatchTimer.getMilliSecFromSecond(180),
        onChange: (p0) {},
        mode: StopWatchMode.countDown,
        onEnded: () {
          // timmer.onResetTimer();
          setState(() {
            isDisable = false;
          });
        });
    timmer.onStartTimer();
  }

  @override
  void dispose() {
    timmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerAuthProvider>(
        builder: (context, jobSeekerAuthProvider, __) {
      return LoadingOverlay(
        isLoading: jobSeekerAuthProvider.isLoading,
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
                        jobSeekerAuthProvider.otp = v;
                        dp(msg: "ON complete", arg: v);
                      });
                      jobSeekerAuthProvider.sendVerifyOtpRequest(
                          jobSeekerAuthProvider.otp.toString());
                      //jobSeekerAuthProvider.verifyOTP(widget.comingStatus);
                    },

                    onChanged: (value) {
                      setState(() {
                        jobSeekerAuthProvider.otp = value;
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
                  height: 60,
                ),
                Align(
                  alignment: Alignment.center,
                  child: StreamBuilder<int>(
                      stream: timmer.rawTime,
                      initialData: 0,
                      builder: (contxt, snap) {
                        //
                        final displayTime = StopWatchTimer.getDisplayTime(
                          snap.data ?? 0,
                          minute: true,
                          second: true,
                          hours: true,
                          milliSecond: false,
                        );
                        return Text(
                          displayTime,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.blackColor, fontSize: 15),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      if ((widget.phoneNumber.isNotEmpty)) {
                        var cDateTime = await HiveLocalStorage.readHiveValue(
                          boxName: LocalStorageTextUtils.otpSendTimeBox,
                          key: LocalStorageTextUtils.otpSendTimeKey,
                        );
                        dp(msg: "Message", arg: cDateTime);
                        dp(
                            msg: "Date time",
                            arg: DateTime.now()
                                .difference(DateTime.parse(cDateTime))
                                .inMinutes);
                        if (DateTime.now()
                                .difference(DateTime.parse(cDateTime))
                                .inMinutes >=
                            3) {
                          //
                          //  authProvider.verifyPhone(isresend: true);
                          jobSeekerAuthProvider.resendOtp(widget.phoneNumber);
                          startTimer();
                          setState(() {
                            isDisable = true;
                          });
                          // showErrorSnackBarMessage(
                          //   content: "Please wait.....!",
                          // );
                        } else {
                          showErrorSnackBarMessage(
                            content: "Please wait for 3 minute to resend otp",
                          );
                        }
                        //
                      } else {
                        showErrorSnackBarMessage(
                          content: "Mobile number is required",
                        );
                        toRemoveAll(
                            context: context,
                            widget: const RecruiterSignUpScreen());
                        // GoRouter.of(context).push(SignUpScreen.route);
                        // toNext(
                        //     widget: EnterMobileScreen(),
                        //     context: navstate.currentState!.context);
                      }
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: isDisable
                              ? Colors.black.withOpacity(0.5)
                              : Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CommonButtonWidget(
                    text: "Verify ",
                    horizontalPadding: 15,
                    onTap: () {
                      jobSeekerAuthProvider.sendVerifyOtpRequest(
                          jobSeekerAuthProvider.otp.toString());
                    }),
                const SizedBox(
                  height: 20,
                ),
                CommonButtonWidget(
                    text: "Sign In ",
                    backgroundcolor: AppColors.appcolor,
                    bordercolor: AppColors.appcolor,
                    horizontalPadding: 15,
                    onTap: () {
                      toRemoveAll(
                          context: context, widget: JobSeekerSignInScreen());
                    }),

                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
