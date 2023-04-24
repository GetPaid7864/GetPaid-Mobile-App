import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/recruiterModule/profileSection/widgets/review_card_widget.dart';

import '../../../../../utils/theme.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ratings & Reviews",
                  style: fontW7S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 17),
                ),
                SvgPicture.asset(
                  "assets/images/filtericon.svg",
                  // height: 150,
                  // width: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.symmetric(horizontal: 2),
                // number of items in the list
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // returns a widget for each item in the list
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ReviewCardWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
