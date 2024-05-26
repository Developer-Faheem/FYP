import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/screens/SaloonProfile/widget/tabbar.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class MainContent extends StatelessWidget {
  final VendorModel? vendor;
  const MainContent({
    this.vendor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Container(
        decoration: const BoxDecoration(
          color: SColors.bgMainScreens,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SSizes.radiusLarge),
            topRight: Radius.circular(SSizes.radiusLarge),
          ),
        ),
        child: Column(
          children: [
            //content other than the tab bar
            Padding(
              padding: const EdgeInsets.only(
                  top: SSizes.lg,
                  left: SSizes.lg,
                  right: SSizes.lg,
                  bottom: SSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //salon name
                  Text(
                    //"Enclave Haven",
                    vendor?.salonName ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  //salon tagline
                  Text(
                    vendor?.tagline ?? '',
                    // "Haircuts, Makeup , Manicure ,Hydra facial",
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(
                    color: SColors.dividersColor,
                  ),
                  //salon address & time and date details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location.svg',
                                height: SSizes.iconXS,
                              ),
                              const SizedBox(
                                width: SSizes.defaultSpacemedium,
                              ),
                              Text(
                                vendor?.address ?? '',
                                // "0539 NYC, Street #98 ",
                                style: Theme.of(context).textTheme.labelSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SSizes.defaultSpaceSmall,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/clock.svg',
                                height: SSizes.iconXS,
                              ),
                              const SizedBox(
                                width: SSizes.defaultSpacemedium,
                              ),
                              Text(
                                " Mon - Sun   |  9am - 11pm",
                                style: Theme.of(context).textTheme.labelSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      //open button
                      Container(
                        height: 24,
                        width: 50,
                        decoration: BoxDecoration(
                          color: SColors.bgMainScreens,
                          borderRadius:
                              BorderRadius.circular(SSizes.radiusLarge),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Open",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomOutlinedButton(
                          buttonText: "Follow +",
                          height: 40,
                          width: 0.32,
                          gradient: SColors.smallOutlinedButtonGradient,
                          textStyle: Theme.of(context).textTheme.bodyLarge!,
                          onPressedCallback: () {}),
                      CustomOutlinedButton(
                        buttonText: "Get Directions",
                        height: 40,
                        width: 0.32,
                        gradient: SColors.smallOutlinedButtonGradient,
                        textStyle: Theme.of(context).textTheme.bodyLarge!,
                        onPressedCallback: () async {
                          Uri uri = Uri.parse(vendor?.mapLocation ?? '');
                          await SDeviceUtils.launch(uri);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            //Tab bar now
            Tabbar(vendor: vendor)
          ],
        ),
      ),
    );
  }
}
