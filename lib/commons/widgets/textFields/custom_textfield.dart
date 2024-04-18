import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;

  const CustomTextField({
    Key? key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
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
