import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/notificationScreen/widget/notification_header_widget.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/notificationScreen/widget/notification_tile_widget.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key4}) : super(key: key4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: const NotificationHeader()),
      body: Padding(
        padding: const EdgeInsets.only(left: SSizes.lg, right: SSizes.lg),
        child: Column(
          children: [
            const SizedBox(height: SSizes.defaultSpacemedium),
            //new notifications
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
            //earlier notifications
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
