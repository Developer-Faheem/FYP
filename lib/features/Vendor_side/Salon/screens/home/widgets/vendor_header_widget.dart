import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/shimmer_loader.dart';
import 'package:stylesage/features/Authentication/controller/choice_controller/choice_controller.dart';
import 'package:stylesage/features/Authentication/controller/vendor_controller/vendor_controller.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/notificationScreen/notification_screen.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class VendorHeader extends StatelessWidget {
  const VendorHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorController());
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.profileLoading.value) {
                return const SShimmerEffect(width: 80, height: 22);
              } else {
                return Text(
                  controller.vendor.value.salonName == ""
                      ? "Setup your profile first!"
                      : controller.vendor.value.salonName,
                  //"Hello, Enclave Haven",
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              }
            }),
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(
      //       right: SSizes.lg,
      //     ),
      //     child: GestureDetector(
      //       onTap: () {
      //         Get.to(() => const NotificationScreen());
      //       },
      //       child: SvgPicture.asset(
      //         'assets/icons/bell.svg',
      //         height: 30.5,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
