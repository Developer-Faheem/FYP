import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class ShadowButton extends StatelessWidget {
  final String buttonText;
  final double width; //must be in percent 0-0 - 0.5 - 1.0
  final double height;

  ShadowButton(
      {required this.buttonText, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: SDeviceUtils.getScreenWidth() * width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: SColors.skyEffectColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
        color: Colors.white,
        border: Border.all(color: SColors.primary, width: 2),
        borderRadius: BorderRadius.circular(SSizes.radiusLarge),
      ),
      child: ElevatedButton(
        onPressed: () {}, // Add your onPressed callback here
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // Set transparent background color
        ),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
