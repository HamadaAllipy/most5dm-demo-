import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/modules/product_details/product_details.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({Key? key}) : super(key: key);

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
      children: appCubit.productsHome.map((product) {
        return Hero(
          tag: product.name.toString(),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ProductDetails(tag: product.name.toString(),);
              }));
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
                    'https://www.pizzahut.ae/assets/imgs/default/default.png':product.image.toString(),
                    width: double.infinity,
                    height: context.height * 0.138,
                    fit: BoxFit.cover,
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return SizedBox(
                        width: double.infinity,
                        height: context.height * 0.138,
                      );
                    },
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
                              product.location.toString(),
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
                              product.price.toString(),
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
        );
      }).toList(),
    );
  }

}
