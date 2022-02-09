import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/layout/app_cubit.dart';
import 'package:most5dm/layout/app_states.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/home/model/model/category/category_model.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/main_category/main_category_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/view/widgets/list_view_products.dart';
import 'package:most5dm/modules/home/view/widgets/shimmer_list_products.dart';
import 'package:most5dm/modules/search/viewModel/search_cubit.dart';
import 'package:most5dm/utils/utils.dart';

class SearchScreen extends StatefulWidget {
  final AppCubit appCubit;

  const SearchScreen({Key? key, required this.appCubit}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: CustomStatusBar(
        child: BackgroundImage(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(
                  bottom: 10,
                ),
                child: CustomAppBar(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/most5dm.png',
                        height: 50,
                        width: 50,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Most',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: AppColor.secondColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            TextSpan(
                              text: '5',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: AppColor.defaultColor,
                              fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                            ),
                            ),
                            TextSpan(
                              text: 'dm',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: AppColor.secondColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          print('hamada');
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColor.secondColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildSearchField(context),
                      SizedBox(
                        height: 10,
                      ),
                      TabBar(
                        controller: _tabController,
                        padding: EdgeInsets.zero,
                        labelColor: Color(0xFF141414),
                        indicatorColor: AppColor.secondColor,
                        tabs: [
                          Tab(
                            text: 'البحث',
                          ),
                          Tab(
                            text: 'الاقسام',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildSearchPage(context),
                    _buildCategoriesPage(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
      height: context.height * 0.056,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: context.width * 0.04,
            ),
            const Icon(
              CupertinoIcons.search,
            ),
            SizedBox(
              width: context.width * 0.037,
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchStates>(
                builder: (context, state) {
                  return TextFormField(
                    controller: _searchController,
                    onTap: () {
                      if (_tabController!.index == 1) {
                        setState(() {
                          _tabController!.index = 0;
                        });
                      }
                    },
                    onFieldSubmitted: (value) {
                      if(value.trim().isNotEmpty){
                        SearchCubit.get(context).searchProducts(text: value);
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      height: 1,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'ابحث عن المنتج',
                      hintStyle:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
                                height: 1,
                                color: AppColor.secondColor.withOpacity(0.68),
                              ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchPage(BuildContext context) {
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
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return _buildItemProduct(
                              state.searchProducts[index],
                              searchCubit.cities[index]);
                        },
                      )
                      : _buildEmptyResult(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoriesPage(BuildContext context) {
    List<MainCategoryModel> mainCategories = widget.appCubit.getMainCategories;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.074),
      child: GridView.builder(
        itemCount: mainCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: context.width * 0.074,
          mainAxisSpacing: context.height * 0.034,
          childAspectRatio: 3 / 3,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColor.secondColor,
                  )),
              child: Center(
                child: Text(
                  'الكل',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Color(0xFF2A2A2A),
                      ),
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColor.secondColor,
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.017,
                    horizontal: context.width * 0.025),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      mainCategories[index].iconUri.toString(),
                      height: context.height * 0.026,
                      width: context.width * 0.17,
                    ),
                    SizedBox(
                      height: context.height * 0.008,
                    ),
                    Text(
                      mainCategories[index].name.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            height: 1,
                            color: AppColor.secondColor,
                          ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
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

  Widget _buildItemProduct(ProductModel product, CityModel city) {
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
    );
  }

  Widget _buildEmptyResult() {
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
