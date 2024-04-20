import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/User_side/Personalization/screens/help/widgets/Faq_widget.dart';
import 'package:stylesage/features/User_side/Personalization/screens/help/widgets/StyleSage_socials.dart';
import 'package:stylesage/utils/constants/api_constants.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Help",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.only(left: SSizes.lg),
                  child: SvgPicture.asset(
                    "assets/icons/back_filled.svg",
                  ),
                ),
              ),
              bottom: TabBar(
                dividerColor: SColors.dividersColor,
                indicatorColor: SColors.tertiary,
                tabs: [
                  Tab(
                    child: Text(
                      "    FAQ     ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      " Contact Us ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                //FAQ Tab
                const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(SSizes.lg),
                    child: Column(
                      children: [
                        FaqWidget(
                          question: STextStrings.faq1,
                          answer: STextStrings.ans1,
                        ),
                        FaqWidget(
                          question: STextStrings.faq2,
                          answer: STextStrings.ans2,
                        ),
                        FaqWidget(
                          question: STextStrings.faq3,
                          answer: STextStrings.ans3,
                        ),
                        FaqWidget(
                          question: STextStrings.faq1,
                          answer: STextStrings.ans1,
                        ),
                        FaqWidget(
                          question: STextStrings.faq2,
                          answer: STextStrings.ans2,
                        ),
                        FaqWidget(
                          question: STextStrings.faq3,
                          answer: STextStrings.ans3,
                        ),
                      ],
                    ),
                  ),
                ),

                // contact Us Tab
                Padding(
                  padding: const EdgeInsets.all(SSizes.lg),
                  child: Column(
                    children: [
                      StyleSageSocials(
                        onPressedCallback: () async {
                          Uri uri = Uri.parse(SAPIConstants.facebook);
                          await SDeviceUtils.launch(uri);
                        },
                        leading: "assets/icons/profile/facebook.svg",
                        title: "Facebook",
                      ),
                      StyleSageSocials(
                        onPressedCallback: () async {
                          Uri uri = Uri.parse(SAPIConstants.instagram);
                          await SDeviceUtils.launch(uri);
                        },
                        leading: "assets/icons/profile/instagram.svg",
                        title: "Instagram",
                      ),
                      StyleSageSocials(
                        onPressedCallback: () async {
                          Uri uri = Uri.parse(SAPIConstants.linkedin);
                          await SDeviceUtils.launch(uri);
                        },
                        leading: "assets/icons/profile/linkedin.svg",
                        title: "Linkedin",
                      ),
                      StyleSageSocials(
                        onPressedCallback: () {},
                        leading: "assets/icons/profile/twitter.svg",
                        title: "Twitter",
                      )
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
