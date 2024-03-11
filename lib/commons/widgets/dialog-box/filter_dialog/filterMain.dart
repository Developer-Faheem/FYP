import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/commons/widgets/dialog-box/filter_dialog/filter_tile.dart';
import 'package:stylesage/commons/widgets/dialog-box/filter_dialog/slider_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class FilterDialogBox extends StatelessWidget {
  FilterDialogBox();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: SColors.bgMainScreens,
      child: Padding(
        padding: const EdgeInsets.all(SSizes.lg),
        child: Container(
          width: 330,
          height: 268,
          decoration: BoxDecoration(
            color: SColors.bgMainScreens,
            borderRadius: BorderRadius.circular(SSizes.radiusLarge),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: SSizes.md),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/location.svg",
                    height: SSizes.iconMd,
                  ),
                  const SizedBox(
                    width: SSizes.md,
                  ),
                  Text("Distance",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(height: SSizes.lg),
              SliderWithMarks(),
              const FilterTileWidget(
                title: "Salon",
              ),
              const FilterTileWidget(
                title: "Service",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
