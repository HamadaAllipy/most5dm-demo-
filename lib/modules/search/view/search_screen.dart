import 'dart:io';

///
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_app_bar_ios.dart';
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
import 'package:most5dm/modules/product_details/product_details.dart';
import 'package:most5dm/modules/search/view/widgets/build_search_page.dart';
import 'package:most5dm/modules/search/view/widgets/build_section_page.dart';
import 'package:most5dm/modules/search/viewModel/search_cubit.dart';
import 'package:most5dm/shared/widgets/widgets.dart';
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
              if(Platform.isIOS)
                CustomAppBarIos(
                  middle: Text(
                    'اختر النوع',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  leading: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (Platform.isAndroid)
                _buildAppBar(context),
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
                    BuildSearchPage(),
                    BuildSectionPage(appCubit: widget.appCubit),
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

  Widget _buildAppBar(BuildContext context){
    return CustomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'اضف اعلان',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: AppColor.blackLight,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
        ],
      ),
    );
  }

}
