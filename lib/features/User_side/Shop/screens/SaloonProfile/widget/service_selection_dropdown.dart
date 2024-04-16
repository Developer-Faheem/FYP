import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class DropDownController extends GetxController {
  var selectedItems1 = <dynamic>[].obs;
  var selectedItems2 = <dynamic>[].obs;
}

class ServiceSelectionDropdown extends StatelessWidget {
  final String serviceName;
  final List<Map<String, String>> items; // List of items
  final List<dynamic> selectedItems;

  const ServiceSelectionDropdown({
    Key? key,
    required this.serviceName,
    required this.items,
    required this.selectedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DropDownController controller = Get.put(DropDownController());

    return Padding(
      padding: const EdgeInsets.only(
          left: SSizes.lg, right: SSizes.lg, top: SSizes.md),
      child: Obx(() => MultiSelectDropdown(
            checkboxFillColor: SColors.tertiary,
            //splashColor: Colors.red,
            list: items,
            initiallySelected: selectedItems.toList(),
            onChange: (newList) {
              selectedItems.assignAll(newList); // Update selected items
              //   print(controller.selectedItems);
            },
            numberOfItemsLabelToShow: 2,
            whenEmpty: serviceName,
          )),
    );
  }
}
