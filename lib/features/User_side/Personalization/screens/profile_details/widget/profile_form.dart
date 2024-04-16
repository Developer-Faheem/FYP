import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ProfileForm extends StatelessWidget {
  final _value = -1;

  const ProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-----------Name-----
        Text("Name", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF694D75)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: SColors.primary),
            ),
          ),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        //-----------Phone No-----
        Text("Phone no", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "+92",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF694D75)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: SColors.primary),
            ),
          ),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        //---------------------gender---
        Text("Gender", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        DropdownButtonFormField(
          style: Theme.of(context).textTheme.displaySmall,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SSizes.xs),
              // borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SSizes.xs),
              borderSide: const BorderSide(color: Color(0XFF694D75), width: 1.0),
            ),
          ),
          value: _value,
          items: const [
            DropdownMenuItem(
              value: -1,
              child: Text(
                "-Select Gender-",
                style: TextStyle(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text(
                "Male",
                style: TextStyle(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text(
                "Female",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          onChanged: (v) {},
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        //-----------Email -----
        Text("Phone no", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: SSizes.defaultSpaceSmall,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "abc@gmail.com",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF694D75)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: SColors.primary),
            ),
          ),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
