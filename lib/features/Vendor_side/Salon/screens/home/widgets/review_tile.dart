import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(SImages.anonymous),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Donna Bins",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "02 Dec",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    RatingBar.builder(
                        itemSize: 16,
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: SColors.tertiary,
                            ),
                        onRatingUpdate: (rating) {}),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "4.5",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet.",
                  style: Theme.of(context).textTheme.headlineSmall,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
