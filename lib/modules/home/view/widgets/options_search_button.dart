import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:most5dm/components/components.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/home/model/model/brand/brand_model.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/model/service/products/products_services.dart';

class OptionsSearchButton extends StatelessWidget {
  const OptionsSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return InkWell(
          onTap: appCubit.enableSearchOptionButton?() async {
            int idMainCategory = appCubit.getMainCategories[appCubit.indexOfRowMainCategory as int].id as int;
            List<CategoryModel> categories = await appCubit
                .selectCategoryByIdMainCategory(idMainCategory);
            showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.black.withOpacity(0.7),
                builder: (context) {
                  return _buildCategoriesDialog(context, categories, appCubit);
                });
          }: (){
            showToast('يجب تحديد القسم اولا ',duration: Toast.LENGTH_SHORT);
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
        );
      },
    );
  }

  Widget _buildCategoriesDialog(BuildContext context, List<CategoryModel> categories , AppCubit appCubit) {
    List<BrandModel>? _brands;
    return Dialog(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: context.width * 0.775,
            height: context.height * 0.559,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.06
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MaterialButton(
                        onPressed: () async{
                          _brands = await appCubit.selectBrandByIdCategory( categories[index].id as int);
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return _buildBrandsDialog(
                                context: context,
                                brands: _brands!,
                                titleOfBrand: categories[index].name.toString(),
                                appCubit: appCubit,
                              );
                            },
                          );
                        },
                        minWidth: double.infinity,
                        height: context.height * 0.06,
                        color: AppColor.secondColor,
                        child: Text(
                          categories[index].name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                  itemCount: categories.length,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandsDialog({
    required BuildContext context,
    required List<BrandModel>? brands,
    required String titleOfBrand,
    required AppCubit appCubit
}){
    return Dialog(

      child: SizedBox(
        height: context.height * 0.559,
        width: context.width * 0.775,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: AppColor.secondColor,
                  width: double.infinity,
                  height: 56,
                  child:  Center(
                    child: Text(
                      titleOfBrand,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: brands!.length,
                itemBuilder: (context, index) {
                  return _buildItemBrand(brands[index] ,appCubit, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildItemBrand(BrandModel brandModel, AppCubit appCubit, BuildContext context) {
    return ListTile(
      onTap: () async{
        appCubit.getProductsAfterFilter(brandModel.id as int);
        Navigator.pop(context);
        },
      title: Text(
        brandModel.name.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
        ),
      ),
    );
  }
}
