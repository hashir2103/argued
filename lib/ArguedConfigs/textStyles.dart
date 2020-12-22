import 'package:argued/ArguedConfigs/color.dart';
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
