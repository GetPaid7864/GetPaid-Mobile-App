import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/providers/jobseeker_profile_setup_provider.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/widgets/language_card_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../../commonWidgets/button_widget.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../widgets/custom_textfield_profile_widget.dart';
import '../../widgets/custome_stepper_widget_profile_setup.dart';

class AddEducationStepFour extends StatefulWidget {
  const AddEducationStepFour({Key? key}) : super(key: key);

  @override
  State<AddEducationStepFour> createState() => _AddEducationStepFourState();
}

class _AddEducationStepFourState extends State<AddEducationStepFour> {
  TextEditingController instituteController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController fieldOfStudyController = TextEditingController();
  TextEditingController gradesController = TextEditingController();

  //TextEditingController dummyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<JobSeekerProfileSetupProvider>(
        builder: (context, jobSeekerProfileSetupProvider, __) {
      return LoadingOverlay(
        isLoading: jobSeekerProfileSetupProvider.isLoading,
        progressIndicator: const SpinKitPulse(
          size: 30,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
          backgroundColor: AppColors.fillColor,
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
                                jobSeekerProfileSetupProvider
                                    .addLanguagesProvider();
                                // if (_formKey.currentState!.validate()) {
                                //   jobSeekerProfileSetupProvider
                                //       .addContactDetailsProvider();
                                // }
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
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
                      "4/6",
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
                  color1: AppColors.greyColor.withOpacity(0.6),
                  color2: AppColors.greyColor.withOpacity(0.6),
                  color3: AppColors.greyColor.withOpacity(0.6),
                  color4: AppColors.appcolor,
                  color5: AppColors.greyColor.withOpacity(0.6),
                  color6: AppColors.greyColor.withOpacity(0.6),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Education",
                      style: fontW7S12(context)!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Save",
                        style: fontW7S12(context)!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.appcolor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomProfileTextFieldWidget(
                  controller: instituteController,
                  hinText: 'Institute',
                  enabled: true,
                  suffixIcon: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Institute";
                    }
                    return null;
                  },
                  showsuffixicon: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomProfileTextFieldWidget(
                  controller: degreeController,
                  hinText: 'Degree',
                  enabled: true,
                  suffixIcon: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Degree";
                    }
                    return null;
                  },
                  showsuffixicon: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomProfileTextFieldWidget(
                  controller: fieldOfStudyController,
                  hinText: 'Field Of Study',
                  enabled: true,
                  suffixIcon: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Field Of Study";
                    }
                    return null;
                  },
                  showsuffixicon: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          jobSeekerProfileSetupProvider
                              .selectEducationStartingDate(context);
                        },
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: AppColors.whitecolor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  jobSeekerProfileSetupProvider
                                              .educationStartingDate ==
                                          null
                                      ? "Start Date"
                                      : jobSeekerProfileSetupProvider
                                          .educationStartingDate!
                                          .format("d-M-Y"),
                                  style: fontW7S12(context)!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greyColor),
                                ),
                                SvgPicture.asset("assets/images/dateicon.svg"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          jobSeekerProfileSetupProvider
                              .selectEducationEndingDate(context);
                        },
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: AppColors.whitecolor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  jobSeekerProfileSetupProvider
                                              .educationEndingDate ==
                                          null
                                      ? "End Date"
                                      : jobSeekerProfileSetupProvider
                                          .educationEndingDate!
                                          .format("d-M-Y"),
                                  style: fontW7S12(context)!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greyColor),
                                ),
                                SvgPicture.asset("assets/images/dateicon.svg"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomProfileTextFieldWidget(
                  controller: gradesController,
                  hinText: 'Grades',
                  enabled: true,
                  suffixIcon: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Grades";
                    }
                    return null;
                  },
                  showsuffixicon: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (jobSeekerProfileSetupProvider.languageList.isNotEmpty) ...[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Added Languages",
                    style: fontW7S12(context)!
                        .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
                if (jobSeekerProfileSetupProvider.languageList.isNotEmpty) ...[
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(),
                        itemCount:
                            jobSeekerProfileSetupProvider.languageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: LanguageCardWidget(
                              language: jobSeekerProfileSetupProvider
                                  .languageList[index].language
                                  .toString(),
                              fluency: jobSeekerProfileSetupProvider
                                  .languageList[index].level,
                              onTap: () {
                                jobSeekerProfileSetupProvider
                                    .removeLanguageDataToList(index);
                              },
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
