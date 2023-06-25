import 'package:flutter/material.dart';
import 'package:get_paid/utils/appcolors.dart';
import 'package:get_paid/utils/theme.dart';

class SkillViewCardWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SkillViewCardWidget({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(width: 1, color: AppColors.appcolor)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: fontW4S12(context)!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              // InkWell(
              //     onTap: onTap,
              //     child: Icon(
              //       Icons.clear,
              //       size: 20,
              //       color: AppColors.appcolor,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
