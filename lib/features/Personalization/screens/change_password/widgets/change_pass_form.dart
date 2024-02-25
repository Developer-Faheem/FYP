import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ChangePassForm extends StatelessWidget {
  const ChangePassForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //---------------current password ---------------------
        Text("Current Password",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/obscure.svg',
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFF694D75)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SColors.primary),
            ),
          ),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),
        //---------------New password ---------------------
        Text("New Password", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/obscure.svg',
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFF694D75)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SColors.primary),
            ),
          ),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),

        //---------------Confirmed password ---------------------
        Text("Confirmed Password",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/obscure.svg',
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFF694D75)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SColors.primary),
            ),
          ),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
