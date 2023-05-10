import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/appcolors.dart';

class RightChatWidget extends StatelessWidget {
  const RightChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 55,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(19),
                        bottomLeft: Radius.circular(19),
                        bottomRight: Radius.circular(19)),
                    color: AppColors.appcolor.withOpacity(0.9)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 🤣',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: AppColors.blackColor.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
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
