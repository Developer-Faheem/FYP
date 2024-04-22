import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/onboarding_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToUserScreen();
  }

  Future _navigateToUserScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {})
        .then((value) => Get.put(AuthenticationRepository()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgSplashScreen,
      child: Scaffold(
        backgroundColor: SColors.bgSplashScreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/purple_lines.svg',
              width: SDeviceUtils.getScreenWidth() * 1,
            ),
            Image.asset(
              SImages.lightAppLogo,
              // width: 266,
              // height: 268,
            ),
            SvgPicture.asset(
              'assets/icons/pink_lines.svg',
              width: SDeviceUtils.getScreenWidth() * 1,
            ),
          ],
        ),
      ),
    );
  }
}
