import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class BookingInfoRowWidget extends StatelessWidget {
  final String iconPath;
  final String data;
  const BookingInfoRowWidget({
    required this.data,
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.md, left: SSizes.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: SSizes.iconSm,
          ),
          const SizedBox(
            width: SSizes.sm,
          ),
          Expanded(
            child: Text(
              data,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
