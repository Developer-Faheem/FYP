import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class TimeSlotController extends GetxController {
  var isChecked = List<bool>.filled(6, false).obs;

  void toggleCheckbox(int index) {
    for (int i = 0; i < isChecked.length; i++) {
      isChecked[i] = (i == index); // Select the current item, unselect others
    }
  }

  String? getSelectedTimeSlot() {
    for (int i = 0; i < isChecked.length; i++) {
      if (isChecked[i] == true) {
        // Return the selected time slot
        //  return 'Selected time slot: ${items[i]}';
      }
    }
    // Return null if no time slot is selected
    return null;
  }
}

class TimeSlotWrap extends StatelessWidget {
  final TimeSlotController controller = Get.put(TimeSlotController());

  List<String> items = [
    '11:00 am',
    '11:00 am',
    '11:00 am',
    '11:00 am',
    '11:00 am',
    '11:00 am'
  ];

  TimeSlotWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimeSlotController>(
      builder: (controller) {
        return Wrap(
          children: List.generate(
            items.length,
            (index) => Padding(
              padding: const EdgeInsets.only(
                right: SSizes.sm,
                bottom: SSizes.md,
              ),
              child: GestureDetector(
                onTap: () {
                  controller.toggleCheckbox(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SSizes.radiusSmall),
                    border: Border.all(
                      color: SColors.primary,
                      width: 1,
                    ),
                  ),
                  width: 104, // Set the width of each checkbox
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          items[index],
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Obx(
                          () => Checkbox(
                            activeColor: SColors.primary,
                            visualDensity: VisualDensity.compact,
                            value: controller.isChecked[index],
                            onChanged: (bool? value) {
                              controller.toggleCheckbox(index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
