import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Shop/controllers/controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ChipWidget extends StatelessWidget {
  final List<Map<String, String>> items;

  const ChipWidget(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    final DropDownController controller = DropDownController.instance;

    return Wrap(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SSizes.radiusLarge),
              side:
                  const BorderSide(color: SColors.primary), // Set border color
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
              controller.selectedItems3.remove(item);
              controller.selectedItems4.remove(item);
              controller.selectedItems5.remove(item);
              controller.selectedItems6.remove(item);
              controller.selectedItems7.remove(item);
            },
          ),
        );
      }).toList(),
    );
  }
}
