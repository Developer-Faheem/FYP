import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/socials_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/form_divider.dart';
import 'package:stylesage/features/Authentication/screens/SignUp/widgets/signup_form.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                      title: STextStrings.signup,
                      subTitle: STextStrings.signupTitle,
                    ),

                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.035,
                    ),
                    //Login Form
                    const SignUpForm(),
                    //keep me sign in

                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.035,
                    ),
                    //continue
                    Center(
                      child: CustomButton(
                          buttonText: "Sign Up",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          width: 0.909,
                          height: 44,
                          onPressedCallback: () {
                            Get.to(() => const LoginScreen());
                          }),
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.035,
                    ),
                    //Divider
                    const FormDivider(),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.035,
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
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    //last section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          STextStrings.signupQuestion,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => const LoginScreen());
                          },
                          child: Text(
                            " Login",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
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
