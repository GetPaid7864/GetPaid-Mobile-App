import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/profileSection/providers/recruiter_profile_provider.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/profileTabs/analytices_tab.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/profileTabs/reviews_tab.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/settings_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../commonWidgets/cacheNetworkImageWidget.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../widgets/rating_bar_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    context.read<RecruiterProfileProvider>().getRecruiterProfileProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<RecruiterProfileProvider>(
          builder: (context, recruiterProfileProvider, __) {
        return LoadingOverlay(
          isLoading: recruiterProfileProvider.isLoading,
          progressIndicator: const SpinKitPulse(
            size: 25,
            color: AppColors.appcolor,
          ),
          child: Scaffold(
            body: recruiterProfileProvider.getRecruiterProfileModel == null
                ? const SpinKitPulse(
                    size: 25,
                    color: AppColors.appcolor,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 140,
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
                                  height: 45,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Profile",
                                        style: fontW7S12(context)!.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  toNext(
                                                      context: context,
                                                      widget: SettingsScreen(
                                                        getRecruiterProfileModel:
                                                            recruiterProfileProvider
                                                                .getRecruiterProfileModel!,
                                                      ));
                                                },
                                                child: const Icon(
                                                  Icons.settings,
                                                  color: AppColors.appcolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            right: 0,
                            bottom: -40,
                            child: Align(
                              alignment: Alignment.center,
                              child: CacheNetworkImageWidget(
                                height: 75,
                                width: 75,
                                imgUrl: '',
                                radius: 33,
                                errorWidgetHeight: 50,
                                errorWidgetWidth: 50,
                              ),
                            ),
                            // child: Container(
                            //   height: 90,
                            //   width: 70,
                            //   decoration: BoxDecoration(
                            //       image: const DecorationImage(
                            //           image: AssetImage(
                            //               "assets/images/avatarpng.png")),
                            //       borderRadius: BorderRadius.circular(90),
                            //       color: AppColors.appcolor),
                            // )
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        // "Aspen Baptista",
                        recruiterProfileProvider
                            .getRecruiterProfileModel!.data!.first.name
                            .toString(),
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        recruiterProfileProvider
                            .getRecruiterProfileModel!.data!.first.email
                            .toString(),
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: AppColors.appcolor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarWidget(
                            itemCount: recruiterProfileProvider
                                .getRecruiterProfileModel!
                                .data!
                                .first
                                .stars!
                                .length,
                            onRatingUpdate: (value) {
                              // reviewProvider.itemCountVar = value;
                              // dp(arg: "star update value", msg: value);
                            },
                          ),
                          // Text(
                          //   "(${recruiterProfileProvider.getRecruiterProfileModel!.data!.first.totalReviews})",
                          //   // "5 Star (6 reviews)",
                          //   style: fontW7S12(context)!.copyWith(
                          //       fontWeight: FontWeight.w400,
                          //       fontSize: 15,
                          //       color: AppColors.blackColor.withOpacity(0.5)),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${recruiterProfileProvider.getRecruiterProfileModel!.data!.first.stars!.length} Star (${recruiterProfileProvider.getRecruiterProfileModel!.data!.first.totalReviews} Reviews)",
                        // "5 Star (6 reviews)",
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.blackColor.withOpacity(0.4)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.appcolor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: TabBar(
                              labelStyle: fontW4S12(context)!.copyWith(
                                  color: AppColors.whitecolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                              indicatorPadding: const EdgeInsets.only(),
                              indicatorWeight: 2,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                  color: AppColors.appcolor,
                                  borderRadius: BorderRadius.circular(12)),
                              indicatorColor: AppColors.appcolor,
                              labelColor: AppColors.whitecolor,
                              unselectedLabelColor: AppColors.blackColor,
                              padding: const EdgeInsets.only(),
                              tabs: const [
                                // Tab(
                                //   text: "About",
                                // ),
                                Tab(
                                  text: "Review",
                                ),
                                Tab(
                                  text: "Analytics",
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          //  const AboutTab(),
                          ReviewsTab(
                            recruiterProfileDatum: recruiterProfileProvider
                                .getRecruiterProfileModel!.data!.first,
                          ),
                          const AnalyticesTab()
                        ]),
                      )
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
