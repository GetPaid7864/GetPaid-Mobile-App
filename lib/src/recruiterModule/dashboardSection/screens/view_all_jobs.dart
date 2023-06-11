import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/providers/recruiter_dashboard_provider.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/job_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../../utils/theme.dart';
import '../widgets/all_job_card_widget.dart';

class ViewAllRecruiterJobsScreen extends StatefulWidget {
  const ViewAllRecruiterJobsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAllRecruiterJobsScreen> createState() =>
      _ViewAllRecruiterJobsScreenState();
}

class _ViewAllRecruiterJobsScreenState
    extends State<ViewAllRecruiterJobsScreen> {
  @override
  void initState() {
    context
        .read<RecruiterDashBoardProviders>()
        .getRecruiterDashBoardDataProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterDashBoardProviders>(
        builder: (context, recruiterDashBoardProvider, __) {
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  "All Jobs",
                  style: fontW7S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            recruiterDashBoardProvider
                    .recruiterDashBoardModel!.dashboardData!.all!.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 240),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "No Jobs Found",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: recruiterDashBoardProvider
                          .recruiterDashBoardModel!.dashboardData!.all!.length,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // number of items in the list
                      shrinkWrap: false,
                      scrollDirection: Axis.vertical,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // returns a widget for each item in the list
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            onTap: () {
                              toNext(
                                  context: context,
                                  widget: JobDetailsScreen(
                                      active: recruiterDashBoardProvider
                                          .recruiterDashBoardModel!
                                          .dashboardData!
                                          .all![index]));
                            },
                            child: AllJobCardsWidget(
                              active: recruiterDashBoardProvider
                                  .recruiterDashBoardModel!
                                  .dashboardData!
                                  .all![index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      );
    });
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       const SizedBox(
    //         height: 50,
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           IconButton(
    //               onPressed: () {
    //                 Navigator.maybePop(context);
    //               },
    //               icon: const Icon(Icons.arrow_back)),
    //           Text(
    //             "All Jobs",
    //             style: fontW7S12(context)!
    //                 .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
    //           ),
    //           const SizedBox(
    //             width: 40,
    //           )
    //         ],
    //       ),
    //       const SizedBox(
    //         height: 15,
    //       ),
    //       dashboardData.all!.isEmpty
    //           ? Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.only(top: 240),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: const [
    //                     Text(
    //                       "No Jobs Found",
    //                       style: TextStyle(
    //                           fontSize: 15, fontWeight: FontWeight.w600),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             )
    //           : Expanded(
    //               child: ListView.builder(
    //                 itemCount: dashboardData.all!.length,
    //                 padding: const EdgeInsets.symmetric(horizontal: 12),
    //                 // number of items in the list
    //                 shrinkWrap: false,
    //                 scrollDirection: Axis.vertical,
    //                 // physics: NeverScrollableScrollPhysics(),
    //                 itemBuilder: (BuildContext context, int index) {
    //                   // returns a widget for each item in the list
    //                   return Padding(
    //                     padding: const EdgeInsets.only(bottom: 15),
    //                     child: InkWell(
    //                       onTap: () {
    //                         toNext(
    //                             context: context,
    //                             widget: JobDetailsScreen(
    //                                 active: dashboardData.active![index]));
    //                       },
    //                       child: AllJobCardsWidget(
    //                         active: dashboardData.all![index],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //     ],
    //   ),
    // );
  }
}
