import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class PaymentWidget extends StatelessWidget {
  final String title;
  final String leading;

  const PaymentWidget({
    super.key,
    required this.leading,
    required this.title,
  });

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
        child: Center(
          child: ListTile(
            visualDensity: VisualDensity.compact,
            leading: Image.asset(
              leading,
              width: 30.0,
              height: 30.0,
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
