import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAdsPanel extends StatelessWidget {
  const ShimmerAdsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        color: Colors.red,
        height: 200,
      ),
    );
  }
}
