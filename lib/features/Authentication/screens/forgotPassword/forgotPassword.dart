import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

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
                        TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF694D75)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: SColors.primary),
                            ),
                          ),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.085,
                    ),
                    //verify
                    Center(
                      child: CustomButton(
                          buttonText: "Send",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          width: 0.909,
                          height: 44,
                          onPressedCallback: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
