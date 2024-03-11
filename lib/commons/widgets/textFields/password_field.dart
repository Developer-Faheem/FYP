import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
