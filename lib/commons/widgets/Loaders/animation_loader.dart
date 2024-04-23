import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stylesage/utils/constants/colors.dart';

class TanumationLoaderWidget extends StatelessWidget {
  // text- text to display below the animation
  //animation- the path to the lottie animation file
  //showaction- wheather to show the action button below the text
  //actionText- the text to be displayed on the action button
  //onactionnpressed- for action button action passed

  final String text;
  final String animation;
  final String? actionText;
  final bool showaction;
  final VoidCallback? onActionPressed;

  const TanumationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showaction = false,
      this.actionText,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ), //display lottie amnimation
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          showaction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: SColors.primary),
                      child: Text(
                        actionText!,
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
