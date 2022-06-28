import 'package:flutter/material.dart';

const TextStyle? primaryTextStyle = TextStyle(
    color: Color(0xff575757),
    fontSize: 16,
    fontFamily: 'Cairo',
    height: 1.87,
    fontWeight: FontWeight.bold);

const TextStyle? secondaryTextStyle = TextStyle(
    color: Color(0xff545658),
    fontSize: 14,
    height: 1.65,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w300);

const appButtonPrimaryColor = Color(0xff17CA82);
const appButtonSecondaryColor = Color(0xff6F6F6F);

final TextButtonThemeData? azkarMainButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: appButtonPrimaryColor,
    primary: Colors.white,
    fixedSize: const Size(220, 56),
  ),
);

const months = {
  1: "يناير",
  2: "فبراير",
  3: "مارس",
  4: "أبريل",
  5: "مايو",
  6: "يونيو",
  7: "يوليو",
  8: "أغسطس",
  9: "سبتمبر",
  10: "أكتوبر",
  11: "نوفمبر",
  12: "ديسمبر",
};
