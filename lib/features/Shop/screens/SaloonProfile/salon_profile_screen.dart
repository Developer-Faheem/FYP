import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/main_content.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/reviews_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SalonProfileScreen extends StatelessWidget {
  const SalonProfileScreen({super.key});

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

              //salon profile main content container
              Positioned(
                top: SDeviceUtils.getScreenHeight() * 0.224,
                bottom: 0,
                left: 0,
                right: 0,
                child: MainContent(),
              ),

              //Ratings Widget
              Positioned(
                top: SDeviceUtils.getScreenHeight() * 0.2065,
                left: SDeviceUtils.getScreenWidth() * 0.5 - 152 / 2,
                child: const ReviewWidget(
                  ratings: "14.5K (1K+ Reviews)",
                ),
              ),

              //back button
              Positioned(
                left: SSizes.lg,
                top: SSizes.lg,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/icons/back_filled.svg"),
                ),
              ),

              //favourite button
              Positioned(
                right: SSizes.lg,
                top: SDeviceUtils.getScreenHeight() * 0.1565,
                child: CircularButton(
                  onPressedCallback: () {},
                  iconPath: "assets/icons/faviourite_outlined.svg",
                ),
              ),

              //share button
              Positioned(
                right: SDeviceUtils.getScreenHeight() * 0.095,
                top: SDeviceUtils.getScreenHeight() * 0.1565,
                child: CircularButton(
                  onPressedCallback: () {},
                  iconPath: "assets/icons/share.svg",
                ),
              ),

              //book appointment button
              Positioned(
                bottom: 0,
                child: Container(
                  height: 65,
                  width: SDeviceUtils.getScreenWidth(),
                  decoration: BoxDecoration(
                    color: SColors.bgMainScreens,
                    border: Border.all(color: SColors.dividersColor),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(SSizes.radiusLarge),
                      topRight: Radius.circular(SSizes.radiusLarge),
                    ),
                  ),
                  child: Center(
                    child: CustomButton(
                        buttonText: "Book Appointment",
                        textStyle: Theme.of(context).textTheme.titleLarge!,
                        width: 0.909,
                        height: 44,
                        onPressedCallback: () {}),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
