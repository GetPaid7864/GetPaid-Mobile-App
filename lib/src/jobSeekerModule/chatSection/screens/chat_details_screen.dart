import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/appcolors.dart';
import '../../../../utils/theme.dart';
import '../../../recruiterModule/chatSection/widgets/left_chat_widget.dart';
import '../../../recruiterModule/chatSection/widgets/right_chat_widget.dart';

class JobSeekerChatDetailsScreen extends StatelessWidget {
  const JobSeekerChatDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 55, left: 15),
        child: SvgPicture.asset("assets/images/chatholo.svg"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13),
                    bottomRight: Radius.circular(13)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.maybePop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: AppColors.blackColor,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/avatarpng.png",
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Sohaib",
                                  style: fontW7S12(context)!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Last Online",
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color: AppColors.blackColor
                                              .withOpacity(0.4)),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "29 Min Agp",
                                      style: fontW7S12(context)!.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                          color: AppColors.appcolor
                                              .withOpacity(0.4)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/audioicon.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/images/videoicon.svg"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  InkWell(onTap: () {}, child: const LeftChatWidget()),
                  const SizedBox(
                    height: 15,
                  ),
                  const RightChatWidget(),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: AppColors.blackColor.withOpacity(0.9)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: AppColors.appcolor.withOpacity(0.5)),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: AppColors.whitecolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 220,
                            child: TextFormField(
                              style: const TextStyle(
                                  color: AppColors.whitecolor, fontSize: 13),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type Message",
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 13)),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.send,
                        color: AppColors.whitecolor.withOpacity(0.6),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
