import 'package:flutter/material.dart';
import 'package:get_paid/helpers/navigatorHelper.dart';

showSuccessSnackBarMessage({required String message}) {
  ScaffoldMessenger.of(navstate.currentState!.context)
      //  ..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        style: TextStyle(
            overflow: TextOverflow.visible,
            //  color: AppTheme.themeData.,
            fontSize: 15),
        //  overflow: TextOverflow.visible,
      ),
    ),
  );
}

showErrorSnackBarMessage({required String message}) {
  ScaffoldMessenger.of(navstate.currentState!.context)
      //..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      //clipBehavior: Clip.none,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        style: TextStyle(
            overflow: TextOverflow.visible, color: Colors.white, fontSize: 15),
        // overflow: TextOverflow.visible,
      ),
    ),
  );
}

showSnackBarMessageXc({
  required String message,
}) {
  ScaffoldMessenger.of(navstate.currentState!.context)
      // ..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 15),
        // overflow: TextOverflow.visible,
      ),
    ),
  );
}
