import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class RadioController extends GetxController {
  var selectedOption = ''.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}

class CancelAppointmentScreen extends StatelessWidget {
  final RadioController controller = Get.put(RadioController());

  // List of options
  final List<String> options = [
    STextStrings.reson1,
    STextStrings.reason2,
    STextStrings.reason3,
    STextStrings.reason4,
    STextStrings.reason5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: CustomAppbar1(
            isOutlined: false,
            title: "Cancel Appointment",
            onPressedCallback: () {
              Get.back();
            },
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: SSizes.lg, left: SSizes.lg, right: SSizes.lg),
            child: Column(
              children: [
                Text(
                  STextStrings.cancellaionQuestion,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                GetBuilder<RadioController>(
                  builder: (controller) => Column(
                    children: generateRadioListTiles(context),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: SColors.dividersColor,
          ),
          //write the reason
          Padding(
            padding: const EdgeInsets.only(left: SSizes.lg, right: SSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Other Reason:",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: SSizes.spaceBtwSections,
                ),
                TextField(
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Enter Other reason here...',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: SColors.primary),
                    ),
                  ),
                ),
                SizedBox(height: SDeviceUtils.getScreenHeight() * 0.13),
                CustomButton(
                  onPressedCallback: () {
                    Get.back();
                  },
                  buttonText: "Cancel Appointment",
                  textStyle: Theme.of(context).textTheme.titleLarge!,
                  width: 0.909,
                  height: 44,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Function to generate RadioListTile widgets
  List<Widget> generateRadioListTiles(BuildContext context) {
    return options.map((option) {
      return Obx(() => RadioListTile<String>(
            value: option,
            onChanged: (value) {
              controller.selectOption(value!);
              //      print('Selected Option: $value');
            },
            title: Text(
              option,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
            groupValue: controller.selectedOption.value,
            fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.selected)) {
                return SColors.tertiary;
              }
              return SColors.primary;
            }),
          ));
    }).toList();
  }
}
