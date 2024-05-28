import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/completed_card_shimmer.dart';
import 'package:stylesage/commons/widgets/cards/faviourite_card.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/faviouritecontroller/faviourite_controller.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;
    final favouriteController = Get.put(FaviouritiesController());

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: CustomAppbar1(
              title: "Favourities",
              isOutlined: true,
              onPressedCallback: () {
                controller.updateIndex(0);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Obx(
              () => FutureBuilder<List<VendorModel>>(
                future: favouriteController.favoriteSalons(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: List.generate(
                          3,
                          (index) => const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SSizes.md,
                                  horizontal: SSizes.lg,
                                ),
                                child: CompletedCardShimmer(),
                              )),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Column(
                        children: [
                          SizedBox(height: SSizes.lg),
                          Text('No favorite salons found'),
                        ],
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Column(
                        children: [
                          SizedBox(height: SSizes.lg),
                          Text('No favorite salons found'),
                        ],
                      ),
                    );
                  } else {
                    final favoriteSalons = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap:
                          true, // Use shrinkWrap to avoid unbounded height error
                      physics:
                          NeverScrollableScrollPhysics(), // Disable scrolling of ListView
                      itemCount: favoriteSalons.length,
                      itemBuilder: (context, index) {
                        final salon = favoriteSalons[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: SSizes.md,
                            horizontal: SSizes.lg,
                          ),
                          child: FaviouriteCard(vendor: salon),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
