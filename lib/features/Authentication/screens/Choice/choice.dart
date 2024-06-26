import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Authentication/controller/choice_controller/choice_controller.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/Authentication/controller/vendor_controller/vendor_controller.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';
import 'package:stylesage/vendor_nav_menu.dart';

class Choice extends StatelessWidget {
  const Choice({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final vendorController = Get.put(VendorController());
    final roleController = Get.put(RoleController());
    return Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
            child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(SSizes.lg),
            child: Column(
              children: [
                SizedBox(
                  height: SDeviceUtils.getScreenHeight() * 0.15,
                ),
                Image(
                  image: AssetImage("assets/images/onboarding/choice.jpg"),
                  height: 300,
                  width: 500,
                ),
                SizedBox(
                  height: SDeviceUtils.getScreenHeight() * 0.04,
                ),
                Text("Choose to become a User or a Vendor"),
                Text("This is one time operation"),
                SizedBox(
                  height: SDeviceUtils.getScreenHeight() * 0.04,
                ),
                CustomOutlinedButton(
                  onPressedCallback: () async {
                    await roleController.storeUserRole('user', true);
                    await userController.saveUserRecord();
                    Get.offAll(UserNavigationMenu());
                  },
                  buttonText: "Start as a User",
                  textStyle: Theme.of(context).textTheme.headlineMedium!,
                  width: 0.909,
                  height: 44,
                  gradient: SColors.MainOutlinedButtonGradient,
                ),
                SizedBox(
                  height: SDeviceUtils.getScreenHeight() * 0.02,
                ),
                CustomOutlinedButton(
                  onPressedCallback: () async {
                    await roleController.storeUserRole('vendor', true);
                    await vendorController.saveVendorRecord();
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
