import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class DateSelectionButton extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());

  DateSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => bookingController.selectDate(),
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
              bookingController.selectedDate.toString().substring(0, 11),
              style: Theme.of(context).textTheme.titleSmall,
            )),
      ],
    );
  }
}
