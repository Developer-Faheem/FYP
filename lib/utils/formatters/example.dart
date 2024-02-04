import 'package:flutter/material.dart';

class SFormatter {
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

//navigator for navigation

//checking mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

//get screen height
//getscreen width
//getformatted date
//pricing calculator
//tax calculation etc
}
