import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextStyle? primaryTextStyle = TextStyle(
    color: const Color(0xff575757),
    fontSize: 16,
    fontFamily: 'Cairo',
    height: 1.87,
    fontWeight: FontWeight.bold);

final TextStyle? secondaryTextStyle = TextStyle(
    color: const Color(0xff545658),
    fontSize: 14,
    height: 1.65,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w300);

final appButtonPrimaryColor = Color(0xff17CA82);
final appButtonSecondaryColor = Color(0xff6F6F6F);

final TextButtonThemeData? AzkarMainButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: appButtonPrimaryColor,
    primary: Colors.white,
    fixedSize: const Size(220, 56),
  ),
);
