import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/salonCard_shimmer.dart';
import 'package:stylesage/commons/widgets/cards/saloon_card.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/User_side/Shop/controllers/salons_controller.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class SalonScreen extends StatelessWidget {
  const SalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;
    final SalonController salonController = SalonController.instance;

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                isOutlined: true,
                title: "Salons",
                onPressedCallback: () {
                  controller.updateIndex(0);
                },
              )),
          body: Obx(() {
            if (salonController.isLoading.value)
              return const SaloonCardShimmer();

            if (salonController.vendors.isEmpty) {
              return const Center(
                child: Text(
                  "No salon added yet",
                  style: TextStyle(color: SColors.primary),
                ),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: salonController.vendors.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: SSizes.md,
                    bottom: SSizes.md,
                    left: SSizes.lg,
                    right: SSizes.lg,
                  ),
                  child: SaloonCard(vendor: salonController.vendors[index]),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
