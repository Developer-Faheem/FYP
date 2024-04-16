import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/cards/package_card.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Package extends StatelessWidget {
  const Package({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: SSizes.lg, top: SSizes.md, bottom: SSizes.md),
          child: Row(
            children: [
              Text(
                "Packages",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                width: SSizes.sm,
              ),
              Text(
                "(08)",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
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
                    bottom: SSizes.lg,
                    left: SSizes.lg,
                    right: SSizes.lg,
                  ),
                  child: PackageCard(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
