import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Location_widget.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/faviourite_button.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/commons/widgets/time_distance_widget.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/salon_profile_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FaviouriteCard extends StatelessWidget {
  VendorModel vendor;

  FaviouriteCard({
    required this.vendor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 193,
      decoration: BoxDecoration(
          color: SColors.bgMainScreens,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [SColors.cardShadow]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  vendor.salonName,
                  //"Bell curls , Salon",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                FaviouriteButton(
                  vendorId: vendor.id,
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.defaultSpacemedium,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/saloon.png',
                    width: 88,
                    height: 104,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                    width: SSizes
                        .defaultSpaceLarge), // Add some space between image and text
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendor.tagline,
                        // "Hair cutting and Stylit ddj dhhd dhdh",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      LocationWidget(
                          iconPath: 'assets/icons/location.svg',
                          address: vendor.address
                          // "0539 NYC, Street #98 Maine# wood 04...Ingelroad"
                          ),

                      const SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      //time and distance
                      const TimeDistanceWidget(
                          iconPath: 'assets/icons/distance_time.svg',
                          text1: "15 min",
                          text2: "2 Km"),

                      const SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      const TimeDistanceWidget(
                          iconPath: 'assets/icons/clock.svg',
                          text1: "MON-SAT",
                          text2: "9:00 AM-3:30 PM"),

                      const SizedBox(
                        height: SSizes.defaultSpacemedium,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RatingsWidget(
                              rating: vendor.ratings.toString(),
                              //"3.5k",
                            ),
                            const SizedBox(
                              width: SSizes.defaultSpaceLarge,
                            ),
                            CustomButton(
                                onPressedCallback: () {
                                  Get.to(
                                      () => SalonProfileScreen(vendor: vendor));
                                },
                                buttonText: "Book Now",
                                height: 28,
                                width: 0.23,
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium!),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
