import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class TimeSelectionButton extends StatelessWidget {
  final BookingController bookingController = BookingController.instance;

  TimeSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: bookingController.selectTime,
          child: Container(
            decoration: BoxDecoration(
              color: SColors.primary,
              borderRadius: BorderRadius.circular(SSizes.radiusLarge),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Time',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
        const SizedBox(width: SSizes.md),
        Obx(
          () => Text(
            bookingController.formattedSelectedTime.value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
