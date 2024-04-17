import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/notificationScreen/notification_screen.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class VendorHeader extends StatelessWidget {
  const VendorHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Enclave Haven",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: SSizes.lg,
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: 30.5,
            ),
          ),
        ),
      ],
    );
  }
}
