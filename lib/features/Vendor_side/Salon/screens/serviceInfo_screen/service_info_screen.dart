import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/gallery.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/packages.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/widget/services.dart';
import 'package:stylesage/utils/constants/colors.dart';

class VendorServiceInfoScreen extends StatelessWidget {
  const VendorServiceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Salon Service Center",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              bottom: TabBar(
                dividerColor: SColors.dividersColor,
                indicatorColor: SColors.tertiary,
                tabs: [
                  Tab(
                    child: Text(
                      "Services",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Packages",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Gallery",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [VendorServices(), VendorPackages(), VendorGallery()],
            ),
          ),
        ),
      ),
    );
  }
}
