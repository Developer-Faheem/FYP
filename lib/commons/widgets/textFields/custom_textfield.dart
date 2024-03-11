import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF694D75)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SColors.primary),
        ),
      ),
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
