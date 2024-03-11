import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/toggle_button_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FilterTileWidget extends StatelessWidget {
  final String title;

  const FilterTileWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toggleController = Get.put(ToggleController());

    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.spaceBtwSections),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SSizes.radiusSmall),
          border: Border.all(
            color: SColors.primary,
            width: 1.0,
          ),
        ),
        child: Center(
          child: ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            trailing: Obx(
              () => ToggleButton(
                isToggled: title == "Salon"
                    ? toggleController.isSalonToggled.value
                    : toggleController.isServiceToggled.value,
                isFilter: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
