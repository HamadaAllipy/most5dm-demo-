import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_values.dart';
import 'package:most5dm/modules/home/model/model/categories_model.dart';

class RowCategoriesHome extends StatefulWidget {
  const RowCategoriesHome({Key? key}) : super(key: key);

  @override
  State<RowCategoriesHome> createState() => _RowCategoriesHomeState();
}

class _RowCategoriesHomeState extends State<RowCategoriesHome> {

  final List<CategoriesModel> categories = [
    CategoriesModel(
      title: 'سيارات وقطع غيار',
      image: 'assets/icon/car.png',
    ),
    CategoriesModel(
      title: 'سيارات وقطع غيار',
      image: 'assets/icon/car.png',
    ),
    CategoriesModel(
      title: 'سيارات وقطع غيار',
      image: 'assets/icon/car.png',
    ),
    CategoriesModel(
      title: 'سيارات وقطع غيار',
      image: 'assets/icon/car.png',
    ),
    CategoriesModel(
      title: 'سيارات وقطع غيار',
      image: 'assets/icon/car.png',
    ),
    CategoriesModel(
      title: 'سيارات وقطع غيار',
      image: 'assets/icon/car.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            height: context.height * 0.0518,
            width: context.width * 0.142,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'الكل',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.0518,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: context.width * 0.2056,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          categories[index].image,
                          width: context.width * 0.128,
                          height: context.height * 0.02,
                        ),
                        Text(
                          categories[index].title,
                          style: TextStyle(
                            fontSize: context.height * 0.0099,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
