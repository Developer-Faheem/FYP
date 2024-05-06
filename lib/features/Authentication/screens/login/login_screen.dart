import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/socials_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/form_divider.dart';
import 'package:stylesage/features/Authentication/controller/login_controller.dart/login_controller.dart';
import 'package:stylesage/features/Authentication/screens/SignUp/singnup_screen.dart';
import 'package:stylesage/features/Authentication/screens/login/widgets/login_form.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

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
                    title: STextStrings.login,
                    subTitle: STextStrings.loginTitle,
                  ),

                  SizedBox(
                    height: SDeviceUtils.getScreenHeight() * 0.05,
                  ),
                  //Login Form
                  const LoginForm(),

                  const SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                  //continue
                  Center(
                    child: CustomButton(
                        buttonText: "Continue",
                        textStyle: Theme.of(context).textTheme.titleLarge!,
                        width: 0.909,
                        height: 44,
                        onPressedCallback: () {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            // If validation passes, perform the signup process
                            controller.signin();
                          }
                        }),
                  ),
                  SizedBox(
                    height: SDeviceUtils.getScreenHeight() * 0.05,
                  ),
                  //Divider
                  const FormDivider(),
                  SizedBox(
                    height: SDeviceUtils.getScreenHeight() * 0.05,
                  ),
                  //social buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.googleSignIn();
                        },
                        child: const SocialsButton(
                            buttonText: "Google",
                            iconPath: 'assets/icons/google.svg'),
                      ),
                      const SocialsButton(
                          buttonText: "Apple",
                          iconPath: 'assets/icons/apple.svg'),
                      const SocialsButton(
                          buttonText: "Facebook",
                          iconPath: 'assets/icons/facebook.svg')
                    ],
                  ),
                  SizedBox(
                    height: SDeviceUtils.getScreenHeight() * 0.08,
                  ),
                  //last section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        STextStrings.loginQuestion,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => const SignUpScreen());
                        },
                        child: Text(
                          " Sign up ",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Text(
                        "here",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
