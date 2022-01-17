import 'package:flutter/material.dart';
import 'package:most5dm/components/read_json.dart';
import 'package:most5dm/modules/categories/viewModels/all_categories_view_model.dart';
import 'package:most5dm/modules/categories/views/widgets/default_category_screen.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  AllCategoriesViewModel viewModel = AllCategoriesViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultCategoryScreen(
      model: viewModel.categoriesModelScreen,
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
