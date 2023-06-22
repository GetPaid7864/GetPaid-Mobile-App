import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/models/add_education_model.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class EducationCardWidget extends StatelessWidget {
  final AddEducationModel addEducationModel;
  final VoidCallback onTap;

  const EducationCardWidget(
      {Key? key, required this.onTap, required this.addEducationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: AppColors.whitecolor),
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
                      addEducationModel.institute,
                      style: fontW7S12(context)!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      addEducationModel.fieldOfStudy,
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
                          addEducationModel.startDate,
                          style: fontW7S12(context)!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greyColor),
                        ),
                        Text(" - "),
                        Text(
                          addEducationModel.endDate,
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
            InkWell(
              onTap: onTap,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: AppColors.redColor),
                child: Center(
                  child: Icon(
                    Icons.clear,
                    color: AppColors.whitecolor,
                    size: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
