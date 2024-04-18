import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/appointments/widgets/bookingInfoRow_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      decoration: BoxDecoration(
          color: SColors.bgMainScreens,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
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
                    CircleAvatar(
                      radius: 28,
                      // backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(SImages.anonymous),
                    ),
                    SizedBox(
                      width: SSizes.md,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jessica Wilson",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Rs 3,200",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6),
                    child: Text(
                      "Pending",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SSizes.radiusLarge),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SSizes.md,
            ),
            //booking info
            BookingInfoRowWidget(
              data: "Hair colouring, Hair cutting , Make Up",
              iconPath: "assets/icons/appointmentCardVendor/pade.svg",
            ),
            BookingInfoRowWidget(
              data: "02 Febuary, 2022 at 8:30 AM",
              iconPath: "assets/icons/appointmentCardVendor/Calendar.svg",
            ),
            BookingInfoRowWidget(
              data: "Service ID: #037485",
              iconPath: "assets/icons/appointmentCardVendor/serviceId.svg",
            ),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                    buttonText: "Cancel",
                    height: 28,
                    width: 0.23,
                    gradient: SColors.MainOutlinedButtonGradient,
                    textStyle: Theme.of(context).textTheme.headlineMedium!,
                    onPressedCallback: () {}),
                SizedBox(
                  width: SSizes.md,
                ),
                CustomButton(
                    onPressedCallback: () {},
                    buttonText: "Approve",
                    height: 28,
                    width: 0.23,
                    textStyle: Theme.of(context).textTheme.titleMedium!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
