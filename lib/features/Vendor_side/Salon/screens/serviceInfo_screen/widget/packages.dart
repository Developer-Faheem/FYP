import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/dialog_boxes/add_package_dialog.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/temporary_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';

class VendorPackages extends StatelessWidget {
  const VendorPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: TemporaryWidget(
          msg: "No packages added yet",
          image: SImages.package,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: SColors.bgMainScreens,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AddPackageDialog();
            },
          );
        },
        shape: CircleBorder(),
        backgroundColor: SColors.tertiary,
      ),
    );
  }
}
