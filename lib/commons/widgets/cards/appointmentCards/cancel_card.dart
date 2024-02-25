import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class CancelCard extends StatelessWidget {
  const CancelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
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
                  "04 June, 2023- 11:00AM ",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const RatingsWidget(
                  rating: "3.5k",
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
                        "MakeUp stylist",
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
                              "Service ID# 093736381",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                              onPressedCallback: () {},
                              buttonText: "Re-book",
                              height: 28,
                              width: 0.23,
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium!),
                        ],
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
