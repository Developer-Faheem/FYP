import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/circular_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/faviourite_button.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/features/User_side/Shop/controllers/salonProfile/package_controller.dart';
import 'package:stylesage/features/User_side/Shop/screens/Booking_appointment/booking_appointment_screen.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/main_content.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/reviews_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SalonProfileScreen extends StatelessWidget {
  final VendorModel? vendor;
  const SalonProfileScreen({super.key, this.vendor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PackageController2(vendor!.id));
    final bookingController = Get.put(BookingController());

    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //The header image
              Column(
                children: [
                  Container(
                    height: SDeviceUtils.getScreenHeight() * 0.24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/salon_profile_bg.png'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: SColors.bgMainScreens,
                    ),
                  )
                ],
              ),

              //salon profile main content container
              Positioned(
                top: SDeviceUtils.getScreenHeight() * 0.224,
                bottom: 0,
                left: 0,
                right: 0,
                child: MainContent(
                  vendor: vendor,
                ),
              ),

              //Ratings Widget
              Positioned(
                top: SDeviceUtils.getScreenHeight() * 0.2065,
                left: SDeviceUtils.getScreenWidth() * 0.5 - 152 / 2,
                child: const ReviewWidget(
                  ratings: "5.0 (1 Reviews)",
                ),
              ),

              //back button
              Positioned(
                left: SSizes.lg,
                top: SSizes.lg,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/icons/back_filled.svg"),
                ),
              ),

              //favourite button
              Positioned(
                right: SSizes.lg,
                top: SDeviceUtils.getScreenHeight() * 0.1565,
                child: FaviouriteButton(
                  vendorId: vendor!.id,
                ),
              ),

              //share button
              Positioned(
                right: SDeviceUtils.getScreenHeight() * 0.095,
                top: SDeviceUtils.getScreenHeight() * 0.1565,
                child: CircularButton(
                  onPressedCallback: () {},
                  iconPath: "assets/icons/share.svg",
                ),
              ),

              //book appointment button
              Positioned(
                bottom: 0,
                child: Container(
                  height: 65,
                  width: SDeviceUtils.getScreenWidth(),
                  decoration: BoxDecoration(
                    color: SColors.bgMainScreens,
                    border: Border.all(color: SColors.dividersColor),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(SSizes.radiusLarge),
                      topRight: Radius.circular(SSizes.radiusLarge),
                    ),
                  ),
                  child: Center(
                    child: CustomButton(
                        buttonText: "Book Appointment",
                        textStyle: Theme.of(context).textTheme.titleLarge!,
                        width: 0.909,
                        height: 44,
                        onPressedCallback: () {
                          Get.to(() => BookingAppointmentScreen(
                                vendor: vendor,
                              ));
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
