import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/features/Authentication/controllers/onboarding_controller.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingPrevious extends StatelessWidget {
  const OnboardingPrevious({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      left: 0,
      bottom: SDeviceUtils.getScreenHeight() * 0.064,
      child: GestureDetector(
        onTap: () => controller.previousPage(),
        child: SvgPicture.asset("assets/icons/back_outlined.svg"),
      ),
    );
  }
}
