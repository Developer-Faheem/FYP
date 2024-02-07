import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FaviouriteCard extends StatelessWidget {
  const FaviouriteCard({
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
                  "Bell curls , Salon",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SColors.primary,
                      width: 2, // Adjust the border width as needed
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/faviourite_outlined.svg',
                      width: SSizes.iconXS,
                    ),
                  ),
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
                        "Hair cutting and Stylit ddj dhhd dhdh",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: SSizes.iconXS,
                            //  width: 16,
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpaceSmall,
                          ),
                          Expanded(
                            child: Text(
                              "0539 NYC, Street #98 Maine# wood 04...Ingelroad",
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
                      //time and distance
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/distance_time.svg',
                            height: SSizes.iconXS,
                            //  width: 16,
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpaceSmall,
                          ),
                          Row(
                            children: [
                              Text(
                                "15 min",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Text(
                                " | ",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "2 Km",
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            height: SSizes.iconXS,
                            //  width: 16,
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpaceSmall,
                          ), // Add some space between icon and text
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "MON-SAT",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  " | ",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Expanded(
                                  child: Text(
                                    "9:00 AM-3:30 PM jsjs shhs shsh",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpacemedium,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const RatingsWidget(
                              rating: "3.5k",
                            ),
                            const SizedBox(
                              width: SSizes.defaultSpaceLarge,
                            ),
                            CustomButton(
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
