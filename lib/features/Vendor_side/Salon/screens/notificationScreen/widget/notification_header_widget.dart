import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          "Hello, Enclave Haven",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: SSizes.lg,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: 30.5,
            ),
          ),
        ),
      ],
    );
  }
}
