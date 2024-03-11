import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/toggle_button_widget.dart';
import 'package:stylesage/features/Shop/screens/cancel_appointment.dart/CancelAppointmentScreen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({
    super.key,
  });

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  final toggleController = Get.put(ToggleController());

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bell curls , Salon",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Column(
                  children: [
                    Obx(
                      () => ToggleButton(
                        isToggled: toggleController.isFaviourite.value,
                        isFilter: false,
                      ),
                    ),
                    Obx(() => toggleController.isFaviourite.value
                        ? SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(
                                top: SSizes.defaultSpacemedium),
                            child: Text(
                              "Remind Me",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ))
                  ],
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
                        height: SSizes.defaultSpacemedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                              onPressedCallback: () {
                                Get.to(() => CancelAppointmentScreen());
                              },
                              buttonText: "Cancel",
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
