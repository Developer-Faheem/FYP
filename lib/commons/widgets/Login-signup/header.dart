import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const LoginHeader({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
