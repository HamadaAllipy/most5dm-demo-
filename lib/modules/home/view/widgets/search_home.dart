import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.056,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: context.width * 0.04,
            ),
            const Icon(
              CupertinoIcons.search,
            ),
            SizedBox(
              width: context.width * 0.037,
            ),
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                  height: 1,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ابحث عن المنتج',
                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    height: 1,
                    color: AppColor.secondColor.withOpacity(0.68),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
