import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/features/Vendor_side/Salon/controllers/service_controller/services_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class AddServicesDialog extends StatelessWidget {
  AddServicesDialog({
    super.key,
  });

  final ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: SColors.bgMainScreens,
        child: Padding(
          padding: const EdgeInsets.all(SSizes.lg),
          child: Container(
            width: 330,
            height: SDeviceUtils.getScreenHeight() * 0.54,
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
                      Text("Add Service",
                          style: Theme.of(context).textTheme.headlineLarge),
                      CircularButton(
                        onPressedCallback: () {
                          Get.back();
                        },
                        iconPath: "assets/icons/cross.svg",
                      ),
                    ],
                  ),

                  // Select service category
                  const SizedBox(height: 16),
                  Text(
                    "Select Service Category",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(() => DropdownButton<String>(
                          isExpanded: true,
                          value: serviceController.selectedCategory.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              serviceController.selectedCategory.value =
                                  newValue;
                            }
                          },
                          items: serviceController.categories
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          underline:
                              SizedBox(), // To remove the default underline
                        )),
                  ),

                  // Service name
                  const SizedBox(height: 16),
                  Text(
                    "Create service Name",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: serviceController.serviceNameController,
                    hintText: "",
                  ),
                  const SizedBox(height: 16),

                  // Price of the service
                  Text(
                    "Price for service created",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Service price",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 26,
                      ),
                      Expanded(
                          child: CustomTextField(
                        controller: serviceController.priceController,
                        hintText: "Rs.",
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 16),
                      CustomButton(
                        onPressedCallback: () {
                          serviceController.saveServiceRecord();
                          Get.back();
                        },
                        buttonText: "Add Service",
                        height: 42,
                        width: 0.38,
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
