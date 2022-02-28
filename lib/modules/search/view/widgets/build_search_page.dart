import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_list_products.dart';
import 'package:most5dm/modules/product_details/product_details.dart';
import 'package:most5dm/modules/search/viewModel/search_cubit.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:most5dm/utils/utils.dart';

class BuildSearchPage extends StatelessWidget {
  const BuildSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        SearchCubit searchCubit = SearchCubit.get(context);
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 20,
            end: 20,
            start: 20,
          ),
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (searchCubit.showSuggestions) _buildSuggestionsSearch(context),
                if (state is SearchLoadingState) ShimmerListProducts(itemCount: 20,),
                if (state is SearchSuccessState)
                  state.searchProducts.isNotEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.searchProducts.length,
                    padding: EdgeInsetsDirectional.only(top: 20),
                    itemBuilder: (context, index) {
                      return _buildItemProduct(
                          state.searchProducts[index],
                          searchCubit.cities[index], context);
                    },
                  )
                      : _buildEmptyResult(context),
              ],
            ),
          ),
        );
      },
    );
  }



  Widget _buildSuggestionsSearch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مقترحة',
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 100,
          child: GridView.builder(
            itemCount: 8,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2.8,
              crossAxisSpacing: 5,
              mainAxisSpacing: 21,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 96,
                decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'سيارات',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItemProduct(ProductModel product, CityModel city, BuildContext context) {
    return Hero(
      tag: product.name.toString(),
      child: InkWell(
        onTap: (){
          navigateToOutSideBottomNav(context: context, widget: ProductDetails(productModel: product,cityName: city.name.toString(),));
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            bottom: context.height * 0.008,
          ),
          child: Container(
            height: context.height * 0.14,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Image.network(
                      product.image.toString().contains('string?sv')
                          ? 'https://www.pizzahut.ae/assets/imgs/default/default.png'
                          : product.image.toString(),
                      fit: BoxFit.fill,
                      height: double.infinity,
                      errorBuilder: (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                          ) {
                        DebugPrint('${context.widget}\n $error \n $stackTrace');
                        return Container(
                          width: double.infinity,
                          height: context.height * 0.138,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/error_image.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: context.width * 0.018,
                      end: context.width * 0.037,
                      top: context.height * 0.0056,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name.toString(),
                          maxLines: 1,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: AppColor.defaultColor,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          product.shortDesc.toString(),
                          maxLines: 1,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.016,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              city.name.toString(),
                              style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                'SR',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.defaultColorDark,
                                ),
                              ),
                            ),
                            Text(
                              formatPrice(product.price as int),
                              style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: AppColor.defaultColorDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyResult(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height / 3,
        ),
        Text(
            'لا توجد نتائج بحث',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: AppColor.blackLight,
            )
        ),
      ],
    );
  }
}
