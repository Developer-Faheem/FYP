import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/service_selection_dropdown.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/controller.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class ServicesTab extends StatelessWidget {
  final String vendorId;

  const ServicesTab({super.key, required this.vendorId});

  @override
  Widget build(BuildContext context) {
    final DropDownController controller = DropDownController.instance;

    return SingleChildScrollView(
      child: Column(
        children: [
          ServiceSelectionDropdown(
            serviceName: "Hair Care",
            selectedItems: controller.selectedItems1,
            items: controller.hairServices,
          ),

          ServiceSelectionDropdown(
            serviceName: "Nail Care",
            selectedItems: controller.selectedItems2,
            items: controller.nailServices,
          ),

          ServiceSelectionDropdown(
            serviceName: "Skin Care",
            selectedItems: controller.selectedItems3,
            items: controller.skinServices,
          ),

          ServiceSelectionDropdown(
            serviceName: "Beauty Services",
            selectedItems: controller.selectedItems4,
            items: controller.beautyServices,
          ),

          ServiceSelectionDropdown(
            serviceName: "Mens Grooming",
            selectedItems: controller.selectedItems5,
            items: controller.mensServices,
          ),
          ServiceSelectionDropdown(
            serviceName: "Body Treatment",
            selectedItems: controller.selectedItems6,
            items: controller.bodyServices,
          ),
          ServiceSelectionDropdown(
            serviceName: "Other Services",
            selectedItems: controller.selectedItems7,
            items: controller.otherServices,
          ),
          SizedBox(
            height: SDeviceUtils.getScreenHeight() * 0.1,
          )
          // Add other categories similarly if needed
        ],
      ),
    );
  }
}
