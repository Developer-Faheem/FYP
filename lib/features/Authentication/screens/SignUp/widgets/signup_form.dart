import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-----------name
          Text(STextStrings.name,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF694D75)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: SColors.primary),
              ),
            ),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //------------email
          Text(STextStrings.emailAddress,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF694D75)),
              ),
              focusedBorder: OutlineInputBorder(
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
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF694D75)),
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
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text(
                "Agree with ",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "terms and conditions",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
