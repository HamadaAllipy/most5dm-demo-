import 'package:flutter/material.dart';

class BuildCarousel extends StatelessWidget {

  final String image;
  const BuildCarousel({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
