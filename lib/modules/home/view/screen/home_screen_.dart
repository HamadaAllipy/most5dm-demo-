import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/modules/home/model/model/categories_model.dart';
import 'package:most5dm/modules/home/model/model/product_model.dart';
import 'package:most5dm/modules/home/model/service/home_service.dart';
import 'package:most5dm/modules/home/view/widgets/carousel/build_carousel_slider.dart';
import 'package:most5dm/modules/home/view/widgets/controller_home.dart';
import 'package:most5dm/modules/home/view/widgets/grid_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/list_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/row_categories_home.dart';
import 'package:most5dm/modules/home/view/widgets/search_home.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_list_products.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_panel.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_product.dart';
import 'package:most5dm/modules/home/viewModel/home_cuibt.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen_ extends StatefulWidget {
  const HomeScreen_({Key? key}) : super(key: key);

  @override
  State<HomeScreen_> createState() => _HomeScreen_State();
}

class _HomeScreen_State extends State<HomeScreen_> {

  final List<ProductModel> products = [
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
    ProductModel(),
  ];

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
                  return const ShimmerPanel();
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
                  BlocBuilder<AppCubit, AppStates>(
                    builder: (context, state) {
                      AppCubit appCubit = AppCubit.get(context);
                      if(state is GetHomeDataLoadingState){
                        return !appCubit.isListView? const ShimmerProduct(): const ShimmerListProducts();
                      }
                      else if(state is GetHomeDataErrorState){
                        // error widget
                      }
                      return !appCubit.isListView
                          ? const GridViewProducts()
                          : const ListViewProducts();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
