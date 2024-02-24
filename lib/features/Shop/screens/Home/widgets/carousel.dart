import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Shop/controllers/home_controller.dart';
import 'package:stylesage/features/Shop/screens/Home/widgets/banner.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: const [BannerPoster(), BannerPoster(), BannerPoster()],
          options: CarouselOptions(
            //  autoPlay: true,
            viewportFraction: 0.74,
            height: 128,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: controller.CarouselCurrentIndex.value == i
                          ? SColors.secondary
                          : Color(0XFFA9A7A7),
                      shape: BoxShape.circle,
                    ),
                    margin: EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
