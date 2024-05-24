import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer_loader.dart';
import 'package:stylesage/features/Authentication/controller/vendor_controller/vendor_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FollowersSuccessRateWidget extends StatelessWidget {
  const FollowersSuccessRateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = VendorController.instance;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SSizes.radiusSmall),
          color: SColors.secondary.withOpacity(0.25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Obx(() {
                  if (controller.profileLoading.value) {
                    return const SShimmerEffect(width: 40, height: 22);
                  } else {
                    return Text(
                      controller.vendor.value.followers.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    );
                  }
                }),
                Text(
                  "Followers",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Container(
              width: 2,
              height: 35,
              color: SColors.tertiary,
            ),
            Column(
              children: [
                Text(
                  "90%",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Success Rate",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
