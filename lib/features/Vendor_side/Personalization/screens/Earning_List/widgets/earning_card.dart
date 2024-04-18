import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Earning_List/widgets/details_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class EarningCard extends StatelessWidget {
  const EarningCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: SColors.primary,
        ),
        borderRadius: BorderRadius.circular(SSizes.radiusSmall),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //easypaisa method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Method:",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Easypaisa",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(
              height: SSizes.md,
            ),
            //id and the services detail
            Text(
              "Service id: #12761967",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "hair cutting,hair straightinging",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: SSizes.md,
            ),
            //Date Time Amount
            Container(
              decoration: BoxDecoration(
                color: SColors.secondary.withOpacity(0.25),
                borderRadius: BorderRadius.circular(SSizes.radiusSmall),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DetailsWidget(
                      leading: "Amount",
                      trailing: "Rs. 1253",
                    ),
                    DetailsWidget(
                      leading: "Date",
                      trailing: "02 Dec, 2024",
                    ),
                    DetailsWidget(
                      leading: "Time",
                      trailing: "10:30 PM",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
