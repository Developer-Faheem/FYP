import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/services_rectangular.dart';
import 'package:stylesage/main.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  final List<Map<String, dynamic>> dataList = [
    {'service': 'Widget 1', 'logo': 'https://example.com/logo1.png'},
    {'service': 'Widget 2', 'logo': 'https://example.com/logo2.png'},
    {'service': 'Widget 3', 'logo': 'https://example.com/logo3.png'},
    {'service': 'Widget 4', 'logo': 'https://example.com/logo4.png'},
    {'service': 'Widget 5', 'logo': 'https://example.com/logo5.png'},
    {'service': 'Widget 6', 'logo': 'https://example.com/logo6.png'},
    {'service': 'Widget 7', 'logo': 'https://example.com/logo7.png'},
    {'service': 'Widget 8', 'logo': 'https://example.com/logo8.png'},
    {'service': 'Widget 9', 'logo': 'https://example.com/logo9.png'},
    {'service': 'Widget 10', 'logo': 'https://example.com/logo10.png'},
    {'service': 'Widget 11', 'logo': 'https://example.com/logo11.png'},
    {'service': 'Widget 12', 'logo': 'https://example.com/logo12.png'},
  ];

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
        body: GridView.builder(
          itemCount:
              (dataList.length / 3).ceil(), // Calculate the number of rows
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of widgets in each row
            crossAxisSpacing: 10.0, // Spacing between widgets horizontally
            mainAxisSpacing: 10.0, // Spacing between rows vertically
          ),
          itemBuilder: (BuildContext context, int index) {
            // Build each row of the grid
            return ServicesRectangularWidget();
          },
        ),
      )),
    );
  }
}
