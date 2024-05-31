import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/shimmer_loader.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/features/Authentication/controller/vendor_controller/vendor_controller.dart';
import 'package:stylesage/features/User_side/Personalization/screens/help/help_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Earning_List/earning_list_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Edit_profile/edit_profile_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Logout/logout_bottomsheet.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/change_password/change_password_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/profile_main/widgets/followers_widget.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/profile_main/widgets/profile_option_tile.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ContentVendorProfile extends StatelessWidget {
  const ContentVendorProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = VendorController.instance;
    return Container(
      decoration: const BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.radiusLarge),
          topRight: Radius.circular(SSizes.radiusLarge),
        ),
      ),
      child: Column(
        children: [
          //content other than the tab bar
          Padding(
            padding: const EdgeInsets.only(
                top: SSizes.lg,
                left: SSizes.lg,
                right: SSizes.lg,
                bottom: SSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (controller.profileLoading.value) {
                    return const SShimmerEffect(width: 100, height: 16);
                  } else {
                    return Text(
                      controller.vendor.value.salonName == ""
                          ? "Your salon name"
                          : controller.vendor.value.salonName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                }),

                Obx(() {
                  if (controller.profileLoading.value) {
                    return const SShimmerEffect(width: 100, height: 14);
                  } else {
                    return Text(
                      controller.vendor.value.address == ""
                          ? "salon address here"
                          : controller.vendor.value.address,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
                }),

                const Divider(
                  color: SColors.dividersColor,
                ),
                //followers and the success rate widget
                const FollowersSuccessRateWidget(),
                const SizedBox(
                  height: SSizes.sm,
                ),

                //preview profile button
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     CustomButton(
                //         onPressedCallback: () {},
                //         buttonText: "Preview Profile",
                //         height: 28,
                //         width: 0.28,
                //         textStyle: Theme.of(context).textTheme.titleMedium!),
                //   ],
                // ),

                //more profile option buttons
                Column(
                  children: [
                    VendorProfileOptionsTile(
                      onPressedCallback: () {
                        Get.to(() => const EditVendorProfileScreen());
                      },
                      leadingIcon: "assets/icons/profile/profile.svg",
                      title: "Your profile",
                    ),
                    // VendorProfileOptionsTile(
                    //   onPressedCallback: () {},
                    //   leadingIcon: "assets/icons/profile/pade.svg",
                    //   title: "Service Info",
                    // ),
                    VendorProfileOptionsTile(
                      onPressedCallback: () {
                        Get.to(() => const VendorChangePasswordScreen());
                      },
                      leadingIcon: "assets/icons/profile/changepassword.svg",
                      title: "Change Password",
                    ),
                    VendorProfileOptionsTile(
                      onPressedCallback: () {
                        Get.to(() => const EarningListScreen());
                      },
                      leadingIcon: "assets/icons/profile/earninglist.svg",
                      title: "Earning List",
                    ),
                    VendorProfileOptionsTile(
                      onPressedCallback: () {
                        Get.to(() => const HelpScreen());
                      },
                      leadingIcon: "assets/icons/profile/help.svg",
                      title: "Help",
                    ),
                    VendorProfileOptionsTile(
                      onPressedCallback: () {
                        showLogoutCustomBottomSheet(context);
                      },
                      leadingIcon: "assets/icons/profile/logout.svg",
                      title: "Log Out",
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
