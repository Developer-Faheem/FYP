import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final String? hintText;
  final String? suffixIcon; // New property for trailing icon

  const CustomTextField1({
    Key? key,
    this.hintText,
    this.suffixIcon, // Updated constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none, // Remove the default border
          filled: true,
          fillColor: Colors.white, // Fill color of the text field

          // Add the suffix icon
        ),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
