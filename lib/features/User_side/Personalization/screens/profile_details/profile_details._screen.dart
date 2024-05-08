import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/User_side/Personalization/controllers/updateProfileController/updateProfileController.dart';
import 'package:stylesage/features/User_side/Personalization/screens/profile_details/widget/profile_form.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final updateDataController = Get.put(UpdateUserProfileController());
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
          body: SingleChildScrollView(
            child: Padding(
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
                  const ProfileForm(),
                  //update button
                  CustomButton(
                      buttonText: "Update Profile",
                      textStyle: Theme.of(context).textTheme.titleLarge!,
                      width: 0.909,
                      height: 44,
                      onPressedCallback: () {
                        if (updateDataController.updateUserProfile.currentState!
                            .validate()) {
                          // If validation passes, perform the signup process
                          updateDataController.updateUserData();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
