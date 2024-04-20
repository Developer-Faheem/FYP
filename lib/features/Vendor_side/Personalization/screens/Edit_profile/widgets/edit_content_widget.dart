import 'package:flutter/material.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/Edit_profile/widgets/textfield.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class EditContent extends StatelessWidget {
  const EditContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SColors.bgMainScreens,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.radiusLarge),
          topRight: Radius.circular(SSizes.radiusLarge),
        ),
      ),
      child: SingleChildScrollView(
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
                  const CustomTextField1(
                    hintText: "Salon Name",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "User Name(Private info)",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "example@gmail.com",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "Jazzcash no",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "Easypaisa no",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "Salon tagline",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "Phone no",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  const CustomTextField1(
                    hintText: "City",
                  ),
                  const SizedBox(
                    height: SSizes.md,
                  ),
                  TextField(
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText:
                          'This is about section for your salon\n write short description about your saloon \n Enter salon opening timings with days',
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: SColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SSizes.lg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
