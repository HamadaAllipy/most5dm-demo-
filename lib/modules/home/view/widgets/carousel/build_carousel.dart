import 'package:flutter/material.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class BuildCarousel extends StatelessWidget {

  final String image;
  const BuildCarousel({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builds();
  }


  Widget builds(){
    return Image.network(
      image,
      fit: BoxFit.cover,
      errorBuilder: buildErrorImage,
    );
  }
}
