import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/appcolors.dart';

class LeftChatWidget extends StatelessWidget {
  const LeftChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(19),
                            bottomLeft: Radius.circular(19),
                            bottomRight: Radius.circular(19)),
                        color: AppColors.blackColor.withOpacity(0.3)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 🤣',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: AppColors.whitecolor.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    surfaceTintColor: AppColors.blackColor.withOpacity(0.5),
                    color: AppColors.blackColor.withOpacity(0.9),
                    splashRadius: 12,
                    onSelected: (String result) {
                      // do something when a menu item is selected
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'option1',
                        child: Text(
                          'Reply',
                          style: TextStyle(
                              color: AppColors.whitecolor.withOpacity(0.7)),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'option2',
                        child: Text(
                          'Copy',
                          style: TextStyle(
                              color: AppColors.whitecolor.withOpacity(0.7)),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'option3',
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: AppColors.whitecolor.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '10:30 pm',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: AppColors.whitecolor.withOpacity(0.6),
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
