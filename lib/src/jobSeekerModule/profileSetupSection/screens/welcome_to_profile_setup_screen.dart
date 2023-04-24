import 'package:flutter/material.dart';
import 'package:get_paid/utils/appcolors.dart';

import '../../../../utils/frontend_text_utils.dart';
import '../../../../utils/theme.dart';

class WelcomeProfileSetupScreen extends StatelessWidget {
  const WelcomeProfileSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            color: AppColors.blackColor,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.appcolor,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: RichText(
                        selectionColor: AppColors.appcolor,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: FrontEndTextUtils.welcometothe,
                                style: fontW4S12(context)!.copyWith(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whitecolor)),
                            TextSpan(
                                text: FrontEndTextUtils.profileSetup,
                                style: fontW4S12(context)!.copyWith(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.appcolor)),
                            TextSpan(
                                text: FrontEndTextUtils.process,
                                style: fontW4S12(context)!.copyWith(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whitecolor)),
                          ],

                          style: fontW3S12(context),
                          spellOut: true,
                          //  text: FrontEndTextUtils.bySigningIn,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                        selectionColor: AppColors.appcolor,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        textScaleFactor: 1,
                        text: TextSpan(children: [
                          TextSpan(
                              text: FrontEndTextUtils.welcometoProfileSetupdesc,
                              style: fontW4S12(context)!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.whitecolor)),
                        ])),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            color: AppColors.appcolor,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FrontEndTextUtils.steps,
                  style: fontW7S12(context),
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.appcolor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.whitecolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "5 ${FrontEndTextUtils.minutes}",
                        style: fontW4S12(context)!.copyWith(
                            color: AppColors.whitecolor, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
