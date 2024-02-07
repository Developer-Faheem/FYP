import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/commons/widgets/cards/faviourite_card.dart';
import 'package:stylesage/commons/widgets/cards/saloon_card.dart';
import 'package:stylesage/commons/widgets/cards/service_card.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/commons/widgets/services_rectangular.dart';
import 'package:stylesage/commons/widgets/services_rounded.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';
import 'package:stylesage/utils/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //     themeMode: ThemeMode.light,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: FaviouriteCard(),
        ),
      ),
    );
  }
}
