import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class GridItemWidget extends StatelessWidget {
  final String icon;
  final String figure;
  final String text2;

  const GridItemWidget(
      {required this.icon, required this.figure, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: SColors.primary),
        borderRadius: BorderRadius.circular(SSizes.radiusSmall),
      ),
      padding: const EdgeInsets.all(SSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(figure,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w900)),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: SColors.secondary.withOpacity(0.24),
                  shape: BoxShape.circle,
                ),
                child: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    icon,
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(text2, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
