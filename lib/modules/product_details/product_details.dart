import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {

  final String tag;
  const ProductDetails({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: tag,
        child: Container(
          height: 300,
          width: double.infinity,
          color: Colors.red,
        ),
      ),
    );
  }
}
