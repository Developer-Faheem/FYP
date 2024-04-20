import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Edit_profile/widgets/edit_content_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class EditVendorProfileScreen extends StatelessWidget {
  const EditVendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                  onPressedCallback: () {
                    Get.back();
                  },
                  title: "Edit Business Profile ",
                  isOutlined: false)),
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
                child: const SingleChildScrollView(child: EditContent()),
              ),

              //Edit button
              Positioned(
                right: SDeviceUtils.getScreenHeight() * 0.055,
                top: SDeviceUtils.getScreenHeight() * 0.1999,
                child: CircularButton(
                  onPressedCallback: () {},
                  iconPath: "assets/icons/profile/Edit.svg",
                ),
              ),

              //Salon Name & address
              Positioned(
                left: SDeviceUtils.getScreenHeight() * 0.029,
                top: SDeviceUtils.getScreenHeight() * 0.16,
                child: Text(
                  "Enclave Haven",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Positioned(
                left: SDeviceUtils.getScreenHeight() * 0.029,
                top: SDeviceUtils.getScreenHeight() * 0.19,
                child: Text(
                  "0539 NYC, Street #98 , Maine# 23",
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
