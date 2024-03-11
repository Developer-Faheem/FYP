import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class CustomMsgDialog extends StatelessWidget {
  final String title;
  final String msg;
  final IconData icon;

  const CustomMsgDialog({super.key, required this.icon, required this.msg, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: SColors.bgMainScreens,
      child: Padding(
        padding: const EdgeInsets.all(SSizes.lg),
        child: Container(
          width: 330,
          height: 234,
          decoration: BoxDecoration(
            color: SColors.bgMainScreens,
            borderRadius: BorderRadius.circular(SSizes.radiusLarge),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    color: SColors.secondary, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(SSizes.sm),
                  child: Icon(
                    icon,
                    color: SColors.bgMainScreens,
                    size: SSizes.iconMd,
                  ),
                ),
              ),
              const SizedBox(height: SSizes.md),
              Text(title, style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: SSizes.md),
              Text(
                msg,
                style: Theme.of(context).textTheme.bodyMedium,
                //textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(width: 16),
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
        ),
      ),
    );
  }
}
