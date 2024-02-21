import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class RatingsWidget extends StatelessWidget {
  final String rating;
  final double height;
  final double width;

  const RatingsWidget({
    super.key,
    required this.rating,
    this.height = 28,
    this.width = 65,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SSizes.radiusLarge),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white.withOpacity(0.3), // Lighter shade of white
            SColors.skyEffectColor
                .withOpacity(0.3), // Lighter shade of primary color
          ],
          // stops: [0.35, 0.65], // Adjust stops for smoother transition
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/icons/star.svg',
            height: SSizes.iconXS,
          ),
          Text(
            rating,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
