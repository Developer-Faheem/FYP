import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/cards/saloon_card.dart';
import 'package:stylesage/commons/widgets/ratings_widget.dart';
import 'package:stylesage/commons/widgets/services_rounded.dart';
import 'package:stylesage/features/Shop/controllers/home_controller.dart';
import 'package:stylesage/features/Shop/screens/Home/services_screen.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.bgMainScreens,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: SSizes.md,
              bottom: SSizes.md,
              left: SSizes.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                Padding(
                  padding: const EdgeInsets.only(right: SSizes.lg),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        height: 20,
                      ),
                      const SizedBox(
                        width: SSizes.defaultSpaceLarge,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "Islamabad, Pakistan",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/bell.svg',
                        height: 30.5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: SSizes.defaultSpaceLarge,
                ),

                //search bar
                Padding(
                  padding: const EdgeInsets.only(right: SSizes.lg),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: SDeviceUtils.getScreenWidth() * 0.77,
                        height: 33,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search service",
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            prefixIcon: const Icon(Icons.search, size: 20),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFA9A7A7)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFA9A7A7)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8.0), // Adjust the value based on your preference
                          ),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/filter.svg',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                //Carousel slider
                Text(
                  "#SpecialForYou",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Carousel(),
                SizedBox(
                  height: SSizes.sm,
                ),
                //services
                Padding(
                  padding: const EdgeInsets.only(right: SSizes.lg),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Services",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => ServicesScreen());
                        },
                        child: Text(
                          "See All",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SSizes.sm,
                ),
                Container(
                  height: 100,
                  // color: Colors.blue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: ServicesRoundedWidget(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                //salons
                Padding(
                  padding: const EdgeInsets.only(right: SSizes.lg),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Salons",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            "See All",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SSizes.sm,
                      ),
                      SaloonCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          items: const [
            Banner(),
            Banner(),
            Banner(),
          ],
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

class Banner extends StatelessWidget {
  const Banner({
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
