import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Shop/controllers/faviouritecontroller/faviourite_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FaviouriteButton extends StatelessWidget {
  String vendorId;

  FaviouriteButton({
    super.key,
    required this.vendorId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FaviouritiesController());
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: SColors.bgMainScreens,
          shape: BoxShape.circle,
          border: Border.all(color: SColors.primary, width: 2),
        ),
        child: Center(
          child: Obx(
            () => controller.isFavourite(vendorId)
                ? GestureDetector(
                    onTap: () => controller.toggleFaviouriteSalon(vendorId),
                    child: SvgPicture.asset(
                      "assets/icons/heartFilled.svg",
                      width: SSizes.iconMd,
                    ),
                  )
                : GestureDetector(
                    onTap: () => controller.toggleFaviouriteSalon(vendorId),
                    child: SvgPicture.asset(
                      "assets/icons/faviourite_outlined.svg",
                      width: SSizes.iconSm,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
