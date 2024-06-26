import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/features/User_side/Shop/screens/Home/widgets/notification_dialog.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: SSizes.lg),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/location.svg',
            height: SSizes.iconSm,
          ),
          const SizedBox(
            width: SSizes.defaultSpaceLarge,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "Islamabad, Pakistan",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const NotificationDialog();
                },
              );
            },
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: 30.5,
            ),
          ),
        ],
      ),
    );
  }
}
