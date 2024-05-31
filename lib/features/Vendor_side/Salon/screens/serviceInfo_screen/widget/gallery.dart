import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/dialog_boxes/add_image_dialog.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/temporary_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';

class VendorGallery extends StatelessWidget {
  const VendorGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemporaryWidget(
        msg: '', //"No photos added yet",
        image: SImages.gallery,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const AddImageDialog();
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: SColors.tertiary,
        child: const Icon(
          Icons.add,
          color: SColors.bgMainScreens,
        ),
      ),
    );
  }
}
