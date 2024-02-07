import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SocialsButton extends StatelessWidget {
  final String buttonText;

  SocialsButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 38,
          width: SDeviceUtils.getScreenWidth() * 0.28,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: SColors.primary, width: 2),
            borderRadius: BorderRadius.circular(SSizes.radiusLarge),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.facebook),
              Text(buttonText,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          )),
    );
  }
}
