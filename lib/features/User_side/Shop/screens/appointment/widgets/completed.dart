import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/completed_card_shimmer.dart';
import 'package:stylesage/commons/widgets/cards/appointmentCards/completed_card.dart';
import 'package:stylesage/features/User_side/Shop/controllers/appointment/appointment_contrroller.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentController = Get.put(AppointmentController());
    return Obx(() {
      if (appointmentController.isLoading.value)
        return const CompletedCardShimmer();

      if (appointmentController.appointment2.isEmpty) {
        return const Center(
          child: Text(
            "No completed appointments",
            style: TextStyle(color: SColors.primary),
          ),
        );
      }
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: appointmentController.appointment2.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: SSizes.md,
              bottom: SSizes.md,
              left: SSizes.lg,
              right: SSizes.lg,
            ),
            child: CompletedCard(
                appointment: appointmentController.appointment2[index]),
          );
        },
      );
    });
  }
}
