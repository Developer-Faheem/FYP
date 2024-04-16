import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/cards/faviourite_card.dart';
import 'package:stylesage/commons/widgets/custom_appbar1.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
                title: "Favourities",
                isOutlined: true,
                onPressedCallback: () {
                  controller.updateIndex(0);
                },
              )),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(
                  top: SSizes.md,
                  bottom: SSizes.md,
                  left: SSizes.lg,
                  right: SSizes.lg,
                ),
                child: FaviouriteCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
