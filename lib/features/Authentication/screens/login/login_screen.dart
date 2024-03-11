import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/socials_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/form_divider.dart';
import 'package:stylesage/features/Authentication/screens/SignUp/singnup_screen.dart';
import 'package:stylesage/features/Authentication/screens/login/widgets/login_form.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/features/Authentication/screens/verification/verification_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      title: STextStrings.login,
                      subTitle: STextStrings.loginTitle,
                    ),

                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    //Login Form
                    const LoginForm(),
                    //keep me sign in
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text(
                          "Keep me ",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          "signed in",
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    ),
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
                            Get.off(() => const VerificationScreen());
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialsButton(
                            buttonText: "Google",
                            iconPath: 'assets/icons/google.svg'),
                        SocialsButton(
                            buttonText: "Apple",
                            iconPath: 'assets/icons/apple.svg'),
                        SocialsButton(
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
        ));
  }
}
