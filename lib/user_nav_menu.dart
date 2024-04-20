import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Personalization/screens/profile_main/profile_screen.dart';
import 'package:stylesage/features/User_side/Shop/screens/appointment/appointment_screen.dart';
import 'package:stylesage/features/User_side/Shop/screens/Favourite/FaviouriteScreen.dart';
import 'package:stylesage/features/User_side/Shop/screens/Home/HomeScreen.dart';
import 'package:stylesage/features/User_side/Shop/screens/Saloons/saloon_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final RxInt _currentIndex = 0.obs;

  void updateIndex(int index) {
    _currentIndex.value = index;
  }
}

class UserNavigationMenu extends StatelessWidget {
  final List<String> icons = [
    "assets/icons/navigation_menu/home.svg",
    "assets/icons/navigation_menu/saloon.svg",
    "assets/icons/navigation_menu/appointment.svg",
    "assets/icons/navigation_menu/favourite.svg",
    "assets/icons/navigation_menu/profile.svg",
  ];
  final List<String> sIcons = [
    "assets/icons/navigation_menu/Shome.svg",
    "assets/icons/navigation_menu/Ssaloon.svg",
    "assets/icons/navigation_menu/Sappointment.svg",
    "assets/icons/navigation_menu/Sfavourite.svg",
    "assets/icons/navigation_menu/Sprofile.svg",
  ];

  UserNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => IndexedStack(
            index: controller._currentIndex.value,
            children: const [
              HomeScreen(),
              SalonScreen(),
              AppointmentScreen(),
              FavouriteScreen(),
              ProfileScreen()
            ],
          )),
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
                5,
                (index) => Expanded(
                  child: ClipPath(
                    clipper: VShapeClip(),
                    child: GestureDetector(
                      onTap: () => controller._currentIndex.value = index,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                          gradient: controller._currentIndex.value == index
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
                            controller._currentIndex.value == index
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
                                controller._currentIndex.value == index
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
    path.moveTo(size.width / 1.2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 5.8, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
