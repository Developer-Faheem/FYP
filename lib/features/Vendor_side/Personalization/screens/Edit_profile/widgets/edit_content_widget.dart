import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/features/Authentication/controller/vendor_controller/vendor_controller.dart';
import 'package:stylesage/features/Vendor_side/Personalization/controllers/update_profile/update_profile.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Edit_profile/widgets/textfield.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/validators/validator.dart';

class EditContent extends StatelessWidget {
  const EditContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final updateProfileController = Get.put(UpdateVendorProfileController());
    final vendorController = Get.put(VendorController());
    return Container(
      decoration: const BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.radiusLarge),
          topRight: Radius.circular(SSizes.radiusLarge),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //content other than the tab bar
            Padding(
              padding: const EdgeInsets.only(
                  top: SSizes.lg,
                  left: SSizes.lg,
                  right: SSizes.lg,
                  bottom: SSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      key: updateProfileController.updateVendorProfile,
                      child: Column(
                        children: [
                          CustomTextField1(
                            controller: updateProfileController.saloonName,
                            hintText:
                                vendorController.vendor.value.salonName == ''
                                    ? "Salon Name"
                                    : vendorController.vendor.value.salonName,
                            validator: (value) => SValidators.validateEmptyText(
                                'Salon Name', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.userName,
                            hintText:
                                vendorController.vendor.value.userName == ''
                                    ? "User Name(Private info)"
                                    : vendorController.vendor.value.userName,
                            validator: (value) => SValidators.validateEmptyText(
                                'User Name(Private info)', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            hintText: vendorController.vendor.value.email,

                            // validator: (value) => SValidators.validateEmptyText(
                            //     'example@gmail.com', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.salonAddress,
                            hintText:
                                vendorController.vendor.value.address == ''
                                    ? "Salon address"
                                    : vendorController.vendor.value.address,
                            validator: (value) => SValidators.validateEmptyText(
                                'Salon address', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller:
                                updateProfileController.googleAddressLink,
                            hintText:
                                vendorController.vendor.value.mapLocation == ''
                                    ? "Address link on Google map"
                                    : vendorController.vendor.value.mapLocation,
                            validator: (value) => SValidators.validateEmptyText(
                                'link on Google map"', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.jazzcashNumber,
                            hintText: vendorController
                                        .vendor.value.jazzcashNumber ==
                                    ''
                                ? "Jazzcash no"
                                : vendorController.vendor.value.jazzcashNumber,
                            validator: (value) => SValidators.validatePhnNumber(
                                value, "Jazzcash no"),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.easypaisaNumber,
                            hintText: vendorController
                                        .vendor.value.easypaisaNumber ==
                                    ''
                                ? "Easypaisa no"
                                : vendorController.vendor.value.easypaisaNumber,
                            validator: (value) => SValidators.validatePhnNumber(
                                value, "Easypaisa no"),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.salonTagline,
                            hintText:
                                vendorController.vendor.value.tagline == ''
                                    ? "Salon tagline"
                                    : vendorController.vendor.value.tagline,
                            validator: (value) => SValidators.validateEmptyText(
                                'Salon tagline', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.phoneNumber,
                            hintText:
                                vendorController.vendor.value.phoneNumber == ''
                                    ? "Phone no"
                                    : vendorController.vendor.value.phoneNumber,
                            validator: (value) => SValidators.validatePhnNumber(
                                value, "Phone no"),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          CustomTextField1(
                            controller: updateProfileController.city,
                            hintText: vendorController.vendor.value.city == ''
                                ? "City"
                                : vendorController.vendor.value.city,
                            validator: (value) =>
                                SValidators.validateEmptyText('City', value),
                          ),
                          const SizedBox(
                            height: SSizes.md,
                          ),
                          TextFormField(
                            validator: (value) => SValidators.validateEmptyText(
                                'salon about section', value),
                            controller: updateProfileController.about,
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: vendorController
                                          .vendor.value.aboutSection ==
                                      ''
                                  ? 'This is about section for your salon\n write short description about your saloon \n Enter salon opening timings with days'
                                  : vendorController.vendor.value.aboutSection,
                              hintStyle: Theme.of(context).textTheme.labelLarge,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: SColors.primary),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: SSizes.lg,
                  ),
                  CustomButton(
                      buttonText: "Update Profile",
                      textStyle: Theme.of(context).textTheme.titleLarge!,
                      width: 0.909,
                      height: 44,
                      onPressedCallback: () {
                        if (updateProfileController
                            .updateVendorProfile.currentState!
                            .validate()) {
                          // If validation passes, perform the signup process
                          updateProfileController.updateVendorData();
                          Get.back();
                        }
                      }),
                  const SizedBox(
                    height: SSizes.lg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
