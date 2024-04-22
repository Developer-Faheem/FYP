import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/features/Onboarding/controllers/onboarding_controller.dart';
import 'package:stylesage/features/Onboarding/screens/Choice/choice.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/widgets/onboarding_next.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/widgets/onboarding_page.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/widgets/onboarding_previous.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Container(
        color: SColors.bgOnboardingScreens,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Obx(
                  () => Stack(
                    children: [
                      //for sliding pages
                      PageView(
                        controller: controller.pageController,
                        onPageChanged: controller.updatePageIndicator,
                        children: [
                          const OnboardingPage(
                            imageUrl: SImages.onboarding_1,
                            title: STextStrings.title_1,
                            subtitle: STextStrings.subtitle_1,
                          ),
                          const OnboardingPage(
                            imageUrl: SImages.onboarding_2,
                            title: STextStrings.title_2,
                            subtitle: STextStrings.subtitle_2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SDeviceUtils.getScreenHeight() * 0.1,
                            ),
                            child: const OnboardingPage(
                              imageUrl: SImages.onboarding_3,
                              title: STextStrings.title_3,
                              subtitle: STextStrings.subtitle_3,
                              width: 0.6,
                              height: 0.4,
                            ),
                          ),
                        ],
                      ),
                      //things to be shown for 0th nd 1st page only
                      if (controller.currentPageIndex.value != 2) ...[
                        const OnboardingSkip(),
                        OnboardingNext(
                          onPressedCallback: () => controller.nextPage(),
                        ),
                      ],

                      //On all Pages
                      const OnboardingDotNavigation(),

                      //for the 2nd page (last)
                      if (controller.currentPageIndex.value == 2) ...[
                        OnboardingNext(
                          onPressedCallback: () {
                            final storage = GetStorage();
                            storage.write("isFirstTime", false);
                            Get.offAll(const Choice());
                          },
                        ),
                      ],

                      //for 1st and 2nd page
                      if (controller.currentPageIndex.value == 1 ||
                          controller.currentPageIndex.value == 2)
                        const OnboardingPrevious(),
                    ],
                  ),
                )),
          ),
        ));
  }
}
