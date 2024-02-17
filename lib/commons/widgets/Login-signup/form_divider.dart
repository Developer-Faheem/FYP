import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
            child: Divider(
          color: SColors.secondary,
          thickness: 1.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(
          STextStrings.otherSignupMedthods,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Flexible(
            child: Divider(
          color: SColors.secondary,
          thickness: 1.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}
