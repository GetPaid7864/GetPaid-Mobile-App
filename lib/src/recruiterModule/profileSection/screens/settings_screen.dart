import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_paid/commonWidgets/cacheNetworkImageWidget.dart';
import 'package:get_paid/src/recruiterModule/profileSection/models/recruiter_profile_model.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/showsnackbar.dart';
import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../../AuthSection/providers/recruiter_auth_provider.dart';
import '../widgets/settings_card_widget.dart';

class SettingsScreen extends StatelessWidget {
  final GetRecruiterProfileModel getRecruiterProfileModel;

  const SettingsScreen({Key? key, required this.getRecruiterProfileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.maybePop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Account",
                        style: fontW7S12(context)!.copyWith(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CacheNetworkImageWidget(
                                  imgUrl: getRecruiterProfileModel.data!.first.v
                                      .toString(),
                                  radius: 33,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      // "Muhammad Sohaib",
                                      getRecruiterProfileModel.data!.first.name
                                          .toString(),
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                          color: AppColors.blackColor),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      // "sohaibjameel3@gmail.com",
                                      getRecruiterProfileModel.data!.first.email
                                          .toString(),
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColors.appcolor),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      // "+92347585494",
                                      getRecruiterProfileModel
                                          .data!.first.phoneNumber
                                          .toString(),
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColors.blackColor),
                                    ),
                                  ],
                                )
                              ],
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
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "Settings",
                  style: fontW4S12(context)!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SettingsCardWidget(
            text: 'Account Settings',
            icon: 'assets/images/accountSettings.svg',
            onTap: () {},
          ),
          SizedBox(
            height: 17,
          ),
          SettingsCardWidget(
            text: 'Change Password',
            icon: 'assets/images/changepassword.svg',
            onTap: () {},
          ),
          const SizedBox(
            height: 17,
          ),
          SettingsCardWidget(
            text: 'Language',
            icon: 'assets/images/changelanguage.svg',
            onTap: () {},
          ),
          SizedBox(
            height: 17,
          ),
          SettingsCardWidget(
            text: 'Terms & Conditions',
            icon: 'assets/images/privacy.svg',
            onTap: () {},
          ),
          SizedBox(
            height: 17,
          ),
          SettingsCardWidget(
            text: 'Privacy Policy',
            icon: 'assets/images/privacy.svg',
            onTap: () {},
          ),
          SizedBox(
            height: 17,
          ),
          SettingsCardWidget(
            text: 'Help & Support',
            icon: 'assets/images/help.svg',
            onTap: () {},
          ),
          const SizedBox(
            height: 17,
          ),
          SettingsCardWidget(
            text: 'Logout',
            icon: 'assets/images/logout.svg',
            onTap: () async {
              return await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.whitecolor,
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Do You Want To LogOut",
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Consumer<RecruiterAuthProvider>(
                                      builder: (context, authProvider, __) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        authProvider.logoutFromApp(context);
                                        Navigator.maybePop(context);

                                        pe(msg: "yes selected");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red.shade800),
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                            color: AppColors.whitecolor),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    pe(msg: "no selected");
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.withOpacity(0.1),
                                  ),
                                  child: const Text("No",
                                      style: TextStyle(color: Colors.black)),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
