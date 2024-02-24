import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ServicesRectangularWidget extends StatelessWidget {
  final String imagePath;
  final String serviceName;

  const ServicesRectangularWidget(
      {super.key, required this.imagePath, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        Expanded(
          child: Text(
            serviceName,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
