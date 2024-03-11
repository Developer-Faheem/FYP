import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class LocationWidget extends StatelessWidget {
  final String iconPath;
  final String address;
  const LocationWidget({
    required this.address,
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconPath,
          height: SSizes.iconXS,
        ),
        const SizedBox(
          width: SSizes.defaultSpaceSmall,
        ),
        Expanded(
          child: Text(
            address,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
