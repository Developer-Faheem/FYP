import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/features/User_side/Shop/models/appointment.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/salon_profile_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class CancelCard extends StatelessWidget {
  final AppointmentModel appointment;
  const CancelCard({
    required this.appointment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
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
                  //"04 June, 2023- 11:00AM ",
                  appointment.salonName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                RatingsWidget(
                  rating: appointment.rating.toString(),
                  //"3.5k",
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
                        appointment.vendorTagline,
                        // "MakeUp stylist",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpaceLarge,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: SSizes.iconXS,
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpaceSmall,
                          ),
                          Expanded(
                            child: Text(
                              appointment.vendorAddress,
                              //"0539 NYC, Street #98 Maine# wood 04...Ingelroad",
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/service_id.svg',
                            height: SSizes.iconXS,
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpaceSmall,
                          ),
                          Expanded(
                            child: Text(
                              appointment.appointmentId,
                              // "Service ID# 093736381",
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpaceLarge,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // CustomButton(
                          //     onPressedCallback: () {
                          //       Get.to(() => const SalonProfileScreen());
                          //     },
                          //     buttonText: "Re-book",
                          //     height: 28,
                          //     width: 0.23,
                          //     textStyle:
                          //         Theme.of(context).textTheme.titleMedium!),
                        ],
                      ),
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
