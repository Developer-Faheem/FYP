import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/features/Onboarding/controllers/onboarding_controller.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      right: 0,
      bottom: SDeviceUtils.getScreenHeight() * 0.064,
      child: GestureDetector(
          onTap: () => controller.nextPage(),
          child: SvgPicture.asset("assets/icons/next.svg")),
    );
  }
}
