import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../../jobSection/screens/job_details_screen.dart';
import '../providers/recruiter_dashboard_provider.dart';
import '../widgets/all_job_card_widget.dart';

class SearchAllRecruiterJobsScreen extends StatefulWidget {
  const SearchAllRecruiterJobsScreen({Key? key}) : super(key: key);

  @override
  State<SearchAllRecruiterJobsScreen> createState() =>
      _SearchAllRecruiterJobsScreenState();
}

class _SearchAllRecruiterJobsScreenState
    extends State<SearchAllRecruiterJobsScreen> {
  // List<String> originalList = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5'
  // ];
  // List<String> filteredList = List<String>.empty(growable: true);
  // String searchText = '';
  //
  // @override
  // void initState() {
  //   filteredList.addAll(originalList);
  //   super.initState();
  // }

  @override
  void initState() {
    context
        .read<RecruiterDashBoardProviders>()
        .getRecruiterSearchDashBoardDataProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruiterDashBoardProviders>(
        builder: (context, dashboardProviders, __) {
      return Scaffold(
        // appBar: AppBar(
        //   title: TextField(
        //     onChanged: (value) {
        //       setState(() {
        //         searchText = value;
        //         filteredList = originalList
        //             .where((item) =>
        //                 item.toLowerCase().contains(searchText.toLowerCase()))
        //             .toList();
        //       });
        //     },
        //     decoration: const InputDecoration(
        //       hintText: 'Search...',
        //     ),
        //   ),
        // ),
        body: LoadingOverlay(
          isLoading: dashboardProviders.isLoading,
          opacity: 0.1,
          progressIndicator: const SpinKitPulse(
            size: 30,
            color: AppColors.appcolor,
          ),
          child: Column(
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.2,
                    focalRadius: 0.9,
                    tileMode: TileMode.clamp,
                    colors: [
                      AppColors.lightGrey.withOpacity(0.1),
                      AppColors.appcolor.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.maybePop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                  "assets/images/searchicon.svg",
                                  color: AppColors.blackColor,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                flex: 7,
                                child: SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    enabled: true,
                                    style: fontW3S12(context)!.copyWith(
                                        fontSize: 14,
                                        color: AppColors.blackColor
                                            .withOpacity(0.9),
                                        fontWeight: FontWeight.w500),
                                    onChanged: (value) {
                                      setState(() {
                                        dashboardProviders.searchText = value;
                                        dashboardProviders.filteredList =
                                            dashboardProviders
                                                .recruiterSearchDashBoardModel!
                                                .dashboardData!
                                                .all!
                                                .where((item) => item.title!
                                                    .toLowerCase()
                                                    .contains(dashboardProviders
                                                        .searchText
                                                        .toLowerCase()))
                                                .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Search For All Jobs",
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 10, left: 10, top: 5),
                                        hintStyle: fontW3S12(context)!.copyWith(
                                            fontSize: 14,
                                            color: AppColors.greyColor
                                                .withOpacity(0.6),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SvgPicture.asset(
                                  "assets/images/filtericon.svg",
                                  color: AppColors.blackColor,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              dashboardProviders.filteredList.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Text(
                          "No Job Found!",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 30),
                        itemCount: dashboardProviders.filteredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 12, right: 12),
                            child: InkWell(
                              onTap: () {
                                toNext(
                                    context: context,
                                    widget: JobDetailsScreen(
                                        active: dashboardProviders
                                            .filteredList[index]));
                              },
                              child: AllJobCardsWidget(
                                active: dashboardProviders.filteredList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
