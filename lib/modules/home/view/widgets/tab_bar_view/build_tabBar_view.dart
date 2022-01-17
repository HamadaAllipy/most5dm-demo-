import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_icons.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/modules/home/model/model/categories_model.dart';
import 'package:most5dm/modules/home/view/widgets/carousel/build_carousel_slider.dart';

class BuildTabBarView extends StatelessWidget {
  BuildTabBarView({Key? key}) : super(key: key);

  final List<CategoriesModel> categories = [
    CategoriesModel(
        title: 'Cars',
        image:
        'https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?cs=srgb&dl=pexels-alexgtacar-1592384.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Mobile',
        image:
        'https://images.pexels.com/photos/8066714/pexels-photo-8066714.png?cs=srgb&dl=pexels-mediamodifier-8066714.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Laptop',
        image:
        'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?cs=srgb&dl=pexels-craig-dennis-205421.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Bicycle',
        image:
        'https://images.pexels.com/photos/5911709/pexels-photo-5911709.jpeg?cs=srgb&dl=pexels-cottonbro-5911709.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Computer',
        image:
        'https://images.pexels.com/photos/5082554/pexels-photo-5082554.jpeg?cs=srgb&dl=pexels-cottonbro-5082554.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Air conditioner',
        image:
        'https://cdn.pixabay.com/photo/2019/05/15/10/16/air-conditioner-4204637_1280.jpg'),
    CategoriesModel(
        title: 'Camera',
        image:
        'https://cdn.pixabay.com/photo/2014/11/22/00/51/camera-541213_1280.jpg'),
    CategoriesModel(
        title: 'Mobile',
        image:
        'https://images.pexels.com/photos/8066714/pexels-photo-8066714.png?cs=srgb&dl=pexels-mediamodifier-8066714.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Laptop',
        image:
        'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?cs=srgb&dl=pexels-craig-dennis-205421.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Bicycle',
        image:
        'https://images.pexels.com/photos/5911709/pexels-photo-5911709.jpeg?cs=srgb&dl=pexels-cottonbro-5911709.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Computer',
        image:
        'https://images.pexels.com/photos/5082554/pexels-photo-5082554.jpeg?cs=srgb&dl=pexels-cottonbro-5082554.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Air conditioner',
        image:
        'https://cdn.pixabay.com/photo/2019/05/15/10/16/air-conditioner-4204637_1280.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildCarouselSlider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'التصنيفات',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppString.categoriesScreen);
                            },
                            child: Text(
                              'عرض الكل',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                          width: 80,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: AppColor.defaultColor
                                                .withOpacity(0.1),
                                            borderRadius:
                                            BorderRadius.circular(6),
                                            border: Border.all(
                                              color: AppColor.defaultColor
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          child: Icon(
                                            AppIcons.add_shopping_cart,
                                            color: AppColor.defaultColor,
                                          )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const Text(
                                        'bike',
                                        style: TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                },
                                itemCount: 20,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'التوصية',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildItem();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: 10,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Center(
          child: Text("It's rainy here"),
        ),
        const Center(
          child: Text("It's sunny here"),
        ),
        const Center(
          child: Text("It's sunny here"),
        ),
      ],
    );
  }

  Widget buildItem() => Container(
    height: 150,
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(
      borderRadius: BorderRadiusDirectional.horizontal(
        start: Radius.circular(25),
        end: Radius.circular(10),
      ),
      border: Border.fromBorderSide(
        BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  categories[1].image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'canon 200D with 18-55 kit lens',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  LikeButton(
                    size: 25,
                    circleColor: const CircleColor(
                        start: Color(0xff2BC27F), end: Color(0xff2BC27F)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff2BC27F),
                      dotSecondaryColor: Color(0xff2BC27F),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 23,
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      '87.000',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '2 Day Ago',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'التفاصيل',
                          style: TextStyle(
                            color: AppColor.defaultColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'some text text',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
