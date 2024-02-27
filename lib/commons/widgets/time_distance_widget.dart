import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class TimeDistanceWidget extends StatelessWidget {
  final String iconPath;
  final String text1;
  final String text2;
  const TimeDistanceWidget({
    required this.iconPath,
    required this.text1,
    required this.text2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          height: SSizes.iconXS,
        ),
        const SizedBox(
          width: SSizes.defaultSpaceSmall,
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                text1,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                " | ",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(
                child: Text(
                  text2,
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
