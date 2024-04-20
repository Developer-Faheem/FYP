import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/textFields/custom_textfield.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/dialog_boxes/dropdown_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class AddServicesDialog extends StatelessWidget {
  const AddServicesDialog({
    super.key,
  });

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

                  //select service catagory
                  const SizedBox(height: 16),
                  Text(
                    "Select Service Category",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  OutlinedDropdownButton(),
                  // services name
                  const SizedBox(height: 16),
                  Text(
                    "Create service Name",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  const CustomTextField(
                    hintText: "",
                  ),
                  const SizedBox(height: 16),

                  // price of the service
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
                      const Expanded(
                          child: CustomTextField(
                        hintText: "Rs.",
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),

                  //buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 16),
                      CustomButton(
                        onPressedCallback: () {},
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
