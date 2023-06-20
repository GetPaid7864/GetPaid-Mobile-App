import 'dart:io';

import 'package:date_time_format/date_time_format.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/providers/jobseeker_profile_setup_provider.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/widgets/custom_textfield_profile_widget.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/widgets/custome_stepper_widget_profile_setup.dart';
import 'package:get_paid/utils/appcolors.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../../commonWidgets/button_widget.dart';
import '../../../../../utils/theme.dart';

class ProfileSetupStepOne extends StatefulWidget {
  const ProfileSetupStepOne({Key? key}) : super(key: key);

  @override
  State<ProfileSetupStepOne> createState() => _ProfileSetupStepOneState();
}

class _ProfileSetupStepOneState extends State<ProfileSetupStepOne> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerProfileSetupProvider>(
        builder: (context, jobSeekerProfileSetupProvider, __) {
      return LoadingOverlay(
        isLoading: jobSeekerProfileSetupProvider.isLoading,
        opacity: 0.1,
        progressIndicator: const SpinKitPulse(
          size: 32,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: AppColors.fillColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                          child: CommonButtonWidget(
                              text: "Cancel",
                              backgroundcolor: AppColors.whitecolor,
                              horizontalPadding: 0,
                              bordercolor: AppColors.greyColor.withOpacity(0.7),
                              textcolor: AppColors.blackColor,
                              textfont: 14,
                              onTap: () async {})),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CommonButtonWidget(
                              text: "Save & Next",
                              backgroundcolor: AppColors.appcolor,
                              bordercolor: AppColors.appcolor,
                              horizontalPadding: 0,
                              textfont: 14,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  jobSeekerProfileSetupProvider
                                      .addPersonalInfoProvider();
                                }
                              }))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          backgroundColor: AppColors.fillColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile Setup",
                      style: fontW7S12(context)!
                          .copyWith(fontSize: 21, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "1/6",
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
                CustomStepperProfileSetupWidget(
                  color1: AppColors.appcolor,
                  color2: AppColors.greyColor.withOpacity(0.6),
                  color3: AppColors.greyColor.withOpacity(0.6),
                  color4: AppColors.greyColor.withOpacity(0.6),
                  color5: AppColors.greyColor.withOpacity(0.6),
                  color6: AppColors.greyColor.withOpacity(0.6),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Add Personal Info",
                  style: fontW7S12(context)!
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      jobSeekerProfileSetupProvider.croppedImage == null
                          ? Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(55),
                                  color: AppColors.whitecolor),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/images/bottom/profilebottom.svg",
                                  color: AppColors.greyColor,
                                ),
                              ))
                          : Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(File(
                                          jobSeekerProfileSetupProvider
                                              .croppedImage!.path))),
                                  borderRadius: BorderRadius.circular(55),
                                  color: AppColors.whitecolor),
                            ),
                      InkWell(
                        onTap: () {
                          jobSeekerProfileSetupProvider
                              .showChoiceDialog(context);
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          strokeWidth: 1,
                          strokeCap: StrokeCap.butt,
                          color: AppColors.appcolor,
                          dashPattern: [5, 3],
                          padding: EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: 75,
                              width: 180,
                              color: AppColors.fillColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    jobSeekerProfileSetupProvider
                                                .croppedImage ==
                                            null
                                        ? "Upload Profile Photo"
                                        : "Update Profile Photo",
                                    style: fontW7S12(context)!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.appcolor),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Max Size: 5 Mb",
                                    style: fontW7S12(context)!.copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.greyColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomProfileTextFieldWidget(
                              controller: jobSeekerProfileSetupProvider
                                  .firstNameController,
                              hinText: 'First Name',
                              enabled: true,
                              suffixIcon: '',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter First Name";
                                }
                                return null;
                              },
                              showsuffixicon: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomProfileTextFieldWidget(
                              controller: jobSeekerProfileSetupProvider
                                  .lastNameController,
                              hinText: 'Last Name',
                              enabled: true,
                              suffixIcon: '',
                              showsuffixicon: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Last Name";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomProfileTextFieldWidget(
                        controller:
                            jobSeekerProfileSetupProvider.dummyDOBController,
                        hinText:
                            jobSeekerProfileSetupProvider.selectedDate == null
                                ? 'Date of Birth'
                                : jobSeekerProfileSetupProvider.selectedDate!
                                    .format("d-M-Y"),
                        enabled: false,
                        onTap: () {
                          jobSeekerProfileSetupProvider.selectDate(context);
                        },
                        suffixIcon: 'assets/images/calendaricon.svg',
                        showsuffixicon: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomProfileTextFieldWidget(
                        controller:
                            jobSeekerProfileSetupProvider.jobTitleController,
                        hinText: 'Job Title',
                        enabled: true,
                        suffixIcon: '',
                        showsuffixicon: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Job Title";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
