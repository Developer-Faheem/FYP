import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class FollowersDialog extends StatelessWidget {
  const FollowersDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(SSizes.radiusSmall), // Set desired radius
      ),
      elevation: 0,
      backgroundColor: SColors.bgMainScreens,
      child: Padding(
        padding: const EdgeInsets.only(
          left: SSizes.lg,
          right: SSizes.lg,
          top: SSizes.lg,
        ),
        child: Container(
          width: 165,
          height: SDeviceUtils.getScreenHeight() * 0.52,
          decoration: BoxDecoration(
            color: SColors.bgMainScreens,
            borderRadius: BorderRadius.circular(SSizes.radiusSmall),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Salons",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Followings",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              const SizedBox(height: SSizes.sm),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(
                        "assets/icons/profile/profile.svg",
                        width: SSizes.iconMd,
                      ),

                      //   trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Beauty Salon",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subtitle: Text(
                        "karachi",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
