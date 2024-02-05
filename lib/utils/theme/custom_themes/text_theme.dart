import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylesage/utils/constants/colors.dart';

class TTextTheme {
  ///light theme text
  static TextTheme lightTextTheme = TextTheme(
    //Used for on onboarding screens
    displayLarge: GoogleFonts.tiroTelugu(
        //final
        fontSize: 29,
        height: 40,
        color: SColors.textPrimary),

    headlineLarge: GoogleFonts.manrope(
        fontSize: 22,
        height: 30.1,
        color: SColors.textPrimary,
        fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.manrope(
        fontSize: 17,
        height: 23.2,
        fontWeight: FontWeight.w600,
        color: SColors.textPrimary),
    headlineSmall: GoogleFonts.manrope(
        fontSize: 16,
        height: 21.9,
        fontWeight: FontWeight.w600,
        color: SColors.textPrimary),

    bodyLarge: GoogleFonts.manrope(fontSize: 14, height: 19.1), //body 1
    bodyMedium: GoogleFonts.manrope(
        fontSize: 13, height: 17.8, color: SColors.textSecondary), //body 2
    bodySmall: GoogleFonts.manrope(
        fontSize: 12, height: 16.4, color: SColors.textPrimary), //final

    labelLarge: GoogleFonts.manrope(fontSize: 13, height: 16.9),
    labelMedium: GoogleFonts.manrope(fontSize: 12, height: 16.4),
  );

  ///dark theme text
  static TextTheme darkTextTheme = const TextTheme();
}
