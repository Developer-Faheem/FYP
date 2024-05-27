import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/shimmer/shimmer_loader.dart';
import 'package:stylesage/features/User_side/Shop/controllers/galleryController.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Gallery extends StatelessWidget {
  final String? vendorId;

  const Gallery({
    this.vendorId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GalleryController controller = Get.put(
        GalleryController(vendorId!)); // Initialize with actual vendorId

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
          child: Obx(() {
            if (controller.isLoading.value) {
              return _buildShimmerGrid();
            } else if (controller.images.isEmpty) {
              return Center(
                child: Text(
                  'No images available',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            } else {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 42.0, // Spacing between columns
                  mainAxisSpacing: 38.0, // Spacing between rows
                ),
                padding: const EdgeInsets.only(left: 52, right: 52, bottom: 75),
                itemCount: controller.images.length,
                itemBuilder: (context, index) {
                  return _buildGridItem(
                    context,
                    controller.images[index],
                  );
                },
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: 88,
        height: 104,
        fit: BoxFit.cover, // Adjust the fit as needed
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Center(
          child: Column(
            children: [
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text(
                'Unable to load',
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 42.0, // Spacing between columns
        mainAxisSpacing: 38.0, // Spacing between rows
      ),
      padding: const EdgeInsets.only(left: 52, right: 52, bottom: 75),
      itemCount: 6, // Number of shimmer items
      itemBuilder: (context, index) {
        return const SShimmerEffect(width: 88, height: 104, radius: 12);
      },
    );
  }
}
