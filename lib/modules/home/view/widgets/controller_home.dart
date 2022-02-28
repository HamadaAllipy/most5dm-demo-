import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/service/brand/brand_service.dart';
import 'package:most5dm/modules/home/model/service/category/category_services.dart';
import 'package:most5dm/modules/home/view/widgets/options_search_button.dart';

class ControllerHome extends StatefulWidget {
  const ControllerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<ControllerHome> createState() => _ControllerHomeState();
}

class _ControllerHomeState extends State<ControllerHome> {



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: OptionsSearchButton(),
        ),
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
