import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void setDate(DateTime newDate) {
    selectedDate.value = newDate;
  }
}

class DateSelectionButton extends StatelessWidget {
  final DatePickerController dateController = Get.put(DatePickerController());

  DateSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _selectDate(context, dateController),
          child: Container(
            decoration: BoxDecoration(
              color: SColors.primary,
              borderRadius: BorderRadius.circular(SSizes.radiusLarge),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Date',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: SSizes.md,
        ),
        Obx(() => Text(
              dateController.selectedDate.toString().substring(0, 11),
              style: Theme.of(context).textTheme.titleSmall,
            )),
      ],
    );
  }

  void _selectDate(
      BuildContext context, DatePickerController dateController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateController.selectedDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        return true;
      },
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: SColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      dateController.setDate(picked);
    }
  }
}
