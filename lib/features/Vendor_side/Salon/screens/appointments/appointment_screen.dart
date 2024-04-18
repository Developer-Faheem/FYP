import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/appointments/widgets/appointment_card_widget.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class VendorAppointmentScreen extends StatelessWidget {
  VendorAppointmentScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Booking List",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: SSizes.md),
          child: AppointmentCard(),
        ));
  }
}
