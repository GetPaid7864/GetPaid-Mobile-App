import 'package:flutter/material.dart';
import 'package:get_paid/src/recruiterModule/notificationSection/widgets/notification_tile_widget.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notifications",
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
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
                  child: NotificationTileWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
