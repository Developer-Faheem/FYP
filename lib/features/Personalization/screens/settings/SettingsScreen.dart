import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/commons/widgets/dialog-box/custom_dialog.dart';
import 'package:stylesage/features/Personalization/screens/change_password/change_password_screen.dart';
import 'package:stylesage/features/Personalization/screens/profile_main/widgets/profile_options_tile.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                title: "Settings",
                isOutlined: false,
                onPressedCallback: () {
                  Get.back();
                },
              )),
          body: Padding(
            padding: const EdgeInsets.all(SSizes.lg),
            child: Column(
              children: [
                ProfileOptionsTile(
                  onPressedCallback: () {
                    Get.to(() => const ChangePasswordScreen());
                  },
                  leadingIcon: "assets/icons/profile/passwordManger.svg",
                  title: "Password Manager",
                ),
                ProfileOptionsTile(
                  onPressedCallback: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomMsgDialog(
                          title: "Delete Account",
                          msg: STextStrings.deletePopup,
                          icon: Icons.info_outline,
                        );
                      },
                    );
                  },
                  leadingIcon: "assets/icons/profile/deleteAccount.svg",
                  title: "Delete Account",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
