import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  CustomPasswordField({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: hidePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: Icon(
            hidePassword ? Icons.visibility_off : Icons.visibility,
            color: SColors.secondary,
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
      validator: widget.validator,
    );
  }
}
