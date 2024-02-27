import 'package:flutter/material.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/workinghours_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: SSizes.lg, left: SSizes.lg, top: SSizes.md, bottom: SSizes.md),
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Us",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              STextStrings.aboutus,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
            ),
            const Divider(
              color: SColors.dividersColor,
            ),
            Text(
              "Working Hours",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //day timing
            const Padding(
              padding: EdgeInsets.only(top: SSizes.sm, bottom: 65),
              child: Column(
                children: [
                  WorkingHours(
                    day: "Monday",
                    timing: "9:00am - 8:00pm",
                  ),
                  WorkingHours(
                    day: "Tuesday",
                    timing: "9:00am - 8:00pm",
                  ),
                  WorkingHours(
                    day: "Wednesday",
                    timing: "9:00am - 8:00pm",
                  ),
                  WorkingHours(
                    day: "Thursday",
                    timing: "9:00am - 8:00pm",
                  ),
                  WorkingHours(
                    day: "Friday",
                    timing: "9:00am - 8:00pm",
                  ),
                  WorkingHours(
                    day: "Saturday",
                    timing: "9:00am - 8:00pm",
                  ),
                  WorkingHours(
                    day: "Sunday",
                    timing: "9:00am - 8:00pm",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
