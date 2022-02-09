import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class RowCategoriesHome extends StatefulWidget {
  const RowCategoriesHome({Key? key}) : super(key: key);

  @override
  State<RowCategoriesHome> createState() => _RowCategoriesHomeState();
}
class _RowCategoriesHomeState extends State<RowCategoriesHome> {

  List<MainCategoryModel> mainCategories = [];

  bool selectAll = true;
  bool selectCategory = false;
  Set active = {true};
  void _handleTap(index , String single) {
    var list = active.toList();
    if(list[0] != index){
      active.contains(index) ? active.remove(index): active = {index, single};
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state){
        AppCubit appCubit = AppCubit.get(context);
        if(state is GetHomeDataLoadingState){
          return _buildRowMainCategoriesShimmer();
        }
        mainCategories = appCubit.getMainCategories;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  appCubit.actionButtonAll();
                  handlingToggleAllButton();
                },
                child: SizedBox(
                  height: context.height * 0.0518,
                  width: context.width * 0.142,
                  child: active.contains(true)?
                  Card(
                    elevation: 5,
                    color: AppColor.defaultColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'الكل',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ):
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'الكل',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.0518,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        /// when click this button from row
                        /// main categories []
                        /// its will send id to getCategory
                        /// by id main category, and enable button
                        /// [options search] exists the second row buttons
                        /// result displays category in dialog
                        ///
                        appCubit.enableSearchOptionButtons(index);
                        appCubit.getProductsAfterSelectMainCategory(mainCategories[index].id as int);
                        handlingToggleItemButton(index);
                      },
                      child: _buildItemMainCategory(mainCategories[index], index)
                    );
                  },
                  shrinkWrap: true,
                  itemCount: mainCategories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemMainCategory(MainCategoryModel category, int index){
    return SizedBox(
      width: context.width * 0.2056,
      child: Card(
        elevation: 5,
        color: active.contains(index)? AppColor.defaultColor: null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              category.iconUri.toString(),
              width: context.width * 0.128,
              height: context.height * 0.02,
              color: active.contains(index)? Colors.white: null,
                errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                    ) {
                  DebugPrint('${context.widget}\n $error \n $stackTrace');
                  return Container(
                    width: context.width * 0.128,
                    height: context.height * 0.02,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/error_image.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
            ),
            Text(
              category.name.toString(),
              style: TextStyle(
                fontSize: context.height * 0.0099,
                color: active.contains(index)? Colors.white: null,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  void handlingToggleAllButton(){
    setState(() {
      if(active.contains('single')){
        if(selectAll){
          active = {true};
        }
        else{
          selectAll = !selectAll;
          active = {true};
        }
      }
      else{
        if(active.contains(true)){

        }
        else{
          selectAll = !selectAll;
          active = {selectAll};
        }

      }
    });
  }

  void handlingToggleItemButton(index){
    setState(() {
      // categories[index].isSelected = !categories[index].isSelected;
      _handleTap(index,'single');
    });
  }

  Widget _buildRowMainCategoriesShimmer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              height: context.height * 0.0518,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

}
