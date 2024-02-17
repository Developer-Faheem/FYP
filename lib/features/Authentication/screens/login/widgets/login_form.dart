import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------email
        Text(STextStrings.emailAddress,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          decoration: const InputDecoration(
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
          height: SSizes.spaceBtwItems,
        ),
        //---------------password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(STextStrings.password,
                style: Theme.of(context).textTheme.headlineSmall),
            Text(STextStrings.forgotPassword,
                style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
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
      ],
    );
  }
}
