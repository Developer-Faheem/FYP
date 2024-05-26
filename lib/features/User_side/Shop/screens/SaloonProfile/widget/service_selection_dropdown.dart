import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ServiceSelectionDropdown extends StatelessWidget {
  final String serviceName;
  final RxList<Map<String, String>> items;
  final List<dynamic> selectedItems;

  const ServiceSelectionDropdown({
    Key? key,
    required this.serviceName,
    required this.items,
    required this.selectedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('--------------------printing the items ');
    print(items);
    return Padding(
      padding: const EdgeInsets.only(
          left: SSizes.lg, right: SSizes.lg, top: SSizes.md),
      child: Obx(() {
        return MultiSelectDropdown(
          checkboxFillColor: SColors.tertiary,
          list: items.toList(),
          initiallySelected: selectedItems.toList(),
          onChange: (newList) {
            selectedItems.clear();
            selectedItems.addAll(newList);
          },
          numberOfItemsLabelToShow: 2,
          whenEmpty: serviceName,
        );
      }),
    );
  }
}
