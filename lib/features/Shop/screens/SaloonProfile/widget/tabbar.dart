import 'package:flutter/material.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/tabbar_options/Reviews_tabbar.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/tabbar_options/aboutus_tabbar.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/tabbar_options/gallery_tabbar.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/tabbar_options/packages_tabbar.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/tabbar_options/services_tabbar.dart';
import 'package:stylesage/utils/constants/colors.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  "Services",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  "Packages",
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
          const Expanded(
            child: TabBarView(
              children: [
                Center(child: ServicesTab()),
                Center(
                  child: Package(),
                ),
                Center(child: Gallery()),
                Center(
                  child: Review(),
                ),
                Center(child: AboutUs()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
