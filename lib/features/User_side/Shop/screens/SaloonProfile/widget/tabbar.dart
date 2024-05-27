import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/salonProfile/controller.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/tabbar_options/Reviews_tabbar.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/tabbar_options/aboutus_tabbar.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/tabbar_options/gallery_tabbar.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/tabbar_options/packages_tabbar.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/tabbar_options/services_tabbar.dart';
import 'package:stylesage/utils/constants/colors.dart';

class Tabbar extends StatelessWidget {
  final VendorModel? vendor;
  const Tabbar({
    this.vendor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropDownController(vendor!.id));
    return Expanded(
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            dividerColor: SColors.dividersColor,
            indicatorColor: SColors.tertiary,
            tabs: [
              Tab(
                child: Text(
                  "Packages",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  "Services",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  "Gallery",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  "Reviews",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  "About Us",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Package(
                    vendor: vendor,
                  ),
                ),
                Center(
                    child: ServicesTab(
                  vendorId: vendor!.id,
                )),
                Center(
                    child: Gallery(
                  vendorId: vendor!.id,
                )),
                const Center(
                  child: Review(),
                ),
                Center(child: AboutUs(vendor: vendor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
