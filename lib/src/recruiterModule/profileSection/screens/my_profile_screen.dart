import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/profileTabs/about_tab.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/profileTabs/analytices_tab.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/profileTabs/reviews_tab.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../widgets/rating_bar_widget.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
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
                        padding: const EdgeInsets.only(left: 12, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Profile",
                              style: fontW7S12(context)!.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 22),
                            ),
                            SvgPicture.asset(
                              "assets/images/editicon.svg",
                              color: AppColors.appcolor,
                              // height: 150,
                              // width: 150,
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
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: -40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 135),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/avatarpng.png")),
                            borderRadius: BorderRadius.circular(90),
                            color: AppColors.appcolor),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Aspen Baptista",
              style: fontW7S12(context)!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "aspenbapista@gmail.com",
              style: fontW7S12(context)!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.appcolor),
            ),
            const SizedBox(
              height: 5,
            ),
            RatingBarWidget(
              itemCount: 5,
              onRatingUpdate: (value) {
                // reviewProvider.itemCountVar = value;
                // dp(arg: "star update value", msg: value);
              },
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "5 Star (6 reviews)",
              style: fontW7S12(context)!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.blackColor.withOpacity(0.5)),
            ),
            SizedBox(
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
                    indicatorPadding: EdgeInsets.only(),
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: AppColors.appcolor,
                        borderRadius: BorderRadius.circular(12)),
                    indicatorColor: AppColors.appcolor,
                    labelColor: AppColors.whitecolor,
                    unselectedLabelColor: AppColors.blackColor,
                    padding: EdgeInsets.only(),
                    tabs: const [
                      Tab(
                        text: "About",
                      ),
                      Tab(
                        text: "Review",
                      ),
                      Tab(
                        text: "Analytics",
                      )
                    ]),
              ),
            ),
            const Expanded(
              child: TabBarView(
                  children: [AboutTab(), ReviewsTab(), AnalyticesTab()]),
            )
          ],
        ),
      ),
    );
  }
}
