import 'package:flutter/material.dart';

import '../../../../../utils/appcolors.dart';
import '../../../../../utils/theme.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

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
              "About Me",
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text:
                        "Rhonchus senectus eget tellus auctor. Rhoncus libero faucibus in sodales suscipit sed et neque. Eu accumsan commodo volutpat tempus eu nisi arcu. Suspendisse diam in nisl rhoncus in praesent morbi feugiat. Vulputate morbi nibh sed non nascetur congue cras.",
                    style: fontW3S12(context)!.copyWith(
                        color: AppColors.blackColor.withOpacity(0.6))))
          ],
        ),
      ),
    );
  }
}
