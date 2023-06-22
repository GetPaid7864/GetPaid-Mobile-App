import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/providers/jobseeker_profile_setup_provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../../commonWidgets/button_widget.dart';
import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../widgets/custom_textfield_profile_widget.dart';
import '../../widgets/custome_stepper_widget_profile_setup.dart';
import '../../widgets/skills_card_widget.dart';

class AddSkillsStepSix extends StatefulWidget {
  const AddSkillsStepSix({Key? key}) : super(key: key);

  @override
  State<AddSkillsStepSix> createState() => _AddSkillsStepSixState();
}

class _AddSkillsStepSixState extends State<AddSkillsStepSix> {
  TextEditingController skillsController = TextEditingController();
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
                              text: "Save & Finish",
                              backgroundcolor: AppColors.appcolor,
                              bordercolor: AppColors.appcolor,
                              horizontalPadding: 0,
                              textfont: 14,
                              onTap: () {
                                jobSeekerProfileSetupProvider
                                    .addSkillsProvider();
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
                      "5/6",
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
                  color4: AppColors.greyColor.withOpacity(0.6),
                  color5: AppColors.appcolor.withOpacity(0.6),
                  color6: AppColors.greyColor.withOpacity(0.6),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Skills / Specialization",
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
                  controller: skillsController,
                  hinText: 'Enter Skill to add',
                  enabled: true,
                  suffixIcon: '',
                  onSubmit: (value) {
                    jobSeekerProfileSetupProvider.addSkillToList(value);
                    skillsController.clear();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Skill";
                    }
                    return null;
                  },
                  showsuffixicon: false,
                ),
                if (jobSeekerProfileSetupProvider.skillsList.isNotEmpty) ...[
                  const SizedBox(
                    height: 20,
                  ),
                ],
                if (jobSeekerProfileSetupProvider.skillsList.isNotEmpty) ...[
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.only(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // Number of columns in the grid
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 2.1,
                          // Spacing between columns
                          mainAxisSpacing: 5.0, // Spacing between rows
                        ),
                        itemCount: jobSeekerProfileSetupProvider.skillsList
                            .length, // Total number of items in the grid
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SkillCardWidget(
                              text: jobSeekerProfileSetupProvider
                                  .skillsList[index]
                                  .toString(),
                              onTap: () {
                                jobSeekerProfileSetupProvider
                                    .removeSkillFromList(index);
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
