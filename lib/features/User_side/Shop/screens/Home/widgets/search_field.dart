import 'package:flutter/material.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SearchField extends StatelessWidget {
  final Function(String) onChanged;
  const SearchField({required this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SDeviceUtils.getScreenWidth() * 0.77,
      height: 33,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search service",
          hintStyle: Theme.of(context).textTheme.labelMedium,
          prefixIcon: const Icon(Icons.search, size: 20),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA9A7A7)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA9A7A7)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
