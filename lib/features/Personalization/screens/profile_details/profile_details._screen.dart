import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Personalization/screens/change_password/change_password_screen.dart';
import 'package:stylesage/features/Personalization/screens/profile_details/widget/profile_form.dart';
import 'package:stylesage/features/Personalization/screens/profile_main/profile_screen.dart';
import 'package:stylesage/features/Personalization/screens/profile_main/widgets/profile_options_tile.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Get.back();
                },
              )),
          body: Padding(
            padding: const EdgeInsets.all(SSizes.lg),
            child: Column(
              children: [
                //profile subtitle
                Text(
                  STextStrings.profileSubtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: SSizes.spaceBtwSections,
                ),
                //Avatar for profile picture
                SvgPicture.asset(
                  "assets/icons/profile/profile.svg",
                  width: 152,
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                // form for details of users
                ProfileForm(),
                //update button
                CustomButton(
                    buttonText: "Update Profile",
                    textStyle: Theme.of(context).textTheme.titleLarge!,
                    width: 0.909,
                    height: 44,
                    onPressedCallback: () {
                      Get.to(() => const ProfileScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
