import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicator extends StatelessWidget {
  final PageController pageController;
  final int count;

  const DotsIndicator({
    Key? key,
    required this.pageController,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: ScrollingDotsEffect(
        activeStrokeWidth: 10,
        strokeWidth: 10,
        dotWidth: 10,
        dotHeight: 10,
        dotColor: const Color(0xFFDCDADA),
        activeDotColor: AppColor.secondColor,
      ),
      controller: pageController,
      count: count,
    );
  }
}
