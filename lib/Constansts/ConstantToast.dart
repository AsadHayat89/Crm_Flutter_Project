import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantToast {
  static void GetToast(
      String title, String g, Color backgorundColor, Color textColor) {
    Get.snackbar(
      title, g,
      snackPosition: SnackPosition.BOTTOM,
      // position
      duration: Duration(seconds: 2),
      // duration
      backgroundColor: backgorundColor,
      // background color
      colorText: textColor,
      // text color
      borderRadius: 10.0,
      // border radius
      margin: EdgeInsets.all(10.0),
    );
  }
}
