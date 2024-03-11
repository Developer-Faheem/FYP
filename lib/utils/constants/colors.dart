import 'package:flutter/material.dart';

class SColors {
  SColors._();

//App Basic Colors
  static const Color primary = Color(0XFF4D2C5A);
  static const Color secondary = Color(0XFFFE8C8C);
  static const Color tertiary = Color(0XFF1BD4CA);

//gradient Colors
  static Gradient MainOutlinedButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white.withOpacity(0.6), // Lighter shade of white
      SColors.primary.withOpacity(0.2), // Lighter shade of primary color
    ],
    stops: const [0.6, 1.0],
  );

  static Gradient smallOutlinedButtonGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.white.withOpacity(0.8), // Lighter shade of white
      SColors.secondary.withOpacity(0.3), // Lighter shade of primary color
    ],
    stops: const [0.05, 0.2],
  );

  //box shadows
  static BoxShadow cardShadow = BoxShadow(
    color: SColors.primary.withOpacity(0.3),
    spreadRadius: 4,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );

//Text Colors
  static const Color textPrimary =
      Color(0XFF000000); //mostly used in headings and card content
  static const Color textSecondary =
      Color(0XFF694D75); //used mainly for sub heading / price tage etc
  static const Color textTertiary =
      Color(0XFFA9A7A7); //used for lighter shade text
  static const Color textWhite =
      Color(0XFFFFFFFF); //text color for the primary color buttons
  //primary color also used as heading
  static const Color textPurple = Color(0XFF4D2C5A);
  //pinkish color used for authentication pages
  static const Color textPink = Color(0XFFFE8C8C);

//Effects
  static const Color pinkishEffectColor = Color(0XFFFDE7E5);
  static const Color skyEffectColor = Color(0xfff1bd4ca);

//background Colors
  static const Color bgSplashScreen = Color(0XFFFDF4FF);
  static const Color bgOnboardingScreens = Color(0XFFF8F7FC);
  static const Color bgMainScreens = Color(0XFFFFFFFF);

  //e.g => light ,dark

//dividers color
  static const Color dividersColor =
      Color(0XFFA9A7A7); //used for lighter shade text

//background Container colors
  static const Color profileContainer = Color(0XFFA9A7A7);

//button Colors

//border Colors

//error and validation colors
  //error , success, warning , info

//neutral shades
}
