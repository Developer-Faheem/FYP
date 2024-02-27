import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: SColors.bgMainScreens,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6.0,
              spreadRadius: 4.0,
              //  offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(SSizes.radiusSmall)),
      child: Padding(
        padding: const EdgeInsets.all(SSizes.md),
        child: Column(
          children: [
            //profile and name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/profile/profile.svg",
                      width: 30,
                    ),
                    const SizedBox(width: SSizes.sm),
                    Text(
                      "Jessica Wilson",
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ],
                ),
                Text(
                  '2 months ago',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
            const SizedBox(height: SSizes.md),
            Text(
              STextStrings.review,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
