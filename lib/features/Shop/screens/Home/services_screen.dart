import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/services_rectangular.dart';
import 'package:stylesage/features/Shop/screens/Home/widgets/data.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Services",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: SSizes.lg),
                child: SvgPicture.asset(
                  "assets/icons/back_filled.svg",
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: SSizes.lg,
              bottom: SSizes.md,
              left: SSizes.lg,
              right: SSizes.lg,
            ),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 25.0,
              children: dataList.map((item) {
                return ServicesRectangularWidget(
                  serviceName: item['service'],
                  imagePath: item['logo'],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
