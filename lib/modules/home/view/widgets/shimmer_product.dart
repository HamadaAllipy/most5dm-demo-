import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProduct extends StatefulWidget {
  const ShimmerProduct({Key? key}) : super(key: key);

  @override
  State<ShimmerProduct> createState() => _ShimmerProductState();
}

class _ShimmerProductState extends State<ShimmerProduct> {


  final List products = [
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: context.height * 0.017,
      crossAxisSpacing: context.width * 0.037,
      childAspectRatio: 0.8,
      physics: const NeverScrollableScrollPhysics(),
      children: products.map((e) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[300]!,
                enabled: true,
                child: Container(
                  width: double.infinity,
                  height: context.height * 0.138,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        height: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        height: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
