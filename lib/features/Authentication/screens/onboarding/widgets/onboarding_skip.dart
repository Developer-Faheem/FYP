import 'package:flutter/material.dart';
import 'package:stylesage/features/Authentication/controllers/onboarding_controller.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      right: 0,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: Text(
          "Skip",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
