import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/cards/appointmentCards/completed_card.dart';
import 'package:stylesage/commons/widgets/cards/appointmentCards/upcoming_card.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(
            top: SSizes.md,
            bottom: SSizes.md,
            left: SSizes.lg,
            right: SSizes.lg,
          ),
          child: CompletedCard(),
        );
      },
    );
  }
}
