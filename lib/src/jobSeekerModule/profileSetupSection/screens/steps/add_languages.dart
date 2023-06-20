import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/providers/jobseeker_profile_setup_provider.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/widgets/language_card_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../../commonWidgets/button_widget.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../widgets/custom_textfield_profile_widget.dart';
import '../../widgets/custome_stepper_widget_profile_setup.dart';

class AddLanguagesStepThree extends StatefulWidget {
  const AddLanguagesStepThree({Key? key}) : super(key: key);

  @override
  State<AddLanguagesStepThree> createState() => _AddLanguagesStepThreeState();
}

class _AddLanguagesStepThreeState extends State<AddLanguagesStepThree> {
  TextEditingController languageController = TextEditingController();
  TextEditingController dummyController = TextEditingController();

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
                      "3/6",
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
                  color3: AppColors.appcolor,
                  color4: AppColors.greyColor.withOpacity(0.6),
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
                      "Add Languages",
                      style: fontW7S12(context)!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {
                        jobSeekerProfileSetupProvider.addLanguageDataToList(
                            languageController.text,
                            jobSeekerProfileSetupProvider
                                .selectedProficiencyLevel
                                .toString());
                        languageController.clear();
                        jobSeekerProfileSetupProvider.selectedProficiencyLevel =
                            null;
                      },
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
                  controller: languageController,
                  hinText: 'Enter Language',
                  enabled: true,
                  suffixIcon: '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Language";
                    }
                    return null;
                  },
                  showsuffixicon: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomProfileTextFieldWidget(
                  controller: dummyController,
                  hinText: jobSeekerProfileSetupProvider
                              .selectedProficiencyLevel ==
                          null
                      ? 'Proficiency Level '
                      : jobSeekerProfileSetupProvider.selectedProficiencyLevel
                          .toString(),
                  enabled: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 160),
                          child: SizedBox(
                            height: 200,
                            child: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Consumer<JobSeekerProfileSetupProvider>(
                                  builder: (context,
                                      jobSeekerProfileSetupProvider, __) {
                                return AlertDialog(
                                  backgroundColor: AppColors.whitecolor,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Choose",
                                        style: fontW7S12(context)!.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.blackColor),
                                      ),
                                    ],
                                  ),
                                  content: Column(
                                    children: [
                                      SizedBox(
                                        width: double.maxFinite,
                                        height: 180,
                                        child: ListView.builder(
                                          itemCount:
                                              jobSeekerProfileSetupProvider
                                                  .proficiencyLevel.length,
                                          // Replace `myList` with your own list of data
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // Use the `index` to access the current item in the list
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 7),
                                              child: InkWell(
                                                onTap: () {
                                                  jobSeekerProfileSetupProvider
                                                      .updateData(index);
                                                },
                                                child: Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9),
                                                      color: index ==
                                                              jobSeekerProfileSetupProvider
                                                                  .index
                                                          ? AppColors.appcolor
                                                          : AppColors
                                                              .whitecolor),
                                                  child: Center(
                                                    child: Text(
                                                      jobSeekerProfileSetupProvider
                                                          .proficiencyLevel[
                                                              index]
                                                          .toString(),
                                                      style: fontW7S12(context)!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12,
                                                              color: index ==
                                                                      jobSeekerProfileSetupProvider
                                                                          .index
                                                                  ? AppColors
                                                                      .whitecolor
                                                                  : AppColors
                                                                      .blackColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                            }),
                          ),
                        );
                      },
                    );
                  },
                  suffixIcon: 'assets/images/arrowdown.svg',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Language";
                    }
                    return null;
                  },
                  showsuffixicon: true,
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
