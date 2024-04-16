import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';

class ProfileOptionsTile extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final VoidCallback onPressedCallback;

  const ProfileOptionsTile({
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
            trailing: const Icon(Icons.arrow_forward_ios),
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
