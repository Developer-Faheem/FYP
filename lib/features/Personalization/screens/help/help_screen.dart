import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Personalization/screens/help/widgets/StyleSage_socials.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                Padding(
                  padding: const EdgeInsets.all(SSizes.lg),
                  child: Column(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors
                              .transparent, // Set divider color to transparent
                        ),
                        child: ExpansionTile(
                          title: Text(
                            STextStrings.faq1,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: Icon(Icons.arrow_drop_down_circle),
                          children: [
                            Text(
                              STextStrings.ans1,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                      ExpansionTile(
                        title: Text(
                          STextStrings.faq1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Icon(Icons.arrow_drop_down_circle),
                        children: [
                          Text(
                            STextStrings.ans1,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      )
                    ],
                  ),
                ),

                // contact Us Tab
                Padding(
                  padding: const EdgeInsets.all(SSizes.lg),
                  child: Column(
                    children: [
                      StyleSageSocials(
                        onPressedCallback: () {},
                        leading: "assets/icons/profile/facebook.svg",
                        title: "Facebook",
                      ),
                      StyleSageSocials(
                        onPressedCallback: () {},
                        leading: "assets/icons/profile/instagram.svg",
                        title: "Instagram",
                      ),
                      StyleSageSocials(
                        onPressedCallback: () {},
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
