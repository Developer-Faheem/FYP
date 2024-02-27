import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/cards/ReviewCard.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: SSizes.lg, top: SSizes.md, bottom: SSizes.md),
          child: Text(
            "Reviews",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        //packages cards
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(
                    top: SSizes.sm,
                    bottom: SSizes.md,
                    left: SSizes.lg,
                    right: SSizes.lg,
                  ),
                  child: ReviewCard(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
