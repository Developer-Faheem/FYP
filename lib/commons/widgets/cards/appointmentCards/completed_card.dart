import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/shadow_button.dart';
import 'package:stylesage/features/User_side/Shop/screens/Summary_Appointment/appointment_summary.dart';
import 'package:stylesage/features/User_side/Shop/screens/add_review/add_review_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class CompletedCard extends StatelessWidget {
  const CompletedCard({
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
                  "Bell curls , Salon",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SvgPicture.asset(
                  'assets/icons/completed_icon.svg',
                  height: SSizes.iconMd,
                )
              ],
            ),
            // const SizedBox(
            //   height: SSizes.defaultSpaceSmall,
            // ),
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
                        height: SSizes.defaultSpacemedium,
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
                      //time and distance
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            height: SSizes.iconXS,
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpaceSmall,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "15min .1.7km",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  " | ",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Expanded(
                                  child: Text(
                                    "Mon-Sun",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  " | ",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Expanded(
                                  child: Text(
                                    "9am-11pm",
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
                        height: SSizes.defaultSpaceLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AddReviewScreen());
                            },
                            child: const ShadowButton(
                                buttonText: "Add Review",
                                height: 27,
                                width: 92),
                          ),
                          const SizedBox(
                            width: SSizes.defaultSpacemedium,
                          ),
                          CustomButton(
                              onPressedCallback: () {
                                Get.to(() => const AppointmentSummaryScreen());
                              },
                              buttonText: "Summary",
                              height: 28,
                              width: 0.23,
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium!),
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
