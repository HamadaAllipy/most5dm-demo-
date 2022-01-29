import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';

class ControllerHome extends StatelessWidget {
  const ControllerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: context.height * 0.04,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.tune,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'خيارات البحث',
                      style: TextStyle(
                        fontSize: context.width * 0.028,
                        color: const Color(0xFF2A2A2A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: context.height * 0.04,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.repeat,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'رتب',
                    style: TextStyle(
                      fontSize: context.width * 0.028,
                      color: const Color(0xFF2A2A2A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              AppCubit.get(context).toggleViewProduct();
            },
            child: SizedBox(
              height: context.height * 0.04,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'طريقه العرض',
                      style: TextStyle(
                        fontSize: context.width * 0.028,
                        color: const Color(0xFF2A2A2A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
