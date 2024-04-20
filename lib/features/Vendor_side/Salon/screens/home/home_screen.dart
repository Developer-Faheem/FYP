import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/home/widgets/grid_item_widget.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/home/widgets/review_tile.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/home/widgets/vendor_header_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class VendorHomeScreen extends StatelessWidget {
  const VendorHomeScreen({Key? key2}) : super(key: key2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: const VendorHeader(),
      ),
      body: Container(
        color: SColors.bgMainScreens,
        padding: const EdgeInsets.only(
          left: SSizes.lg,
          right: SSizes.lg,
          top: SSizes.md,
          // bottom: 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 310,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  GridItemWidget(
                    icon: "assets/icons/earning.svg",
                    figure: 'Rs 1,259',
                    text2: 'Total Earnings',
                  ),
                  GridItemWidget(
                    icon: "assets/icons/Document.svg",
                    figure: '1625',
                    text2: 'Total Service',
                  ),
                  GridItemWidget(
                    icon: "assets/icons/Document.svg",
                    figure: '6617',
                    text2: 'Upcoming Service',
                  ),
                  GridItemWidget(
                    icon: "assets/icons/Document.svg",
                    figure: '6727',
                    text2: 'Today Service',
                  ),
                ],
              ),
            ),
            const SizedBox(height: SSizes.defaultSpacemedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reviews",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "View All",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: SSizes.defaultSpacemedium),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const ReviewTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
