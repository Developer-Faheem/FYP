import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/commons/widgets/textFields/password_field.dart';
import 'package:stylesage/features/Authentication/controller/signUp/signup_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/validators/validator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.SignUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-----------name
          Text(STextStrings.name,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            controller: controller.name,
            validator: (value) => SValidators.validateEmptyText("Name", value),
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //------------email
          Text(STextStrings.emailAddress,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomTextField(
            controller: controller.email,
            validator: (value) => SValidators.validateEmail(value),
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          //---------------password
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(STextStrings.password,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(
            height: SSizes.defaultSpaceSmall,
          ),
          CustomPasswordField(
            controller: controller.password,
            validator: (value) => SValidators.validatePassword(value),
          ),
          const SizedBox(
            height: SSizes.spaceBtwSections,
          ),
          //remaining
          Row(
            children: [
              Obx(
                () => Checkbox(
                    activeColor: SColors.secondary,
                    value: controller.privacyPolicy.value,
                    onChanged: (value) {
                      controller.privacyPolicy.value =
                          !controller.privacyPolicy.value;
                    }),
              ),
              Text(
                "Agree with ",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "terms and conditions",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
