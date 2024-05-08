import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/User_side/Personalization/controllers/updateProfileController/updateProfileController.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/validators/validator.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final updateDataController = UpdateUserProfileController.instance;
    final userController = UserController.instance;

    return Form(
      key: updateDataController.updateUserProfile,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-----------Name-----
          Text("Name", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            hintText: userController.user.value.name,
            validator: (value) => SValidators.validateEmptyText('Name', value),
            controller: updateDataController.name,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //-----------Phone No-----
          Text("Phone no", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            hintText: userController.user.value.phoneNumber,
            validator: (value) =>
                SValidators.validateEmptyText('Phone No', value),
            controller: updateDataController.phoneNumber,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //---------------------gender---
          Text("Gender", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            hintText: userController.user.value.gender,
            validator: (value) =>
                SValidators.validateEmptyText('Gender', value),
            controller: updateDataController.gender,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //-----------Email -----
          Text("Email", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: userController.user.value.email,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF694D75)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: SColors.primary),
              ),
            ),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
