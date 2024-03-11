import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';

class SliderController extends GetxController {
  var sliderValue = 0.0.obs;

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }
}

class SliderWithMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SliderController sliderController = Get.put(SliderController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.maxFinite,
          child: Obx(
            () => Slider(
              value: sliderController.sliderValue.value,
              min: 0.0,
              max: 50.0,
              divisions: 10,
              inactiveColor: SColors.dividersColor,
              activeColor: SColors.tertiary,
              thumbColor: SColors.secondary,
              onChanged: (double value) {
                sliderController.updateSliderValue(value);
              },
              onChangeEnd: (double value) {
                sliderController.updateSliderValue(value);
              },
              label: '${sliderController.sliderValue.value} km',
            ),
          ),
        ),
      ],
    );
  }
}
