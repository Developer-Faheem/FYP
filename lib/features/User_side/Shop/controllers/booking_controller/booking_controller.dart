import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';

class BookingController extends GetxController {
  static BookingController get instance => Get.find();

  var selectedTime = TimeOfDay.now().obs;
  var formattedSelectedTime = 'No time selected'.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  var totalPrice = 0.0;
  String combinedNamesString = '';

  @override
  void onInit() {
    super.onInit();
  }

  extractNamesBeforePrice(List<RxList<dynamic>> selectedItemsLists) {
    List<String> combinedNames = [];

    for (var list in selectedItemsLists) {
      for (var item in list) {
        var mapItem = item as Map<String, String>;
        var priceString =
            mapItem.values.firstWhere((value) => value.contains('Rs.'));
        var parts = priceString.split('- Rs.');
        if (parts.length > 1) {
          // Add the part before 'Rs.' to the combinedNames list
          combinedNames.add(parts[0].trim());
        }
      }
    }

    // Concatenate the parts before 'Rs.' into a single string
    combinedNamesString = combinedNames.join(',');

    // Debugging output
    print('Combined Names: $combinedNamesString');

    // Return the concatenated string
    // return combinedNamesString;
  }

  double extractPrices2(List<RxList<dynamic>> selectedItemsLists) {
    List<double> prices = [];
    for (var list in selectedItemsLists) {
      for (var item in list) {
        var mapItem = item as Map<String, String>;
        var priceString =
            mapItem.values.firstWhere((value) => value.contains('- Rs.'));
        var parts = priceString.split('Rs.');
        if (parts.length > 1) {
          var pricePart = parts[1].trim().split(' ')[0];
          prices.add(double.parse(pricePart));
        }
      }
    }
    totalPrice = prices.fold(0.0, (sum, price) => sum + price);
    return totalPrice;
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
