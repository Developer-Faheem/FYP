import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  final double width;
  final double height;

  OnboardingPage(
      {this.height = 0.6,
      this.width = 0.8,
      required this.imageUrl,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          height: SDeviceUtils.getScreenHeight() * height,
          width: SDeviceUtils.getScreenWidth() * width,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
