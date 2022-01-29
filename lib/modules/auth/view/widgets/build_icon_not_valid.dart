import 'package:flutter/material.dart';

class BuildIconNotValid extends StatelessWidget {
  const BuildIconNotValid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 19,
          height: 19,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Icon(
            Icons.clear,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
