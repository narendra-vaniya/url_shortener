import 'package:flutter/material.dart';

class UtilsHelper {
  static width(BuildContext context) => MediaQuery.of(context).size.width;
  static height(BuildContext context) => MediaQuery.of(context).size.height;

  static bool isSmall(BuildContext context) => width(context) <= 480.0;
  static bool isMedia(BuildContext context) =>
      width(context) > 480.0 && width(context) <= 768;
  static bool isLarge(BuildContext context) =>
      width(context) > 768 && width(context) <= 1024;
  static bool isELarge(BuildContext context) => width(context) > 1024.0;

  static double headingFontSize(BuildContext context) {
    if (isSmall(context)) {
      return 0.075 * width(context);
    } else if (isMedia(context)) {
      return 0.07 * width(context);
    } else if (isLarge(context)) {
      return 0.06 * width(context);
    } else {
      return 0.05 * width(context);
    }
  }

  static double paddingSize(BuildContext context) {
    if (isSmall(context)) {
      return 0.12 * width(context);
    } else if (isMedia(context)) {
      return 0.20 * width(context);
    } else if (isLarge(context)) {
      return 0.24 * width(context);
    } else {
      return 0.28 * width(context);
    }
  }

  static double bodyFontSize(BuildContext context) {
     if (isSmall(context)) {
      return 0.035 * width(context);
    } else if (isMedia(context)) {
      return 0.025 * width(context);
    } else if (isLarge(context)) {
      return 0.02 * width(context);
    } else {
      return 0.015 * width(context);
    }
  }
}
