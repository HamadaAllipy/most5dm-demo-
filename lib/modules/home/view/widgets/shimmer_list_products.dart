import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListProducts extends StatelessWidget {
  const ShimmerListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
            bottom: context.height * 0.008,
          ),
          child: Container(
            height: context.height * 0.12,
            clipBehavior: Clip.antiAlias,
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
            child: Row(
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: context.width * 0.018,
                      end: context.width * 0.037,
                      top: context.height * 0.0056,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[300]!,
                          child: Container(
                            height: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[400]!,
                                highlightColor: Colors.grey[300]!,
                                child: Container(
                                  height: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[400]!,
                                highlightColor: Colors.grey[300]!,
                                child: Container(
                                  height: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
