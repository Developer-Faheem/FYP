import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';

class BookingController extends GetxController {
  static BookingController get instance => Get.find();

  var selectedTime = TimeOfDay.now().obs;
  var formattedSelectedTime = 'No time selected'.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) => true,
      builder: (BuildContext context, Widget? child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: SColors.primary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
    );
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      formatSelectedTime();
    }
  }

  void formatSelectedTime() {
    final selectedTimeValue = selectedTime.value;
    final hour = selectedTimeValue.hourOfPeriod;
    final minute = selectedTimeValue.minute.toString().padLeft(2, '0');
    final period = selectedTimeValue.period == DayPeriod.am ? 'AM' : 'PM';
    formattedSelectedTime.value = '$hour:$minute $period';
  }
}
