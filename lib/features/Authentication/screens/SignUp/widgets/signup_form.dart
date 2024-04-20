import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/commons/widgets/textFields/password_field.dart';
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
          const CustomTextField(),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //------------email
          Text(STextStrings.emailAddress,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          const CustomTextField(),
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
          const CustomPasswordField(),
          const SizedBox(
            height: SSizes.spaceBtwSections,
          ),
          //remaining
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
