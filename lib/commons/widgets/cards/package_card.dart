import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/Location_widget.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 203,
      decoration: BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [SColors.cardShadow],
      ),
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
                Text(
                  "Rs 3,000",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(
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
                SizedBox(
                  width: SSizes.defaultSpaceLarge,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: SSizes.defaultSpaceLarge), // Adjusted padding
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
                        SizedBox(
                          height: SSizes.defaultSpaceSmall,
                        ),
                        LocationWidget(
                          IconPath: 'assets/icons/pin.svg',
                          address:
                              "0539 NYC, Street #98 Maine# wood 04...Ingelroad",
                        ),
                        SizedBox(
                          height: SSizes.defaultSpacemedium,
                        ),
                        Container(
                          height: 46,
                          width: 208,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: SColors.primary, width: 2),
                            borderRadius:
                                BorderRadius.circular(SSizes.radiusSmall),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              "Hair cutting, colouring , makeup , styling and hydra facial.",
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SSizes.defaultSpacemedium,
                        ),
                        Center(
                          child: CustomButton(
                            onPressedCallback: () {},
                            buttonText: "Book Now",
                            height: 28,
                            width: 0.23,
                            textStyle: Theme.of(context).textTheme.titleMedium!,
                          ),
                        ),
                      ],
                    ),
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
