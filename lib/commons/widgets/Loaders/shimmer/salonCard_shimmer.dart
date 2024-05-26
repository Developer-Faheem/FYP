import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/shimmer_loader.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class SaloonCardShimmer extends StatelessWidget {
  const SaloonCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      decoration: BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [SColors.cardShadow],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SShimmerEffect(width: 120, height: 20, radius: 8),
                SShimmerEffect(width: 50, height: 20, radius: 8),
              ],
            ),
            SizedBox(
              height: SSizes.defaultSpacemedium,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SShimmerEffect(width: 88, height: 104, radius: 12),
                SizedBox(
                  width: SSizes.defaultSpaceLarge,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SShimmerEffect(
                          width: double.infinity, height: 16, radius: 8),
                      SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      SShimmerEffect(
                          width: double.infinity, height: 14, radius: 8),
                      SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      SShimmerEffect(
                          width: double.infinity, height: 14, radius: 8),
                      SizedBox(
                        height: SSizes.defaultSpaceSmall,
                      ),
                      SShimmerEffect(
                          width: double.infinity, height: 14, radius: 8),
                      SizedBox(
                        height: SSizes.defaultSpacemedium,
                      ),
                      Center(
                        child: SShimmerEffect(width: 80, height: 28, radius: 8),
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
