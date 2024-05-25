import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/features/Vendor_side/Salon/controllers/package_controller/package_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class AddPackageDialog extends StatelessWidget {
  AddPackageDialog({
    super.key,
  });

  final PackageController packageController = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: SColors.bgMainScreens,
        child: Padding(
          padding: const EdgeInsets.all(SSizes.lg),
          child: Container(
            width: 330,
            height: SDeviceUtils.getScreenHeight() * 0.71,
            decoration: BoxDecoration(
              color: SColors.bgMainScreens,
              borderRadius: BorderRadius.circular(SSizes.radiusLarge),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add package",
                          style: Theme.of(context).textTheme.headlineLarge),
                      CircularButton(
                        onPressedCallback: () {
                          Get.back();
                        },
                        iconPath: "assets/icons/cross.svg",
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //image
                  Stack(
                    children: [
                      // Container for the image
                      Container(
                        height: 84.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SSizes.radiusSmall),
                          image: DecorationImage(
                            image: packageController.imageUrl != null
                                ? NetworkImage(packageController.imageUrl!)
                                : const AssetImage(
                                        "assets/images/packagePicture.png")
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Positioned circular button with some adjustments
                      Positioned(
                        right: 18.0,
                        top: 40.0,
                        child: Material(
                          color: Colors.transparent,
                          child: CircularButton(
                            onPressedCallback: () {
                              packageController.uploadPackageImage();
                            },
                            iconPath: "assets/icons/profile/Edit.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                  //add package field
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: packageController.packageNameController,
                    hintText: "Add Package name",
                  ),

                  //included services field
                  const SizedBox(height: 16),
                  Text(
                    "Services",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: packageController.packageServicesController,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Enter services included in package ...',
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: SColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  //total price of the package
                  Text(
                    "Total Package price",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Total Price",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 26,
                      ),
                      Expanded(
                          child: CustomTextField(
                        controller: packageController.packagePriceController,
                        hintText: "Rs.",
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),

                  //buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomOutlinedButton(
                          buttonText: "Cancel",
                          height: 42,
                          width: 0.3,
                          gradient: SColors.MainOutlinedButtonGradient,
                          textStyle:
                              Theme.of(context).textTheme.headlineMedium!,
                          onPressedCallback: () {
                            Get.back();
                          }),
                      const SizedBox(width: 16),
                      CustomButton(
                        onPressedCallback: () {
                          packageController.savePackageRecord();
                        },
                        buttonText: "Add package",
                        height: 42,
                        width: 0.3,
                        textStyle: Theme.of(context).textTheme.titleLarge!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
