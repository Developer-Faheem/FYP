import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/shimmer_loader.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
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
    final userController = Get.put(UserController());

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
                  Obx(() {
                    return userController.user.value.profilePicture != ""
                        ? CircleAvatar(
                            radius: 42, // Adjust the radius to fit your design
                            backgroundImage: NetworkImage(
                              userController.user.value.profilePicture,
                            ),
                          )
                        : SvgPicture.asset(
                            height: 66,
                            "assets/icons/profile/profile.svg",
                          );
                  }),

                  TextButton(
                      onPressed: () {
                        userController.uploadUserProfilePicture();
                      },
                      child: Text(
                        'change profile picture',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),

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
