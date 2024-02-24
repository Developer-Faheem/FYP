import 'package:flutter/material.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';

class BannerPoster extends StatelessWidget {
  const BannerPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Stack(children: [
        Container(
          height: 128,
          width: 258,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              image: AssetImage(SImages.banner_1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 128,
          width: 258,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                colors: [
                  SColors.primary.withOpacity(0.7),
                  Colors.white.withOpacity(0.2),
                ],
                stops: [
                  0.4, // Start at the beginning
                  1.0, // End at the end
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: RatingsWidget(rating: "Limited Offer", height: 22, width: 103),
        ),
      ]),
    );
  }
}
