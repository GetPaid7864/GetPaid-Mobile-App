import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../helpers/navigatorHelper.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../../jobSection/widgets/shortlistedJobCardWidget.dart';
import '../../notificationSection/screens/notification_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                        "Search",
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
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              // number of items in the list
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // returns a widget for each item in the list
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: const ShortListedJobCardWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
