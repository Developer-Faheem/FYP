import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Personalization/screens/Logout/logout_bottomsheet.dart';
import 'package:stylesage/features/Personalization/screens/help/help_screen.dart';
import 'package:stylesage/features/Personalization/screens/privacy_policy/privacyPolicy_screen.dart';
import 'package:stylesage/features/Personalization/screens/profile_details/profile_details._screen.dart';
import 'package:stylesage/features/Personalization/screens/profile_main/widgets/followers_dialog.dart';
import 'package:stylesage/features/Personalization/screens/profile_main/widgets/profile_options_tile.dart';
import 'package:stylesage/features/Personalization/screens/profile_main/widgets/profile_widget.dart';
import 'package:stylesage/features/Personalization/screens/settings/SettingsScreen.dart';
import 'package:stylesage/features/Shop/screens/Home/HomeScreen.dart';
import 'package:stylesage/navigation_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                title: "Profile",
                isOutlined: false,
                onPressedCallback: () {
                  //Get.offAll(() => HomeScreen());
                  controller.updateIndex(0);
                },
              )),
          body: Padding(
            padding: const EdgeInsets.all(SSizes.lg),
            child: Column(
              children: [
                // widget containing profile image, name and followers
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FollowersDialog();
                        },
                      );
                    },
                    child: const ProfileWidget()),

                const SizedBox(
                  height: SSizes.spaceBtwSections,
                ),

                //profile options tile
                ProfileOptionsTile(
                  onPressedCallback: () {
                    Get.to(() => const ProfileDetailsScreen());
                  },
                  leadingIcon: "assets/icons/profile/profile.svg",
                  title: "Your profile",
                ),
                ProfileOptionsTile(
                  onPressedCallback: () {
                    Get.to(() => const SettingsScreen());
                  },
                  leadingIcon: "assets/icons/profile/settings.svg",
                  title: "Settings",
                ),
                ProfileOptionsTile(
                  onPressedCallback: () {
                    Get.to(() => const PrivacyPolicyScreen());
                  },
                  leadingIcon: "assets/icons/profile/privacy.svg",
                  title: "Privacy Policy",
                ),
                ProfileOptionsTile(
                  onPressedCallback: () {
                    Get.to(() => const HelpScreen());
                  },
                  leadingIcon: "assets/icons/profile/help.svg",
                  title: "Help",
                ),
                ProfileOptionsTile(
                  onPressedCallback: () {
                    showCustomBottomSheet(context);
                  },
                  leadingIcon: "assets/icons/profile/logout.svg",
                  title: "Log Out",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
