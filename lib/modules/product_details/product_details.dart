import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/product_details/viewModels/product_cubit.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:most5dm/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home/model/model/products/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;
  final String cityName;

  const ProductDetails(
      {Key? key, required this.productModel, required this.cityName})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool phoneNumberVisible = false;

  int activeIndex = 0;
  final List<String> urlImages = [
    'https://sayartii.com/uploads/cars/17592186318687/24da92c18c83e6372d2ca1fcfe4096acb411208b_med.jpg?sv=2019-07-07&sr=c&sig=DXoFTCrgmZGqpwAR47mnFiEk604NTMlPyuIUQVuqGyw%3D&se=2022-02-07T22%3A17%3A18Z&sp=r',
    'https://www.wmadaat.com/upload/09-2020/article/2019_mercedes-amg_WMADAAT.jpg?sv=2019-07-07&sr=c&sig=DXoFTCrgmZGqpwAR47mnFiEk604NTMlPyuIUQVuqGyw%3D&se=2022-02-07T22%3A17%3A18Z&sp=r',
    'https://www.fonesquare.pk/wp-content/uploads/2021/03/Oppo-A15.jpg?sv=2019-07-07&sr=c&sig=DXoFTCrgmZGqpwAR47mnFiEk604NTMlPyuIUQVuqGyw%3D&se=2022-02-07T22%3A17%3A18Z&sp=r',
    'https://www.fonesquare.pk/wp-content/uploads/2021/03/Oppo-A15.jpg?sv=2019-07-07&sr=c&sig=DXoFTCrgmZGqpwAR47mnFiEk604NTMlPyuIUQVuqGyw%3D&se=2022-02-07T22%3A17%3A18Z&sp=r',
    'https://www.fonesquare.pk/wp-content/uploads/2021/03/Oppo-A15.jpg?sv=2019-07-07&sr=c&sig=DXoFTCrgmZGqpwAR47mnFiEk604NTMlPyuIUQVuqGyw%3D&se=2022-02-07T22%3A17%3A18Z&sp=r',
    'https://www.fonesquare.pk/wp-content/uploads/2021/03/Oppo-A15.jpg?sv=2019-07-07&sr=c&sig=DXoFTCrgmZGqpwAR47mnFiEk604NTMlPyuIUQVuqGyw%3D&se=2022-02-07T22%3A17%3A18Z&sp=r',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit()..getProductDetails(widget.productModel),
      child: CustomStatusBar(
        child: Scaffold(
          body: BackgroundImage(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/most5dm.png',
                          height: context.height * 0.04,
                          width: context.width * 0.086,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Most',
                                style: TextStyle(
                                  color: AppColor.secondColor,
                                  fontSize: context.height * 0.027,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '5',
                                style: TextStyle(
                                  color: AppColor.defaultColor,
                                  fontSize: context.height * 0.027,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'dm',
                                style: TextStyle(
                                  color: AppColor.secondColor,
                                  fontSize: context.height * 0.027,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: context.width * 0.02,
                        ),
                        AutoSizeText(
                          'بيع وشراء كل مستعمل',
                          style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          minFontSize: 18,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 8,
                      start: 16,
                      end: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: widget.productModel.name.toString()+ widget.productModel.id.toString(),
                          child: Container(
                            height: context.height * 0.276,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                buildSliders(),
                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: buildIndicator(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.017,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                widget.productModel.name.toString(),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: AppColor.defaultColorDark,
                                  height: 1.2,
                                    ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'SR ',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: AppColor.defaultColorDark,
                                  ),
                            ),
                            Text(
                              formatPrice(widget.productModel.price as int),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: AppColor.defaultColorDark,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        _buildDetailsProduct(),
                        Text(
                          'التفاصيل',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: AppColor.secondColor,
                                  ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                            start: 8,
                            top: 8,
                            bottom: 4,
                          ),
                          margin: EdgeInsetsDirectional.only(
                            bottom: 7,
                          ),
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Text(
                            widget.productModel.shortDesc.toString(),
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Color(0xFF202020),
                                      height: 1,
                                    ),
                          ),
                        ),
                        Text(
                          'المزيد من التفاصيل',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: AppColor.secondColor,
                                  ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                            start: 8,
                            top: 8,
                            bottom: 4,
                          ),
                          margin: EdgeInsetsDirectional.only(
                            bottom: 7,
                          ),
                          height: 139,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Text(
                            widget.productModel.longDesc.toString(),
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Color(0xFF202020),
                                      height: 1,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: _buildFab(),
        ),
      ),
    );
  }

  Widget buildSliders() {
    return CarouselSlider.builder(
      itemCount: urlImages.length,
      itemBuilder: (context, index, realIndex) {
        final urlImage = urlImages[index];
        return _buildImage(urlImage, index);
      },
      options: CarouselOptions(
          height: context.height * 0.276,
          viewportFraction: 1,
          initialPage: 0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
          }),
    );
  }

  Widget _buildImage(String urlImage, int index) {
    return Image.network(
      urlImage,
      fit: BoxFit.fill,
      width: double.infinity,
      errorBuilder: buildErrorImage,
    );
  }

  Widget buildIndicator() {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 8),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: CustomizableEffect(
          activeDotDecoration: DotDecoration(
            height: 12,
            width: 12,
            color: AppColor.defaultColor,
            borderRadius: BorderRadius.circular(6),
            dotBorder: DotBorder(
              color: AppColor.secondColor,
              width: 1.5,
            ),
          ),
          dotDecoration: DotDecoration(
            height: 12,
            width: 12,
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            dotBorder: DotBorder(
              color: AppColor.secondColor,
              width: 1.5,
            ),
          ),
          // dotHeight: 11,
          // dotWidth: 11,
          // activeDotColor: AppColor.defaultColor,
          // dotColor: Colors.white,
          // paintStyle: PaintingStyle.stroke,
          // strokeWidth: 1.7,
        ),
      ),
    );
  }

  Widget _buildItem(String text) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 8,
        top: 4,
        bottom: 4,
      ),
      margin: EdgeInsetsDirectional.only(
        bottom: 7,
      ),
      height: context.height * 0.036,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text(
        text,
        textScaleFactor: 0.8,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Color(0xFF141414),
              height: 1,
            ),
      ),
    );
  }

  Widget _buildItemData(String text) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 4,
        bottom: 4,
      ),
      margin: EdgeInsetsDirectional.only(
        bottom: 7,
      ),
      height: context.height * 0.036,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text(
        text,
        textScaleFactor: 0.8,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: AppColor.defaultColorDark,
              height: 1,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildItemControl(String text, IconData icon) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 4,
        bottom: 4,
      ),
      margin: EdgeInsetsDirectional.only(
        bottom: context.height * 0.007,
      ),
      height: context.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColor.secondColor,
          ),
          Text(
            text,
            textScaleFactor: 0.8,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: AppColor.secondColor,
                  height: 1,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsProduct() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {

        final cubit = ProductCubit.get(context);
        if(state is ProductDetailsLoadingState){
          return Container(
            height: context.height * 0.21,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: context.width * 0.06,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildItem('انتظر!!!'),
                        Row(
                          children: [
                            Expanded(
                              child: _buildItem('القسم الفرعي'),
                            ),
                            SizedBox(
                              width: context.width * 0.018,
                            ),
                            Expanded(
                              child: _buildItemData('انتظر!!!'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildItem('موديل'),
                            ),
                            SizedBox(
                              width: context.width * 0.018,
                            ),
                            Expanded(
                              child: _buildItemData('انتظر!!!'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildItem('المدينة'),
                            ),
                            SizedBox(
                              width: context.width * 0.018,
                            ),
                            Expanded(
                              child: _buildItemData(widget.cityName),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildItemControl(
                        'مشاركه',
                        Icons.share,
                      ),
                      buildItemControl(
                        'المفضلة',
                        Icons.favorite,
                      ),
                      buildItemControl(
                        'الدردشة',
                        Icons.chat,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          height: context.height * 0.21,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: context.width * 0.06,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildItem(cubit.mainCategoryModel.name as String),
                      Row(
                        children: [
                          Expanded(
                            child: _buildItem('القسم الفرعي'),
                          ),
                          SizedBox(
                            width: context.width * 0.018,
                          ),
                          Expanded(
                            child: _buildItemData('${cubit.categoryModel.name}'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildItem('موديل'),
                          ),
                          SizedBox(
                            width: context.width * 0.018,
                          ),
                          Expanded(
                            child: _buildItemData('${cubit.brandModel.name}'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildItem('المدينة'),
                          ),
                          SizedBox(
                            width: context.width * 0.018,
                          ),
                          Expanded(
                            child: _buildItemData(widget.cityName),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildItemControl(
                      'مشاركه',
                      Icons.share,
                    ),
                    buildItemControl(
                      'المفضلة',
                      Icons.favorite,
                    ),
                    buildItemControl(
                      'الدردشة',
                      Icons.chat,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFab() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Visibility(
              visible: ProductCubit.get(context).isVisible,
              child: Container(
                height: 32,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColor.defaultColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 50),
                    child: Text(
                      '01141403984',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: AppColor.defaultColor,
              child: Icon(Icons.phone),
              onPressed: () {
                ProductCubit.get(context).toggleVisiblePhoneNumber();
              },
            ),
          ],
        );
      },
    );
  }
}
