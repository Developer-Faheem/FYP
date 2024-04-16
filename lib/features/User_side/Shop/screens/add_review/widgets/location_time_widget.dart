import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class LocationTimeWidget extends StatelessWidget {
  const LocationTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/location.svg',
                  height: SSizes.iconXS,
                ),
                const SizedBox(
                  width: SSizes.defaultSpacemedium,
                ),
                Text(
                  "0539 NYC, Street #98 ",
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.defaultSpaceSmall,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/clock.svg',
                  height: SSizes.iconXS,
                ),
                const SizedBox(
                  width: SSizes.defaultSpacemedium,
                ),
                Text(
                  "15min . 1.5km  |  Mon - Sun   |  9am - 11pm",
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
