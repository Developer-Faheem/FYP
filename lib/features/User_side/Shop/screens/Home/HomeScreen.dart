import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/salonCard_shimmer.dart';
import 'package:stylesage/commons/widgets/cards/saloon_card.dart';
import 'package:stylesage/commons/widgets/dialog-box/filter_dialog/filterMain.dart';
import 'package:stylesage/commons/widgets/services_rounded.dart';
import 'package:stylesage/features/User_side/Shop/controllers/home_controllers/salon_search_controller.dart';
import 'package:stylesage/features/User_side/Shop/controllers/salons_controller.dart';
import 'package:stylesage/features/User_side/Shop/screens/Home/widgets/carousel.dart';
import 'package:stylesage/features/User_side/Shop/screens/Home/widgets/data.dart';
import 'package:stylesage/features/User_side/Shop/screens/Home/widgets/search_field.dart';
import 'package:stylesage/features/User_side/Shop/screens/Services/services_screen.dart';
import 'package:stylesage/features/User_side/Shop/screens/Home/widgets/header.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;
    final SalonController salonController = Get.put(SalonController());
    final SalonSearchController salonSearchController =
        Get.put(SalonSearchController());

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: SSizes.md,
                bottom: SSizes.md,
                left: SSizes.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(
                    height: SSizes.defaultSpaceLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: SSizes.lg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SearchField(
                            onChanged: (value) {
                              salonSearchController.searchSalons(value);
                            },
                          ),
                        ),
                        const SizedBox(width: SSizes.defaultSpaceSmall),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const FilterDialogBox();
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/filter.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (salonSearchController.isSearching.value) {
                      if (salonSearchController.isLoading.value) {
                        return const Padding(
                          padding:
                              EdgeInsets.only(top: SSizes.lg, right: SSizes.lg),
                          child: SaloonCardShimmer(),
                        );
                      }

                      if (salonSearchController.searchResults.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: SSizes.lg, right: SSizes.lg),
                            child: Text(
                              "No salons found",
                              style: TextStyle(color: SColors.primary),
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: salonSearchController.searchResults
                            .map((vendor) => Padding(
                                  padding: const EdgeInsets.only(
                                      top: SSizes.lg, right: SSizes.lg),
                                  child: SaloonCard(vendor: vendor),
                                ))
                            .toList(),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: SSizes.spaceBtwItems),
                        Text(
                          "#SpecialForYou",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Carousel(),
                        const SizedBox(height: SSizes.sm),
                        Padding(
                          padding: const EdgeInsets.only(right: SSizes.lg),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Services",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const ServicesScreen());
                                },
                                child: Text(
                                  "See All",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: SSizes.sm),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: ServicesRoundedWidget(
                                  service: dataList[index]["service"],
                                  imagePath: dataList[index]["logo"],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: SSizes.spaceBtwItems),
                        Padding(
                          padding: const EdgeInsets.only(right: SSizes.lg),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Salons",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.updateIndex(1),
                                    child: Text(
                                      "See All",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: SSizes.sm),
                              Obx(() {
                                if (salonController.isLoading.value) {
                                  return const SaloonCardShimmer();
                                }

                                if (salonController.vendors.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "No salon added yet",
                                      style: TextStyle(color: SColors.primary),
                                    ),
                                  );
                                }

                                return Column(
                                  children: salonController.vendors
                                      .map((vendor) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: SSizes.md),
                                            child: SaloonCard(vendor: vendor),
                                          ))
                                      .toList(),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
