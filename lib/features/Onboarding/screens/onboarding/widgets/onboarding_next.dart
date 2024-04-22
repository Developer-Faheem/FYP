import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/features/Onboarding/controllers/onboarding_controller.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingNext extends StatelessWidget {
  final VoidCallback onPressedCallback;

  const OnboardingNext({
    required this.onPressedCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: SDeviceUtils.getScreenHeight() * 0.064,
      child: GestureDetector(
          onTap: onPressedCallback,
          child: SvgPicture.asset("assets/icons/next.svg")),
    );
  }
}
