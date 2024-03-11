import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/service_selection_dropdown.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ChipWidget extends StatelessWidget {
  final List<Map<String, String>> items;

  ChipWidget(this.items);

  @override
  Widget build(BuildContext context) {
    final DropDownController controller = Get.put(DropDownController());

    return Wrap(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SSizes.radiusLarge),
              side: BorderSide(color: SColors.primary), // Set border color
            ),
            labelStyle: Theme.of(context).textTheme.labelSmall,
            padding: EdgeInsets.zero,
            label: Text(item['label'] ?? ''),
            backgroundColor: SColors.bgMainScreens,
            deleteIconColor: SColors.secondary, // Set delete icon color
            visualDensity: VisualDensity.compact,
            onDeleted: () {
              controller.selectedItems1.remove(item);
              controller.selectedItems2.remove(item);
              print(controller.selectedItems1);
            },
          ),
        );
      }).toList(),
    );
  }
}
