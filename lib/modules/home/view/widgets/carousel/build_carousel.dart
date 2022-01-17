import 'package:flutter/material.dart';

class BuildCarousel extends StatelessWidget {

  final String image;
  const BuildCarousel({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
