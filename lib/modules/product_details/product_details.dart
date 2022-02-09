import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  final String tag;

  const ProductDetails({Key? key, required this.tag}) : super(key: key);

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
    return CustomStatusBar(
      child: BackgroundImage(
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
                      tag: widget.tag,
                      child: Container(
                        height: context.height * 0.276,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0,3),
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
                        Text(
                          'سيارة مرسيدس',
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColor.defaultColorDark,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'SR ',
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: AppColor.defaultColorDark,
                          ),
                        ),
                        Text(
                          '4500',
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColor.defaultColorDark,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.017,
                    ),
                    _buildInformationProduct(),
                    Text(
                      'التفاصيل الاخري',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
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
                      height: context.height * 0.095,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0,3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Text(
                        'رش داخلي فقط لايوجد عيوب اخري',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Color(0xFF202020),
                          height: 1,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Visibility(
                          visible: phoneNumberVisible,
                          child: PositionedDirectional(
                            end: 10,
                            bottom: 10,
                            child: Container(
                              height: 32,
                              width: 200,
                              decoration: BoxDecoration(
                                color: AppColor.defaultColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(end: 20),
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              backgroundColor: AppColor.defaultColor,
                              child: Icon(Icons.phone),
                              onPressed: () {
                                setState(() {
                                  phoneNumberVisible = !phoneNumberVisible;
                                });
                              },
                            ),
                          ],
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
  }

  Widget buildSliders(){
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
        enlargeCenterPage:  true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.height ,
        onPageChanged: (index, reason){
          setState(() {
            activeIndex = index;
          });
        }
      ),

    );
  }

  Widget _buildImage(String urlImage, int index){
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
        count: urlImages.length ,
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

  Widget _buildItem(String text){
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
            offset: Offset(0,3),
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

  Widget _buildItemData(String text){
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
            offset: Offset(0,3),
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

  Widget buildItemControl(String text, IconData icon){
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
            offset: Offset(0,3),
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

  Widget _buildInformationProduct(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFirstColumn(),
        SizedBox(
          width: 8,
        ),
        _buildSecondColumn(),
        SizedBox(
          width: 8,
        ),
        _buildThirdColumn(),
      ],
    );
  }

  Widget buildFirstColumn(){
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          _buildItem('المدينة'),
          _buildItem('القسم الرئيسي'),
          _buildItem('القسم الفرعي'),
          _buildItem('البراند'),
          _buildItem('رقم الاعلان'),
          _buildItem('اسم المعلن'),
        ],
      ),
    );
  }

  Widget _buildSecondColumn(){
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          _buildItemData('جدة'),
          _buildItemData('سيارات وقطع غيار'),
          _buildItemData('سيارات'),
          _buildItemData('مرسيدس'),
          _buildItemData('0024323'),
          _buildItemData('hamada'),
        ],
      ),
    );
  }

  Widget _buildThirdColumn(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
          children: [
            buildItemControl('مشاركه', Icons.share,),
            buildItemControl('المفضلة', Icons.favorite,),
            buildItemControl('الدردشة', Icons.chat,),
          ],
        ),
      ),
    );
  }
}
