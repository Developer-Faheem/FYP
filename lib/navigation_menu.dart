import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';

class NavigationMenu extends StatefulWidget {
  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;
  List<String> icons = [
    "assets/icons/navigation_menu/home.svg",
    "assets/icons/navigation_menu/saloon.svg",
    "assets/icons/navigation_menu/appointment.svg",
    "assets/icons/navigation_menu/favourite.svg",
    "assets/icons/navigation_menu/profile.svg",
  ];
  List<String> Sicons = [
    "assets/icons/navigation_menu/Shome.svg",
    "assets/icons/navigation_menu/Ssaloon.svg",
    "assets/icons/navigation_menu/Sappointment.svg",
    "assets/icons/navigation_menu/Sfavourite.svg",
    "assets/icons/navigation_menu/Sprofile.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Screen1(),
          Screen2(),
          Screen1(),
          Screen2(),
          Screen2(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 68, // Set the desired height
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Color(0XFF4D2C5A),
          boxShadow: [
            BoxShadow(color: SColors.primary.withOpacity(0.1), blurRadius: 8),
          ],
        ),
        child: Row(
          children: List.generate(
            5,
            (index) => Expanded(
              child: ClipPath(
                clipper: VShapeClip(),
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                    gradient: index == _currentIndex
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
                      index == _currentIndex
                          ? Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: SColors.bgMainScreens,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  height: 17,
                                )
                              ],
                            )
                          : const SizedBox(height: 22),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: index == _currentIndex
                            ? SvgPicture.asset(
                                Sicons[index].toString(),
                              )
                            : SvgPicture.asset(icons[index].toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("screeen 1"),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
