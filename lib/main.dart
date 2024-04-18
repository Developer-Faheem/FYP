import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Onboarding/screens/splash/splash_screen.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/theme/theme.dart';
import 'package:stylesage/vendor_nav_menu.dart';

void main() {
  //Todo: Add Widget binding
  //Todo: init local storage
  //Todo: await native splash
  //Todo: initilize the firebase
  //Todo: initilize the Authentication
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SAppTheme.lightTheme,
      // darkTheme: SAppTheme.darkTheme,
      home: VendorNavigationMenu(),
    );
  }
}
