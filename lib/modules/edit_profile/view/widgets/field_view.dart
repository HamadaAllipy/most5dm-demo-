import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';

class FieldView extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool obscure;

  const FieldView({
    Key? key,
    required this.icon,
    required this.text,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.060,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Icon(
            icon,
            color: AppColor.secondColor,
            size: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: !obscure?
            Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF434343),
                fontSize: context.height * 0.0237,
              ),
            ):
            Center(
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index) {
                  return Container(
                    height: context.height * 0.08,
                    width: context.width * 0.025,
                    decoration: const BoxDecoration(
                      color: Color(0xFF434343),
                      shape: BoxShape.circle,
                    ),
                  );
                },
                separatorBuilder: (_, index){
                  return  SizedBox(
                    width: context.width * 0.0093,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
