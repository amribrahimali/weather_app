import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
    this.radius = 8,
  }) : super(key: key);

  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200] ?? Colors.grey,
      highlightColor: Colors.grey[50] ?? Colors.white,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(16 / 2),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.all(Radius.circular(radius!))),
      ),
    );
  }
}
