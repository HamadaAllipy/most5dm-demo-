import 'package:flutter/material.dart';
import 'package:most5dm/components/read_json.dart';
import 'package:most5dm/modules/categories/views/screens/cars_screens/cars_screen.dart';
import 'package:most5dm/shared/model/categories_model.dart';

class AllCategoriesViewModel {
  CategoriesModel categoriesModelScreen = categoriesModel!;
  List<Widget> nextScreen = [
    const CarsScreen(),
    Container(),
    Container(),
    Container(),
    const CarsScreen(),
    Container(),
    Container(),
    Container(),
    const CarsScreen(),
    Container(),
    Container(),
    Container(),
    const CarsScreen(),
    Container(),
    Container(),
    Container(),
    const CarsScreen(),
    Container(),
    Container(),
    Container(),
  ];
}
