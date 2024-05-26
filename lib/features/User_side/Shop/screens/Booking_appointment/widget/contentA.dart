import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Shop/screens/Booking_appointment/widget/chip_widget.dart';
import 'package:stylesage/features/User_side/Shop/screens/Booking_appointment/widget/date_picker.dart';
import 'package:stylesage/features/User_side/Shop/screens/Booking_appointment/widget/payment_widget.dart';
import 'package:stylesage/features/User_side/Shop/screens/Booking_appointment/widget/time_slot.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/controller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class MainContentBooking extends StatefulWidget {
  const MainContentBooking({super.key});

  @override
  State<MainContentBooking> createState() => _MainContentBookingState();
}

class _MainContentBookingState extends State<MainContentBooking> {
  final DropDownController controller = DropDownController.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: SColors.bgMainScreens,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SSizes.radiusLarge),
            topRight: Radius.circular(SSizes.radiusLarge),
          ),
        ),
        child: Column(
          children: [
            // Content other than the tab bar
            Padding(
              padding: const EdgeInsets.all(SSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enclave Haven",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  // Booked services
                  Text(
                    "Booked Services : ",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Obx(() {
                    return Column(
                      children: [
                        ChipWidget(controller.selectedItems1
                            .map((item) => item as Map<String, String>)
                            .toList()),
                        ChipWidget(controller.selectedItems2
                            .map((item) => item as Map<String, String>)
                            .toList()),
                        ChipWidget(controller.selectedItems3
                            .map((item) => item as Map<String, String>)
                            .toList()),
                        ChipWidget(controller.selectedItems4
                            .map((item) => item as Map<String, String>)
                            .toList()),
                        ChipWidget(controller.selectedItems5
                            .map((item) => item as Map<String, String>)
                            .toList()),
                        ChipWidget(controller.selectedItems6
                            .map((item) => item as Map<String, String>)
                            .toList()),
                        ChipWidget(controller.selectedItems7
                            .map((item) => item as Map<String, String>)
                            .toList()),
                      ],
                    );
                  }),
                  const Divider(
                    color: SColors.dividersColor,
                  ),

                  // Date selection / calendar
                  Text(
                    "BOOK APPOINTMENT",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(letterSpacing: 2),
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  Center(
                    child: DateSelectionButton(),
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  //Time slot selection
                  Text(
                    "Available Slots",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(letterSpacing: 2),
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  TimeSlotWrap(),

                  //Total price
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Boooking Price:",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(letterSpacing: 2),
                      ),
                      Text(
                        "Rs 3500/-",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  //Payement method
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Payment Method",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(letterSpacing: 2),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),

                  const PaymentWidget(
                      leading: "assets/images/payment/jazzcash.png",
                      title: "Jazz Cash"),
                  const PaymentWidget(
                      leading: "assets/images/payment/jazzcash.png",
                      title: "Jazz Cash"),
                  const PaymentWidget(
                      leading: "assets/images/payment/jazzcash.png",
                      title: "Jazz Cash"),

                  const SizedBox(
                    height: SSizes.lg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
