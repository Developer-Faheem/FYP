import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/dialog_boxes/add_services.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/temporary_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';

class VendorServices extends StatelessWidget {
  const VendorServices({Key? key3}) : super(key: key3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears
      body: SingleChildScrollView(
        // Wrap content in SingleChildScrollView
        child: TemporaryWidget(
          msg: '', // "No services added yet",
          image: SImages.service,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AddServicesDialog();
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
