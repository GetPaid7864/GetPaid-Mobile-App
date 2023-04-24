import 'package:flutter/material.dart';

import '../utils/appcolors.dart';
import '../utils/theme.dart';

dp({msg, arg}) => debugPrint("\n\x1B[32m $msg =$arg \n ");

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n ",
    );

showSuccessSnackBarMessage(
    {required BuildContext context,
    required String content,
    Color backgroundcolor = AppColors.appcolor,
    Color contentColor = AppColors.whitecolor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: backgroundcolor,
      content: Text(
        content,
        style: fontW4S12(context)!.copyWith(color: contentColor, fontSize: 14),
        overflow: TextOverflow.visible,
      )));
}

showErrorSnackBarMessage(
    {required BuildContext context,
    required String content,
    Color backgroundcolor = AppColors.redColor,
    Color contentColor = AppColors.whitecolor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: backgroundcolor,
      content: Text(
        content,
        style: fontW4S12(context)!.copyWith(color: contentColor, fontSize: 14),
        overflow: TextOverflow.visible,
      )));
}
