import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';

class VendorProfileOptionsTile extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final VoidCallback onPressedCallback;

  const VendorProfileOptionsTile({
    required this.leadingIcon,
    required this.title,
    required this.onPressedCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressedCallback,
          child: ListTile(
            leading: SvgPicture.asset(leadingIcon),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const Divider(
          color: SColors.dividersColor,
        )
      ],
    );
  }
}
