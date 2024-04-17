import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';
import 'package:stylesage/vendor_nav_menu.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Column(
                  children: [
                    //login/sign up header
                    const LoginHeader(
                      title: STextStrings.forgetPassword,
                      subTitle: STextStrings.forgetSubtile,
                    ),

                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.065,
                    ),

                    //email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(STextStrings.emailAddress,
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(
                          height: SSizes.defaultSpaceSmall,
                        ),
                        const CustomTextField()
                      ],
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.085,
                    ),
                    //send
                    Center(
                      child: CustomButton(
                          buttonText: "Send",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          width: 0.909,
                          height: 44,
                          onPressedCallback: () {
                            Get.to(() => VendorNavigationMenu());
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
