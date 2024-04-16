import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SSizes.radiusLarge),
          color: SColors.profileContainer),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                //profile image
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(SImages.anonymous),
                ),
                const SizedBox(
                  width: SSizes.sm,
                ),
                // user name and followers
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Anna Wilson",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      height: SSizes.xs,
                    ),
                    Text("20 Followings",
                        style: Theme.of(context).textTheme.labelSmall)
                  ],
                ),
              ],
            ),
            // profile details button
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: SColors.bgMainScreens),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: SColors.profileContainer,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
