import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/features/User_side/Shop/screens/Summary_Appointment/Widgets/datarow.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class AppointmentSummaryScreen extends StatelessWidget {
  const AppointmentSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: AppBar().preferredSize,
                child: CustomAppbar1(
                  isOutlined: false,
                  title: "Review Summary",
                  onPressedCallback: () {
                    Get.back();
                  },
                )),
            body: Padding(
              padding: const EdgeInsets.only(
                top: SSizes.md,
                bottom: SSizes.md,
                left: SSizes.lg,
                right: SSizes.lg,
              ),
              child: Column(
                children: [
                  //Saloon and customer details
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: SColors.skyEffectColor.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(SSizes.radiusSmall),
                        border: Border.all(color: SColors.primary)),
                    child: const Padding(
                      padding: EdgeInsets.all(SSizes.md),
                      child: Column(
                        children: [
                          DataRows(
                            attribute: "Salon",
                            data: "Enclave, Haven",
                          ),
                          DataRows(
                            attribute: "Address",
                            data:
                                "NYC, Stree Maine#04...Ingelwoo hhs shhs shhs hs",
                          ),
                          DataRows(
                            attribute: "Name",
                            data: "Jessica Wilson",
                          ),
                          DataRows(
                            attribute: "Phone No",
                            data: "00-000-0000",
                          ),
                          DataRows(
                            attribute: "Booking Date",
                            data: "15-02-2002",
                          ),
                          DataRows(
                            attribute: "Booking Time",
                            data: "9Am-10Am",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                  // service expnse details
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: SColors.skyEffectColor.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(SSizes.radiusSmall),
                        border: Border.all(color: SColors.primary)),
                    child: const Padding(
                      padding: EdgeInsets.all(SSizes.md),
                      child: Column(
                        children: [
                          DataRows(
                            attribute: "HairCut",
                            data: "Rs. 1500",
                          ),
                          DataRows(
                            attribute: "Hair Style",
                            data: "Rs. 1500",
                          ),
                          DataRows(
                            attribute: "Medicure",
                            data: "Rs. 1500",
                          ),
                          Divider(
                            color: SColors.dividersColor,
                          ),
                          DataRows(
                            attribute: "Total",
                            data: "Rs. 4500",
                          ),
                          DataRows(
                            attribute: "Paid Amount",
                            data: "Rs. 500",
                          ),
                          Divider(
                            color: SColors.dividersColor,
                          ),
                          DataRows(
                            attribute: "Left Amount",
                            data: "Rs. 4000",
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: SDeviceUtils.getScreenHeight() * 0.17),
                  CustomButton(
                    onPressedCallback: () {
                      controller.updateIndex(0);
                      Get.off(() => UserNavigationMenu());
                    },
                    buttonText: "Back to Home",
                    textStyle: Theme.of(context).textTheme.titleLarge!,
                    width: 0.909,
                    height: 44,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
