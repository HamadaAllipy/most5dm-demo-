import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppCubit appCubit = AppCubit.get(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appCubit.productsHome.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {

        return Padding(
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
                  child: Image.network(
                    appCubit.productsHome[index].image.toString().contains('string?sv')?
                    'https://www.pizzahut.ae/assets/imgs/default/default.png':appCubit.productsHome[index].image.toString(),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, dsf){
                      return Image.network(
                        'https://www.pizzahut.ae/assets/imgs/default/default.png',
                        fit: BoxFit.cover,
                      );
                    },
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
                          appCubit.productsHome[index].name.toString(),
                          maxLines: 1,
                          style:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: AppColor.defaultColor,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          appCubit.productsHome[index].shortDesc.toString(),
                          maxLines: 1,
                          style:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
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
                              appCubit.productsHome[index].location.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 2),
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
                              appCubit.productsHome[index].price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
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
        );
      },
    );
  }
}
