import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/commons/widgets/textFields/password_field.dart';
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
        const CustomTextField(),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),
        //---------------New password ---------------------
        Text("New Password", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        const CustomPasswordField(),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),

        //---------------Confirmed password ---------------------
        Text("Confirmed Password",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        const CustomPasswordField(),
      ],
    );
  }
}
