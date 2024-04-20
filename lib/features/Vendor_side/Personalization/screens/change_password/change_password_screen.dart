import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/change_password/widgets/change_pass_form.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class VendorChangePasswordScreen extends StatelessWidget {
  const VendorChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                title: "Change Password",
                isOutlined: false,
                onPressedCallback: () {
                  Get.back();
                },
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(SSizes.lg),
              child: Column(
                children: [
                  //chnage password msg
                  Text(
                    STextStrings.changePasswordmsg,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                  //change password form
                  const VendorChangePassForm(),
                  SizedBox(
                    height: SDeviceUtils.getScreenHeight() * 0.31,
                  ),
                  //confirmation button
                  CustomButton(
                      buttonText: "Continue",
                      textStyle: Theme.of(context).textTheme.titleLarge!,
                      width: 0.909,
                      height: 44,
                      onPressedCallback: () {
                        Get.back();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
