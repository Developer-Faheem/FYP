import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Authentication/controller/forgotPassword_controller/forgotPassword_controller.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class ForgotPasswordEmailsent extends StatelessWidget {
  final String? email;

  const ForgotPasswordEmailsent({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {
                      AuthenticationRepository.instance.logout();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: SColors.primary,
                    ))
              ],
            ),
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
                      "Password Reset Email Sent",
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.007,
                    ),
                    Text(
                      email ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.007,
                    ),
                    Text(
                      STextStrings.emailSent,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    //verify
                    Center(
                      child: CustomButton(
                          buttonText: "Done",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          width: 0.909,
                          height: 44,
                          onPressedCallback: () =>
                              Get.offAll(() => const LoginScreen())),
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.025,
                    ),
                    CustomOutlinedButton(
                      onPressedCallback: () =>
                          controller.reSendPasswordResetEmail(email!),
                      buttonText: "Resend Email",
                      textStyle: Theme.of(context).textTheme.headlineMedium!,
                      width: 0.909,
                      height: 44,
                      gradient: SColors.MainOutlinedButtonGradient,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
