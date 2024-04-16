import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ReviewWidget extends StatelessWidget {
  final String ratings;
  const ReviewWidget({
    required this.ratings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 152,
      decoration: const BoxDecoration(
        color: SColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.radiusLarge),
          bottomLeft: Radius.circular(SSizes.radiusLarge),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/icons/star.svg",
            width: SSizes.iconSm,
          ),
          Text(
            ratings,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      )),
    );
  }
}
