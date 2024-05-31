import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/features/User_side/Shop/models/appointment.dart';
import 'package:stylesage/features/User_side/Shop/screens/Summary_Appointment/Widgets/datarow.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class AppointmentSummaryScreen extends StatelessWidget {
  final AppointmentModel appointment;
  final VendorModel? vendor;

  const AppointmentSummaryScreen(
      {super.key, required this.appointment, this.vendor});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;
    final bookingController = BookingController.instance;

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: CustomAppbar1(
              isOutlined: false,
              title: "Review Summary",
              onPressedCallback: () {
                Get.back();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: SSizes.md,
              bottom: SSizes.md,
              left: SSizes.lg,
              right: SSizes.lg,
            ),
            child: Column(
              children: [
                // Saloon and customer details
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: SColors.skyEffectColor.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(SSizes.radiusSmall),
                    border: Border.all(color: SColors.primary),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SSizes.md),
                    child: Column(
                      children: [
                        DataRows(
                          attribute: "Salon",
                          data: appointment.salonName.isEmpty
                              ? "StyleSage"
                              : appointment.salonName,
                        ),
                        DataRows(
                          attribute: "Address",
                          data: appointment.vendorAddress.isEmpty
                              ? 'sector vip street 4'
                              : appointment.vendorAddress,
                        ),
                        DataRows(
                            attribute: "Name",
                            data: appointment.userName.isEmpty
                                ? "abdullah "
                                : appointment.userName),
                        DataRows(attribute: "Phone No", data: "0314 5886165"),
                        DataRows(
                          attribute: "Booking Date",
                          data: appointment.bookingDate.isEmpty
                              ? (bookingController.selectedDate.toString())
                              : appointment.bookingDate,
                        ),
                        DataRows(
                          attribute: "Booking Time",
                          data:
                              //  appointment.bookingTime.isEmpty
                              //     ? (bookingController.selectedTime.toString())
                              //     : appointment.bookingTime,
                              bookingController.selectedTime.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: SSizes.spaceBtwSections),
                // Service expense details
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: SColors.skyEffectColor.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(SSizes.radiusSmall),
                    border: Border.all(color: SColors.primary),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SSizes.md),
                    child: Column(
                      children: [
                        DataRows(
                          attribute: "Services",
                          data: appointment.services.isEmpty
                              ? (bookingController.combinedNamesString
                                  .toString())
                              : appointment.services,
                        ),
                        Divider(color: SColors.dividersColor),
                        DataRows(
                            attribute: "Total",
                            data: bookingController.totalPrice.toString()
                            //  appointment.totalPrice.toString().isEmpty
                            //     ? (bookingController.totalPrice.toString())
                            //     : appointment.totalPrice.toString(),
                            ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SDeviceUtils.getScreenHeight() * 0.26),
                CustomButton(
                  onPressedCallback: () {
                    controller.updateIndex(0);
                    Get.off(() => UserNavigationMenu());
                  },
                  buttonText: "Back to Home",
                  textStyle: Theme.of(context).textTheme.titleLarge!,
                  width: 0.909,
                  height: 44,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
