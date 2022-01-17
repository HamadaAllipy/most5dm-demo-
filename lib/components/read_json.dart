// Fetch content from the json file
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:most5dm/shared/model/categories_model.dart';

CategoriesModel? categoriesModel;
Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/categories.json');
  final categoriesJsonFile = await json.decode(response);
  categoriesModel = CategoriesModel.fromJson(categoriesJsonFile);
}