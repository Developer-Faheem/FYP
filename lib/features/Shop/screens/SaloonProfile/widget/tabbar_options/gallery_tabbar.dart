import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: SSizes.lg,
            top: SSizes.md,
            bottom: SSizes.md,
          ),
          child: Text(
            "Images",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,

            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 42.0, // Spacing between columns
            mainAxisSpacing: 38.0, // Spacing between rows
            padding: const EdgeInsets.only(left: 52, right: 52, bottom: 75),
            children: List.generate(6, (index) {
              return _buildGridItem(
                context,
                'assets/images/saloon.png',
              );
            }),
            // Add more items as needed
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: 88,
        height: 104,
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    );
  }
}
