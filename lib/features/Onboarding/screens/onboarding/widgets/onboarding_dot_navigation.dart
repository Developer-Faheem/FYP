import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylesage/features/Onboarding/controllers/onboarding_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      left: SDeviceUtils.getScreenWidth() * 0.38,
      bottom: SDeviceUtils.getScreenHeight() * 0.08,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        //onDotClicked: controller.dotNavifationClick,
        effect: const ColorTransitionEffect(
            activeDotColor: SColors.secondary, dotColor: SColors.dividersColor),
      ),
    );
  }
}
