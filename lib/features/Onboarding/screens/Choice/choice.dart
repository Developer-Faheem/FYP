import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';
import 'package:stylesage/vendor_nav_menu.dart';

class Choice extends StatelessWidget {
  const Choice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
            child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(SSizes.lg),
            child: Column(
              children: [
                SizedBox(
                  height: SDeviceUtils.getScreenHeight() * 0.35,
                ),
                CustomOutlinedButton(
                  onPressedCallback: () {
                    Get.offAll(const LoginScreen());
                  },
                  buttonText: "Start as a User",
                  textStyle: Theme.of(context).textTheme.headlineMedium!,
                  width: 0.909,
                  height: 44,
                  gradient: SColors.MainOutlinedButtonGradient,
                ),
                SizedBox(
                  height: SDeviceUtils.getScreenHeight() * 0.05,
                ),
                CustomOutlinedButton(
                  onPressedCallback: () {
                    Get.offAll(VendorNavigationMenu());
                  },
                  buttonText: "Start as a Vendor",
                  textStyle: Theme.of(context).textTheme.headlineMedium!,
                  width: 0.909,
                  height: 44,
                  gradient: SColors.MainOutlinedButtonGradient,
                ),
              ],
            ),
          ),
        )));
  }
}
