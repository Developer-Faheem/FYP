import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/notificationScreen/widget/notification_tile_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Hello, Enclave Haven",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: SSizes.lg,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                height: 30.5,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: SSizes.lg, right: SSizes.lg),
        child: Column(
          children: [
            const SizedBox(height: SSizes.defaultSpacemedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Mark as all read",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const NotificationTile();
                },
              ),
            ),
            //earlier notification
            const SizedBox(height: SSizes.defaultSpacemedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  "Earlier",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Expanded(
              //height: 250,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const NotificationTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
