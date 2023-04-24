import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../helpers/navigatorHelper.dart';
import '../../../../../utils/theme.dart';
import '../../../dashboardSection/widgets/jobs_card_widget.dart';
import '../job_details_screen.dart';

class ExpiredJobsTab extends StatelessWidget {
  const ExpiredJobsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expired Jobs",
                  style: fontW7S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SvgPicture.asset(
                  "assets/images/filtericon.svg",
                  // height: 150,
                  // width: 150,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 12),
              // number of items in the list
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // returns a widget for each item in the list
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                      onTap: () {
                        toNext(context: context, widget: JobDetailsScreen());
                      },
                      child: const JobCardsWidget()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
