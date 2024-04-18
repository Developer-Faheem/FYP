import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/features/User_side/Personalization/screens/Logout/logout_bottomsheet.dart';
import 'package:stylesage/features/User_side/Personalization/screens/help/help_screen.dart';
import 'package:stylesage/features/User_side/Shop/screens/add_review/widgets/location_time_widget.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Earning_List/earning_list_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Logout/logout_bottomsheet.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/change_password/change_password_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/change_password/widgets/change_pass_form.dart';
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
                Text(
                  "Enclave Haven",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "0539 NYC, Street #98 , Maine# 23",
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(
                  color: SColors.dividersColor,
                ),
                //followers and the success rate widget
                FollowersSuccessRateWidget(),
                SizedBox(
                  height: SSizes.sm,
                ),

                //preview profile button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        onPressedCallback: () {},
                        buttonText: "Preview Profile",
                        height: 28,
                        width: 0.28,
                        textStyle: Theme.of(context).textTheme.titleMedium!),
                  ],
                ),

                //more profile option buttons
                Column(
                  children: [
                    VendorProfileOptionsTile(
                      onPressedCallback: () {},
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
