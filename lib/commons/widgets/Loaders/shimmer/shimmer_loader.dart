import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class SShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;

  const SShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 16,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? Colors.grey,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100);
  }
}
