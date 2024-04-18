import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class TemporaryWidget extends StatelessWidget {
  String msg;
  String image;
  TemporaryWidget({required this.msg, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: SSizes.lg, top: SSizes.lg),
              child: Text(
                msg,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SDeviceUtils.getScreenHeight() * 0.08,
        ),
        Image.asset(image),
      ],
    );
  }
}
