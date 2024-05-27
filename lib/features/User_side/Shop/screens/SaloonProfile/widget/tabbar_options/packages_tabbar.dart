import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/salonCard_shimmer.dart';
import 'package:stylesage/commons/widgets/cards/package_card.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/package_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Package extends StatelessWidget {
  final VendorModel? vendor;
  const Package({super.key, this.vendor});

  @override
  Widget build(BuildContext context) {
    final packageController = PackageController2.instance;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: SSizes.lg, top: SSizes.md, bottom: SSizes.md),
          child: Row(
            children: [
              Text(
                "Packages",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        //packages cards
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: Obx(() {
              if (packageController.isLoading.value) {
                return const SaloonCardShimmer();
              }

              if (packageController.packages.isEmpty) {
                return const Center(
                  child: Text(
                    "No packages added yet",
                    style: TextStyle(color: SColors.primary),
                  ),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: packageController.packages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: SSizes.md,
                      bottom: SSizes.md,
                      left: SSizes.lg,
                      right: SSizes.lg,
                    ),
                    child: PackageCard(
                        package: packageController.packages[index],
                        vendor: vendor),
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
