import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
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
