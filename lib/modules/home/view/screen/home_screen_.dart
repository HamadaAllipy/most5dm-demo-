import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/home/view/widgets/carousel/build_carousel_slider.dart';
import 'package:most5dm/modules/home/view/widgets/controller_home.dart';
import 'package:most5dm/modules/home/view/widgets/grid_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/list_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/row_categories_home.dart';
import 'package:most5dm/modules/home/view/widgets/search_home.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_list_products.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_panel.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.height * 0.008,
            ),
            BlocBuilder<AppCubit, AppStates>(
              builder: (_, state){
                if(state is GetHomeDataLoadingState){
                  return const ShimmerAdsPanel();
                }
                return const BuildCarouselSlider();
              },
            ),
            SizedBox(
              height: context.height * 0.008,
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: context.width * 0.037),
              child: Column(
                children: [
                  const SearchHome(),
                  SizedBox(
                    height: context.height * 0.008,
                  ),
                  const RowCategoriesHome(),
                  SizedBox(
                    height: context.height * 0.008,
                  ),
                  const ControllerHome(),
                  SizedBox(
                    height: context.height * 0.008,
                  ),
                  _buildDisplayProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplayProducts(){
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        if(state is GetHomeDataLoadingState){
          return !appCubit.isListView? const ShimmerGridViewProducts(): const ShimmerListProducts();
        }
        else if(state is GetHomeDataErrorState){
          // error widget
        }
        else if(state is GetHomeDataSuccessState){
          return !appCubit.isListView
              ? const GridViewProducts()
              : const ListViewProducts();
        }
        return !appCubit.isListView
            ? const GridViewProducts()
            : const ListViewProducts();
      },
    );
  }
}
