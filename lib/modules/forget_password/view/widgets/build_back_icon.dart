import 'package:flutter/material.dart';

class BuildBackIcon extends StatelessWidget {

  const BuildBackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).pop(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Text(
            'رجوع',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            width: 3,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF707070),
            size: 16,
          ),
        ],
      ),
    );
  }
}
