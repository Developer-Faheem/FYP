import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Vendor_side/Salon/controllers/gallery_controller/gallery_controller.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/dialog_boxes/dashed_boarder_container.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class AddImageDialog extends StatelessWidget {
  const AddImageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GalleryImageController galleryImageController =
        Get.put(GalleryImageController()); // Initialize the controller

    return Dialog(
        elevation: 0,
        backgroundColor: SColors.bgMainScreens,
        child: Padding(
          padding: const EdgeInsets.all(SSizes.lg),
          child: Container(
            width: 330,
            height: SDeviceUtils.getScreenHeight() * 0.33,
            decoration: BoxDecoration(
              color: SColors.bgMainScreens,
              borderRadius: BorderRadius.circular(SSizes.radiusLarge),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add New Images",
                        style: Theme.of(context).textTheme.headlineLarge),
                    CircularButton(
                      onPressedCallback: () {
                        Get.back();
                      },
                      iconPath: "assets/icons/cross.svg",
                    ),
                  ],
                ),
                const SizedBox(height: SSizes.md),
                // Add image widget
                GestureDetector(
                  onTap: () async {
                    await galleryImageController.uploadGalleryImage();
                    //  Get.back();
                  },
                  child: Obx(() => DashedBorderContainer(
                        strokeWidth: 3.0,
                        color: SColors.primary,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.white,
                          child: galleryImageController.isImageUploading.value
                              ? Center(child: CircularProgressIndicator())
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/file.svg"),
                                    const SizedBox(
                                      height: SSizes.sm,
                                    ),
                                    Text("Choose Image to upload",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    const SizedBox(
                                      height: SSizes.xs,
                                    ),
                                    Text("Select jpg, png or jpeg file",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall),
                                  ],
                                ),
                        ),
                      )),
                ),

                const SizedBox(height: SSizes.lg),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomOutlinedButton(
                      buttonText: "Cancel",
                      height: 42,
                      width: 0.26,
                      gradient: SColors.MainOutlinedButtonGradient,
                      textStyle: Theme.of(context).textTheme.headlineMedium!,
                      onPressedCallback: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomButton(
                      onPressedCallback: () async {
                        // Logic for uploading image
                        await galleryImageController.uploadGalleryImage();

                        // Get.back();
                      },
                      buttonText: "Upload",
                      height: 42,
                      width: 0.26,
                      textStyle: Theme.of(context).textTheme.titleLarge!,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
