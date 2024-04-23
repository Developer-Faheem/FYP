import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/commons/widgets/textFields/password_field.dart';
import 'package:stylesage/features/Authentication/controller/login_controller.dart/login_controller.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //------------email
          Text(STextStrings.emailAddress,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            controller: controller.email,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //---------------password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(STextStrings.password,
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(STextStrings.forgotPassword,
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomPasswordField(
            controller: controller.password,
          ),
          const SizedBox(
            height: SSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
