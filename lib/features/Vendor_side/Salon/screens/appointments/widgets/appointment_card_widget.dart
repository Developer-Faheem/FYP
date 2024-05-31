import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/User_side/Shop/models/appointment.dart';
import 'package:stylesage/features/Vendor_side/Personalization/controllers/fetchAppointments/fetchAppointments.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/appointments/widgets/bookingInfoRow_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final appointmentController = AppointmentControllerVendor.instance;
    // Function to get the first 11 characters of a string safely
    String getFirst11Chars(String input) {
      return input.length > 11 ? input.substring(0, 11) : input;
    }

    return Container(
      height: appointment.userSideStatus == 'upcoming' ? 235 : 210,
      decoration: BoxDecoration(
          color: SColors.bgMainScreens,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(width: 2, color: SColors.primary),
          borderRadius: BorderRadius.circular(SSizes.radiusSmall)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 14),
        child: Column(
          children: [
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      // backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(SImages.anonymous),
                    ),
                    const SizedBox(
                      width: SSizes.md,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.userName ?? 'faheem',
                          // "Jessica Wilson",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          appointment.totalPrice.toString() ?? "Rs. 1200",
                          //"Rs 3,200",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SSizes.radiusLarge),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6),
                    child: Text(
                      appointment.userSideStatus == 'upcoming'
                          ? "Pending"
                          : appointment.userSideStatus == 'cancel'
                              ? "cancelled"
                              : "completed",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.md,
            ),
            //booking info
            BookingInfoRowWidget(
              data: appointment.services,
              // "Hair colouring, Hair cutting , Make Up",
              iconPath: "assets/icons/appointmentCardVendor/pade.svg",
            ),
            BookingInfoRowWidget(
              data:
                  "${getFirst11Chars(appointment.bookingDate)} at ${appointment.bookingTime}",
              iconPath: "assets/icons/appointmentCardVendor/Calendar.svg",
            ),
            BookingInfoRowWidget(
              data: "Service ID: ${getFirst11Chars(appointment.appointmentId)}",
              iconPath: "assets/icons/appointmentCardVendor/serviceId.svg",
            ),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // CustomOutlinedButton(
                //     buttonText: "Cancel",
                //     height: 28,
                //     width: 0.23,
                //     gradient: SColors.MainOutlinedButtonGradient,
                //     textStyle: Theme.of(context).textTheme.headlineMedium!,
                //     onPressedCallback: () {}),
                const SizedBox(
                  width: SSizes.md,
                ),
                appointment.userSideStatus == 'upcoming'
                    ? CustomButton(
                        onPressedCallback: () {
                          appointmentController.updateAppointmentDataVndor();
                        },
                        buttonText: "Mark as Complete",
                        height: 28,
                        width: 0.34,
                        textStyle: Theme.of(context).textTheme.titleMedium!)
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
