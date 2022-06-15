import 'package:flutter/cupertino.dart';
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
