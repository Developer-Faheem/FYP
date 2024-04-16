import 'package:flutter/material.dart';
import 'package:stylesage/features/User_side/Shop/screens/add_review/widgets/location_time_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.radiusLarge),
          topRight: Radius.circular(SSizes.radiusLarge),
        ),
      ),
      child: Column(
        children: [
          //content other than the tab bar
          Padding(
            padding: const EdgeInsets.only(
                top: SSizes.lg,
                left: SSizes.lg,
                right: SSizes.lg,
                bottom: SSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enclave Haven",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Haircuts, Makeup , Manicure ,Hydra facial",
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(
                  color: SColors.dividersColor,
                ),
                //salon address & time and date details
                const LocationTimeWidget(),
                const Divider(
                  color: SColors.dividersColor,
                ),
                const SizedBox(
                  height: SSizes.xs,
                ),
                //ratigs widget
                Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          STextStrings.askForReview,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: SSizes.sm,
                        ),
                        RatingBar.builder(
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: SColors.tertiary,
                                ),
                            onRatingUpdate: (rating) {})
                      ]),
                ),
                const SizedBox(
                  height: SSizes.xs,
                ),
                const Divider(
                  color: SColors.dividersColor,
                ),
                const SizedBox(
                  height: SSizes.md,
                ),
                Text(
                  "Add Detailed Review",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: SSizes.md,
                ),
                TextField(
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    // suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                    hintText: 'Your Review here...',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: SColors.primary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
