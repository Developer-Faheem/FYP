import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ServicesRoundedWidget extends StatelessWidget {
  final String imagePath;
  final String service;

  const ServicesRoundedWidget(
      {super.key, required this.imagePath, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: SColors.secondary.withOpacity(0.26),
            shape: BoxShape.circle,
            border: Border.all(
              color: SColors.secondary,
              width: 1, // Adjust the border width as needed
            ),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              // width: SSizes.iconMd,
            ),
          ),
        ),
        SizedBox(
          height: SSizes.xs,
        ),
        Text(
          service,
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
