import 'package:flutter/material.dart';

import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';
import '../../models/recruiter_all_jobs_model.dart';

class JobDescriptionTab extends StatelessWidget {
  final RecruiterAllJobsDatum recruiterAllJobsDatum;

  const JobDescriptionTab({Key? key, required this.recruiterAllJobsDatum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Job Description",
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: recruiterAllJobsDatum.description.toString(),
                    style: fontW3S12(context)!.copyWith(
                        color: AppColors.blackColor.withOpacity(0.6))))
          ],
        ),
      ),
    );
  }
}
