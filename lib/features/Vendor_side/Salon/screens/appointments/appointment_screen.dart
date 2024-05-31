import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/completed_card_shimmer.dart';
import 'package:stylesage/commons/widgets/cards/appointmentCards/completed_card.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/features/Vendor_side/Personalization/controllers/fetchAppointments/fetchAppointments.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/appointments/widgets/appointment_card_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class VendorAppointmentScreen extends StatelessWidget {
  const VendorAppointmentScreen({Key? key1}) : super(key: key1);

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    Get.put(BookingController());
    final appointmentController = Get.put(AppointmentControllerVendor());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Booking List",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Obx(() {
          if (appointmentController.isLoading.value)
            return const CompletedCardShimmer();

          if (appointmentController.appointment.isEmpty) {
            return const Center(
              child: Text(
                "No completed appointments",
                style: TextStyle(color: SColors.primary),
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: appointmentController.appointment.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: SSizes.md,
                  bottom: SSizes.md,
                  left: SSizes.lg,
                  right: SSizes.lg,
                ),
                child: AppointmentCard(
                    appointment: appointmentController.appointment[index]),
              );
            },
          );
        }));
  }
}
