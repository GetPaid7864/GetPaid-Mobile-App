import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/models/job_seeker_profile_model.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/widgets/language_view_card_widget.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/widgets/skills_view_card_widget.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/widgets/skills_card_widget.dart';

import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../../profileSetupSection/widgets/education_card_widget.dart';
import '../../widgets/education_view_card_widget.dart';

class OverViewWorkHistoryTab extends StatelessWidget {
  final Datum jobSeekerProfileDatum;

  const OverViewWorkHistoryTab({Key? key, required this.jobSeekerProfileDatum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Education History",
                      style: fontW7S12(context)!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    SvgPicture.asset(
                      "assets/images/editicon.svg",
                      color: AppColors.appcolor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: jobSeekerProfileDatum.education!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: EducationViewCardWidget(
                            onTap: () {
                              // jobSeekerProfileSetupProvider
                              //     .removeEducationDataToList(index);
                            },
                            education: jobSeekerProfileDatum.education![index],
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Languages",
                      style: fontW7S12(context)!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    SvgPicture.asset(
                      "assets/images/editicon.svg",
                      color: AppColors.appcolor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      padding: EdgeInsets.only(),
                      itemCount: jobSeekerProfileDatum.languages!.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: LanguageViewCardWidget(
                            onTap: () {
                              // jobSeekerProfileSetupProvider
                              //     .removeEducationDataToList(index);
                            },
                            language: jobSeekerProfileDatum
                                .languages![index].language
                                .toString(),
                            fluency: jobSeekerProfileDatum
                                .languages![index].level
                                .toString(),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skills",
                      style: fontW7S12(context)!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    SvgPicture.asset(
                      "assets/images/editicon.svg",
                      color: AppColors.appcolor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 6,
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
                      itemCount: jobSeekerProfileDatum
                          .skills!.length, // Total number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SkillViewCardWidget(
                            text:
                                jobSeekerProfileDatum.skills![index].toString(),
                            onTap: () {},
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
