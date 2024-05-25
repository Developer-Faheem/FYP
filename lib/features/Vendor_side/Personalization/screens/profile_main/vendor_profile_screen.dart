import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Edit_profile/edit_profile_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/profile_main/widgets/ccontent_vendor.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //The header image
              Column(
                children: [
                  Container(
                    height: SDeviceUtils.getScreenHeight() * 0.24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/salon_profile_bg.png'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: SColors.bgMainScreens,
                    ),
                  )
                ],
              ),

              // salon profile main content container
              Positioned(
                top: SDeviceUtils.getScreenHeight() * 0.224,
                bottom: 0,
                left: 0,
                right: 0,
                child:
                    const SingleChildScrollView(child: ContentVendorProfile()),
              ),

              //Edit button
              Positioned(
                right: SDeviceUtils.getScreenHeight() * 0.055,
                top: SDeviceUtils.getScreenHeight() * 0.1999,
                child: CircularButton(
                  onPressedCallback: () {
                    Get.to(() => const EditVendorProfileScreen());
                  },
                  iconPath: "assets/icons/profile/Edit.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
