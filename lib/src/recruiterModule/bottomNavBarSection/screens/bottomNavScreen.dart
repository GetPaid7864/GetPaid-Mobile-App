import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../utils/appcolors.dart';
import '../providers/bottom_navbar_provider.dart';

class BottomNavScreen extends StatefulWidget {
  final int? index;
  static const String routeName = "BottomNavScreen";

  const BottomNavScreen({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  // var bottomnavprovier =
  //     Provider.of<BottomNavProvider>(navstate.currentState!.context);

  @override
  Widget build(BuildContext context) {
    // bottomnavprovier.updateCurrentScreen(widget.index!);
    return Consumer<BottomNavProvider>(builder: (context, provider, __) {
      return WillPopScope(
        onWillPop: () async {
          if (provider.currentIndex != 0) {
            provider.updateCurrentScreen(0);
            return false;
          }
          if (provider.currentIndex == 0) {
            return true;
          }
          return false;
        },
        child: Scaffold(
          body: Consumer<BottomNavProvider>(
            builder: (context, provider, child) {
              return provider.currentScreen;
            },
          ),
          bottomNavigationBar:
              Consumer<BottomNavProvider>(builder: (context, provider, child) {
            return BottomNavigationBar(
                elevation: 0.0,
                currentIndex: provider.currentIndex,
                useLegacyColorScheme: true,
                backgroundColor: AppColors.blackColor,
                onTap: (index) {
                  provider.updateCurrentScreen(index);
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  bottomNavItem(
                      path: "assets/images/bottom/dashboardbottom.svg",
                      selectedColor: provider.currentIndex == 0
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: "assets/images/bottom/chatbottom.svg",
                      height: 21,
                      width: 21,
                      selectedColor: provider.currentIndex == 1
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: "assets/images/bottom/jobbottom.svg",
                      selectedColor: provider.currentIndex == 2
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: "assets/images/contract.svg",
                      selectedColor: provider.currentIndex == 3
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                  bottomNavItem(
                      path: "assets/images/bottom/profilebottom.svg",
                      selectedColor: provider.currentIndex == 4
                          ? AppColors.whitecolor
                          : AppColors.whitecolor.withOpacity(0.5)),
                ]);
          }),
        ),
      );
    });
  }

  bottomNavItem({
    double? height,
    double? width,
    required Color selectedColor,
    required String path,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SvgPicture.asset(
          path,
          height: height,
          width: width,
          color: selectedColor,
        ),
      ),
      label: '',
    );
  }
}
