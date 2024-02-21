import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ServicesRectangularWidget extends StatelessWidget {
  // final String imagePath;

  const ServicesRectangularWidget({
    super.key,
    // required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SSizes.radiusSmall),
        border: Border.all(
          color: SColors.secondary,
          width: 1.3,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/services/makeUp.svg',
          width: SSizes.iconLg,
        ),
      ),
    );
  }
}
