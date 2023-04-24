import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/theme.dart';

class AccountTypeCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final Color borderColor;
  final double elevation;
  final Color fillColor;

  const AccountTypeCardWidget(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      required this.borderColor,
      required this.elevation,
      required this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 150,
        // width: 150,
        child: Card(
          surfaceTintColor: fillColor,
          //  color: fillColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: borderColor),
            borderRadius: BorderRadius.circular(13),
          ),
          elevation: elevation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image),
              const SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: fontW7S12(context)!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
