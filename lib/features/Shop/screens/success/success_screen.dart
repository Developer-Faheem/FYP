import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Shop/screens/Summary_Appointment/appointment_summary.dart';
import 'package:stylesage/navigation_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(SSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SDeviceUtils.getScreenHeight() * 0.3,
              ),
              SvgPicture.asset("assets/icons/success.svg"),
              const SizedBox(
                height: SSizes.md,
              ),
              Text(
                STextStrings.success,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(letterSpacing: 2),
              ),
              Text(
                STextStrings.successmsg,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: SDeviceUtils.getScreenHeight() * 0.3,
              ),
              CustomButton(
                onPressedCallback: () {
                  Get.offAll(const AppointmentSummaryScreen());
                },
                buttonText: "Review Summary",
                textStyle: Theme.of(context).textTheme.titleLarge!,
                width: 0.909,
                height: 44,
              ),
              const SizedBox(
                height: SSizes.md,
              ),
              CustomOutlinedButton(
                onPressedCallback: () {
                  controller.updateIndex(0);
                  Get.offAll(() => NavigationMenu());
                },
                buttonText: "Back to Home",
                textStyle: Theme.of(context).textTheme.bodyMedium!,
                width: 0.909,
                height: 44,
                gradient: SColors.MainOutlinedButtonGradient,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
