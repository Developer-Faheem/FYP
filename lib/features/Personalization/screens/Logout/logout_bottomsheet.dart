import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SSizes.radiusLarge),
            topRight: Radius.circular(SSizes.radiusLarge)),
      ),
      height: 192,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 16),
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
          Divider(
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
          SizedBox(height: 16),
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
                  Get.back();
                },
                buttonText: "Delete",
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

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(SSizes.radiusLarge)),
    ),
    builder: (BuildContext context) {
      return CustomBottomSheet();
    },
  );
}
