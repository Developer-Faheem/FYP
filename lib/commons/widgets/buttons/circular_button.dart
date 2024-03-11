import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class CircularButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressedCallback;
  const CircularButton({
    required this.iconPath,
    required this.onPressedCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCallback,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: SColors.bgMainScreens,
          shape: BoxShape.circle,
          border: Border.all(color: SColors.primary, width: 2),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: SSizes.iconSm,
          ),
        ),
      ),
    );
  }
}
