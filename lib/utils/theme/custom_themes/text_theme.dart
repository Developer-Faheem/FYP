import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylesage/utils/constants/colors.dart';

class TTextTheme {
  ///light theme text
  static TextTheme lightTextTheme = TextTheme(
    //Used for on onboarding screens  height: 40,
    displayLarge:
        GoogleFonts.tiroTelugu(fontSize: 29, color: SColors.textPrimary),

    headlineLarge: GoogleFonts.manrope(
        fontSize: 22,
        //  height: 30.1,
        color: SColors.textPrimary,
        fontWeight: FontWeight.bold),

    headlineMedium: GoogleFonts.manrope(
        fontSize: 16,
        // height: 21.9,
        fontWeight: FontWeight.w600,
        color: SColors.textPrimary),

    headlineSmall: GoogleFonts.manrope(
        fontSize: 14, fontWeight: FontWeight.w600, color: SColors.textPrimary),

    bodyLarge: GoogleFonts.manrope(
        fontSize: 14,
        color: SColors.textPurple,
        fontWeight: FontWeight.w700), //body 1 height: 19.1,
    bodyMedium: GoogleFonts.manrope(
        fontSize: 14, color: SColors.textSecondary), //body 2 height: 17.8,
    bodySmall:
        GoogleFonts.manrope(fontSize: 13, color: SColors.textSecondary), //final

    labelLarge: GoogleFonts.manrope(fontSize: 14, color: SColors.textTertiary),
    labelMedium: GoogleFonts.manrope(fontSize: 12, color: SColors.textTertiary),
    labelSmall: GoogleFonts.manrope(
        fontSize: 12,
        color: SColors.textPrimary,
        height: 1.5,
        fontWeight: FontWeight.w600),

    titleLarge: GoogleFonts.manrope(
        fontSize: 16, color: SColors.textWhite, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.manrope(
        fontSize: 12, color: SColors.textWhite, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.manrope(
        fontSize: 12, color: SColors.textPink, fontWeight: FontWeight.w600),
  );

  ///dark theme text
  static TextTheme darkTextTheme = const TextTheme();
}
