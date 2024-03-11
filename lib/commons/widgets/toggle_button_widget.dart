import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';

class ToggleController extends GetxController {
  RxBool isSalonToggled = false.obs;
  RxBool isServiceToggled = true.obs;
  RxBool isFaviourite = true.obs;

  void toogleFaviourite(value) {
    if (isFaviourite.value == false) {
      isFaviourite.value = true;
    } else {
      isFaviourite.value = false;
    }
    print(isFaviourite);
  }

  void toggleFilter() {
    if (isSalonToggled.value == false) {
      isSalonToggled.value = true;
      isServiceToggled.value = false;
    } else if (isSalonToggled.value == true) {
      isSalonToggled.value = false;
      isServiceToggled.value = true;
    }
  }
}

class ToggleButton extends StatelessWidget {
  final bool isToggled;
  final bool isFilter;

  const ToggleButton({
    required this.isToggled,
    required this.isFilter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toggleController = Get.put(ToggleController());

    return SizedBox(
      width: 54,
      height: 20,
      child: Switch(
        value: isToggled,
        onChanged: (value) {
          isFilter
              ? toggleController.toggleFilter()
              : toggleController.toogleFaviourite(value);
        },
        trackOutlineColor: MaterialStateProperty.resolveWith(
          (states) => SColors.secondary,
        ),
        activeTrackColor: SColors.secondary,
        activeColor: SColors.bgMainScreens,
        inactiveThumbColor: SColors.secondary,
        inactiveTrackColor: SColors.bgMainScreens,
      ),
    );
  }
}
