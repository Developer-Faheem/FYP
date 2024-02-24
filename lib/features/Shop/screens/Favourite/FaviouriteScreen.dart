import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/commons/widgets/cards/faviourite_card.dart';
import 'package:stylesage/navigation_menu.dart';
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
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
              ),
              child: AppBar(
                centerTitle: true,
                title: Text(
                  "Favourites",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                leading: GestureDetector(
                  onTap: () => controller.updateIndex(0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: SSizes.lg),
                    child: SvgPicture.asset(
                      "assets/icons/back_filled.svg",
                    ),
                  ),
                ),
              ),
            ),
          ),
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
