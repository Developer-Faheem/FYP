import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Earning_List/widgets/earning_card.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class EarningListScreen extends StatelessWidget {
  const EarningListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: CustomAppbar1(
                title: "Earning List",
                isOutlined: false,
                onPressedCallback: () {
                  Get.back();
                },
              )),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: SSizes.sm),
                    child: EarningCard(),
                  );
                },
              )),
        ),
      ),
    );
  }
}
