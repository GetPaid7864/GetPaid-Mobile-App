import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/models/job_seeker_profile_model.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/models/add_education_model.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class EducationViewCardWidget extends StatelessWidget {
  final Education education;
  final VoidCallback onTap;

  const EducationViewCardWidget(
      {Key? key, required this.onTap, required this.education})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: AppColors.lightGrey),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.textfieldColor),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/educationicon.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.institute.toString().toUpperCase(),
                      style: fontW7S12(context)!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      education.title.toString(),
                      style: fontW7S12(context)!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.appcolor),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          education.start.toString(),
                          style: fontW7S12(context)!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greyColor),
                        ),
                        Text(" - "),
                        Text(
                          education.end.toString(),
                          style: fontW7S12(context)!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
