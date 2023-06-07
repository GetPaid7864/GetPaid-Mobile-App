import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

import '../utils/appcolors.dart';

dp({msg, arg}) => debugPrint("\n\x1B[32m $msg =$arg \n ");

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n ",
    );

showSuccessSnackBarMessage(
    {required String content,
    Color backgroundcolor = AppColors.appcolor,
    Color contentColor = AppColors.whitecolor}) {
  ScaffoldMessenger.of(navstate.currentState!.context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: backgroundcolor,
      content: Text(
        content,
        style: TextStyle(color: contentColor, fontSize: 14),
        overflow: TextOverflow.visible,
      )));
}

showErrorSnackBarMessage(
    {required String content,
    Color backgroundcolor = AppColors.redColor,
    Color contentColor = AppColors.whitecolor}) {
  ScaffoldMessenger.of(navstate.currentState!.context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      backgroundColor: backgroundcolor,
      content: Text(
        content,
        style: TextStyle(color: contentColor, fontSize: 14),
        overflow: TextOverflow.visible,
      )));
}
