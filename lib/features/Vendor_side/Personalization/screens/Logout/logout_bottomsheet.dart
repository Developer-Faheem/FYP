import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class LogoutCustomBottomSheet extends StatelessWidget {
  const LogoutCustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SSizes.radiusLarge),
            topRight: Radius.circular(SSizes.radiusLarge)),
      ),
      height: 192,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 16),
          Center(
              child: Container(
            width: 120,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(SSizes.radiusSmall),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Log Out',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Divider(
            color: SColors.dividersColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              STextStrings.logoutMsg,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomOutlinedButton(
                  buttonText: "Cancel",
                  height: 42,
                  width: 0.26,
                  gradient: SColors.MainOutlinedButtonGradient,
                  textStyle: Theme.of(context).textTheme.headlineMedium!,
                  onPressedCallback: () {
                    Get.back();
                  }),
              CustomButton(
                onPressedCallback: () {
                  AuthenticationRepository.instance.logout();
                },
                buttonText: "Yes",
                height: 42,
                width: 0.26,
                textStyle: Theme.of(context).textTheme.titleLarge!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showLogoutCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(SSizes.radiusLarge)),
    ),
    builder: (BuildContext context) {
      return const LogoutCustomBottomSheet();
    },
  );
}
