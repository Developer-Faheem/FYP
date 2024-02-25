import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class CustomAppbar1 extends StatelessWidget {
  final VoidCallback onPressedCallback;
  final String title;
  final bool isOutlined;

  const CustomAppbar1(
      {super.key,
      required this.onPressedCallback,
      required this.title,
      required this.isOutlined});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isOutlined
                ? SColors.dividersColor
                : SColors.bgMainScreens, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: GestureDetector(
          onTap: () => onPressedCallback(),
          child: Padding(
            padding: const EdgeInsets.only(left: SSizes.lg),
            child: SvgPicture.asset(
              "assets/icons/back_filled.svg",
            ),
          ),
        ),
      ),
    );
  }
}
