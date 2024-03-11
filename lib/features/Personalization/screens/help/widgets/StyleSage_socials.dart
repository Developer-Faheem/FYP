import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class StyleSageSocials extends StatelessWidget {
  final String title;
  final String leading;
  final VoidCallback onPressedCallback;

  const StyleSageSocials(
      {super.key,
      required this.leading,
      required this.title,
      required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.spaceBtwSections),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SSizes.radiusSmall),
          border: Border.all(
            color: SColors.primary,
            width: 1.0,
          ),
        ),
        child: GestureDetector(
          onTap: onPressedCallback,
          child: ListTile(
            leading: SvgPicture.asset(
              leading,
              width: 30.0,
              height: 30.0,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: SSizes.iconSm,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
