import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/Login-signup/header.dart';
import 'package:stylesage/features/Authentication/screens/forgotPassword/forgotPassword.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FocusNode> focusNodes =
        List.generate(4, (index) => FocusNode());
    final List<TextEditingController> controllers =
        List.generate(4, (index) => TextEditingController());

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
                      title: STextStrings.verifyTitle,
                      subTitle: STextStrings.verifysubtitle,
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.01,
                    ),
                    Center(
                      child: Text(
                        "example@gmail.com",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.065,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: SizedBox(
                                height: 45,
                                width: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFF694D75),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: SColors.tertiary, width: 2),
                                    ),
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  controller: controllers[index],
                                  focusNode: focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      focusNodes[index].nextFocus();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.065,
                    ),
                    //resend code
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't received OTP!",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: SDeviceUtils.getScreenHeight() * 0.01,
                        ),
                        Text(
                          "Resend code",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.05,
                    ),
                    //verify
                    Center(
                      child: CustomButton(
                          buttonText: "Verify",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          width: 0.909,
                          height: 44,
                          onPressedCallback: () {
                            Get.off(() => const ForgotPassword());
                            //  String otp = _controllers.map((controller) => controller.text).join();
                            //   print('Entered OTP: $otp');
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
