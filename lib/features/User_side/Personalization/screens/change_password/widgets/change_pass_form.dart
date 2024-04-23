import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/commons/widgets/textFields/password_field.dart';
import 'package:stylesage/features/User_side/Personalization/controllers/changePassword_controller/changePassword_controller.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ChangePassForm extends StatelessWidget {
  const ChangePassForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return Form(
      key: controller.changePasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------current password ---------------------
          Text("Current Password",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            controller: controller.currentPassword,
          ),
          const SizedBox(
            height: SSizes.spaceBtwSections,
          ),
          //---------------New password ---------------------
          Text("New Password",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomPasswordField(
            controller: controller.newPassword,
          ),
          const SizedBox(
            height: SSizes.spaceBtwSections,
          ),

          //---------------Confirmed password ---------------------
          Text("Confirmed Password",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomPasswordField(
            controller: controller.confirmPassword,
          ),
        ],
      ),
    );
  }
}
