import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/appointments/appointment_screen.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/home/home_screen.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/profile_main/vendor_profile_screen.dart';
import 'package:stylesage/features/Vendor_side/Salon/screens/serviceInfo_screen/service_info_screen.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';

class VendorNavigationController extends GetxController {
  static VendorNavigationController get instance => Get.find();
  final RxInt _currentIndex = 0.obs;

  void updateIndex(int index) {
    _currentIndex.value = index;
  }
}

class VendorNavigationMenu extends StatelessWidget {
  final List<String> icons = [
    "assets/icons/navigation_menu/home.svg",
    "assets/icons/navigation_menu/appointment.svg",
    "assets/icons/navigation_menu/serviceInfo.svg",
    "assets/icons/navigation_menu/profile.svg",
  ];
  final List<String> sIcons = [
    "assets/icons/navigation_menu/Shome.svg",
    "assets/icons/navigation_menu/Sappointment.svg",
    "assets/icons/navigation_menu/sserviceInfo.svg",
    "assets/icons/navigation_menu/Sprofile.svg",
  ];

  VendorNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final vendorController = Get.put(VendorNavigationController());
    final controller = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: SColors.bgMainScreens,
      body: Obx(
        () => IndexedStack(
          index: vendorController._currentIndex.value,
          children: const [
            VendorHomeScreen(),
            VendorAppointmentScreen(),
            VendorServiceInfoScreen(),
            VendorProfileScreen()
            //  ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 68, // Set the desired height
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: const Color(0XFF4D2C5A),
            boxShadow: [
              BoxShadow(color: SColors.primary.withOpacity(0.1), blurRadius: 8),
            ],
          ),
          child: Obx(
            () => Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: ClipPath(
                    clipper: VShapeClip(),
                    child: GestureDetector(
                      onTap: () => vendorController._currentIndex.value = index,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                          gradient:
                              vendorController._currentIndex.value == index
                                  ? LinearGradient(
                                      colors: [
                                        SColors.bgMainScreens.withOpacity(0.3),
                                        SColors.primary.withOpacity(0.6),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : null,
                        ),
                        child: Column(
                          children: [
                            vendorController._currentIndex.value == index
                                ? Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: SColors.bgMainScreens,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 17,
                                      )
                                    ],
                                  )
                                : const SizedBox(height: 22),
                            SvgPicture.asset(
                                vendorController._currentIndex.value == index
                                    ? sIcons[index]
                                    : icons[index]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class VShapeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width / 1.32, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 4.1, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
