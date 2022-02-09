import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/model/service/city/city_services.dart';
import 'package:most5dm/modules/product_details/product_details.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:most5dm/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class GridViewProducts extends StatefulWidget {
  const GridViewProducts({Key? key}) : super(key: key);

  @override
  State<GridViewProducts> createState() => _GridViewProductsState();
}

class _GridViewProductsState extends State<GridViewProducts> {

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: context.height * 0.017,
      crossAxisSpacing: context.width * 0.037,
      childAspectRatio: 0.75,
      physics: const NeverScrollableScrollPhysics(),
      children: appCubit.productsHome
          .asMap()
          .map(
            (index, product) {
              return MapEntry(
                index,
                _buildItemProduct(index, product),
              );
            },
          )
          .values
          .toList(),
    );
  }

  Widget _buildItemProduct(int index, ProductModel product){
    return Hero(
      tag: product.name.toString(),
      child: Scaffold(
        body: InkWell(
          onTap: (){
            navigateToOutSideBottomNav(context: context, widget: ProductDetails(tag: product.name.toString()));
          },
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.image.toString().contains('string?sv')?
                  'https://www.pizzahut.ae/assets/imgs/default/default.png':
                  product.image.toString(),
                  width: double.infinity,
                  height: context.height * 0.138,
                  fit: BoxFit.fill,
                  errorBuilder: buildErrorImage,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.defaultColor,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          fontSize: context.height * 0.02,
                        ),
                      ),
                      Text(
                        product.shortDesc.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          fontSize: context.height * 0.02,
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
                            AppCubit.get(context).cities[index].name.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              fontSize: context.height * 0.02,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              'SR',
                              style: TextStyle(
                                fontSize: context.height * 0.02,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
