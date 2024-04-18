import 'package:flutter/material.dart';

class OutlinedDropdownButton extends StatefulWidget {
  @override
  _OutlinedDropdownButtonState createState() => _OutlinedDropdownButtonState();
}

class _OutlinedDropdownButtonState extends State<OutlinedDropdownButton> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF694D75)),
        ),
      ),
      value: _selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
      items: <String>[
        'Hair Services',
        'Nail Services',
        'Make Up',
        'Mnicure',
        'Pedicure'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: TextStyle(color: Colors.black)), // Set text color
        );
      }).toList(),
    );
  }
}
