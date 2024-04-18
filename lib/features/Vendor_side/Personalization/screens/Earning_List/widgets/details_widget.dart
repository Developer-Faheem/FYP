import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class DetailsWidget extends StatelessWidget {
  String leading;
  String trailing;
  DetailsWidget({
    required this.leading,
    required this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            trailing,
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}
