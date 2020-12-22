import 'package:argued/ArguedConfigs/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle bigHeadingText() {
  return GoogleFonts.quicksand(
      color: primaryColor, fontSize: 30, fontWeight: FontWeight.w600);
}

TextStyle smallHeadingText() {
  return GoogleFonts.quicksand(
      color: primaryColor, fontSize: 18, fontWeight: FontWeight.w400);
}

TextStyle normalText() {
  return TextStyle(
      color: primaryTextColor, fontSize: 20);
}

TextStyle appBarTitleText() {
  return TextStyle(
    fontWeight: FontWeight.w600,
      color: primaryColor, fontSize: 22);
}

TextStyle get listTileTitleText {
  return TextStyle(
    fontWeight: FontWeight.w600,
      color: Colors.black, fontSize: 16);
}
TextStyle get listTileTitleText2 {
  return TextStyle(
    fontWeight: FontWeight.w600,
      color: Colors.black, fontSize: 14);
}

TextStyle get listTileSubTitleText {
  return TextStyle(
      color: primaryTextColor, fontSize: 14);
}
TextStyle get listTileTrailingText {
  return TextStyle(
      color: primaryTextColor, fontSize: 12);
}
TextStyle get chipText {
  return TextStyle(
    fontWeight: FontWeight.w500,
      color: primaryColor, fontSize: 14);
}

TextStyle get dropDownMenuText {
  return TextStyle(
    fontWeight: FontWeight.bold,
      color: primaryTextColor, fontSize: 16 );
}


