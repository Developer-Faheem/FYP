import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SocialsButton extends StatelessWidget {
  final String buttonText;
  final String iconPath;

  const SocialsButton({super.key, required this.buttonText, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 38,
          width: SDeviceUtils.getScreenWidth() * 0.29,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: SColors.primary, width: 1),
            borderRadius: BorderRadius.circular(SSizes.radiusLarge),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(iconPath),
              Text(buttonText,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          )),
    );
  }
}
