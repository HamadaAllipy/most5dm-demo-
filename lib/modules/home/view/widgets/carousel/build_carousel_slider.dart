import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/modules/home/view/widgets/carousel/build_carousel.dart';

class BuildCarouselSlider extends StatelessWidget {
  const BuildCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      width: double.infinity,
      child: CarouselSlider(
        items: const [
          BuildCarousel(
            image:'https://image.freepik.com/free-photo/hand-using-gadgets-laptop-yellow-background-top-view-blank-screen-with-copyspace-minimalistic-style_155003-39793.jpg',),
          BuildCarousel(
            image: 'https://images.unsplash.com/photo-1562577309-4932fdd64cd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',),
          BuildCarousel(
            image: 'https://images.unsplash.com/photo-1537731121640-bc1c4aba9b80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',),
        ],
        options: CarouselOptions(
          aspectRatio: 10 / 4,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration:
          const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          disableCenter: true,
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
