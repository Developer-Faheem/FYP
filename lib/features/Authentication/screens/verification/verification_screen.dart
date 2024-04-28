import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/features/Authentication/controller/signUp/verify_email_controller.dart';
import 'package:stylesage/features/Authentication/screens/forgotPassword/forgotPassword.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class VerificationScreen extends StatelessWidget {
  final String? email;

  const VerificationScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Column(
                  children: [
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.08,
                    ),
                    Image.asset(
                      SImages.verificationImage,
                      width: 250,
                    ),

                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    Text(
                      "Verify Your Email Address",
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.01,
                    ),
                    Text(
                      STextStrings.verificatiomScreentext,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    //verify
                    Center(
                      child: CustomButton(
                          buttonText: "Continue",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          width: 0.909,
                          height: 44,
                          onPressedCallback: () {
                            Get.off(() => const ForgotPassword());
                            //  String otp = _controllers.map((controller) => controller.text).join();
                            //   print('Entered OTP: $otp');
                          }),
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    Text(
                      "Resend Email",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
