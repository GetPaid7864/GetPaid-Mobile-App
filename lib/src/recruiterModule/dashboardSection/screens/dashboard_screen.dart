import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_paid/commonWidgets/button_widget.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/post_a_job_screen.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../utils/theme.dart';
import '../../notificationSection/screens/notification_screen.dart';
import '../widgets/dashboard_card_widget.dart';
import '../widgets/jobs_card_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome Recruiter",
                          style: fontW7S12(context)!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22),
                        ),
                        InkWell(
                          onTap: () {
                            toNext(
                                context: context,
                                widget: const NotificationScreen());
                          },
                          child: SvgPicture.asset(
                            "assets/images/notificationicon.svg",
                            // height: 150,
                            // width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
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
                              child: Container(
                                width: 200,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search For Candidates",
                                      contentPadding:
                                          EdgeInsets.only(bottom: 10, left: 10),
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
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/dashboardpng.png",

                    // height: 150,
                    // width: 150,
                  ),
                  Positioned(
                    right: 110,
                    left: -60,
                    top: 105,
                    child: CommonButtonWidget(
                        buttonHeight: 42,
                        text: "Post A Job",
                        textfont: 11,
                        radius: 33,
                        horizontalPadding: 80,
                        onTap: () {
                          toNext(context: context, widget: PostAJobScreen());
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: DashboaedCardWidget(
                      count: "15",
                      text: "Total Jobs",
                      onTap: () {},
                      color: AppColors.cyanColor,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    flex: 5,
                    child: DashboaedCardWidget(
                      count: "15",
                      text: "Active Jobs",
                      onTap: () {},
                      color: AppColors.greyColor.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active Jobs",
                    style: fontW7S12(context)!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "View All",
                        style: fontW7S12(context)!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,

                          color: AppColors.appcolor,
                          //decoration: TextDecoration.underline
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 450,
              child: ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.symmetric(horizontal: 12),
                // number of items in the list
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // returns a widget for each item in the list
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: JobCardsWidget(),
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
