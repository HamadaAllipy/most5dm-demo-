import 'package:flutter/material.dart';
import 'package:most5dm/modules/home/model/model/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  List<CategoriesModel> categories = [
    CategoriesModel(
        title: 'Cars',
        image:
        'https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?cs=srgb&dl=pexels-alexgtacar-1592384.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Mobile',
        image:'https://images.pexels.com/photos/8066714/pexels-photo-8066714.png?cs=srgb&dl=pexels-mediamodifier-8066714.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Laptop',
        image:'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?cs=srgb&dl=pexels-craig-dennis-205421.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Bicycle',
        image:'https://images.pexels.com/photos/5911709/pexels-photo-5911709.jpeg?cs=srgb&dl=pexels-cottonbro-5911709.jpg&fm=jpg'
    ),
    CategoriesModel(
        title: 'Computer',
        image:'https://images.pexels.com/photos/5082554/pexels-photo-5082554.jpeg?cs=srgb&dl=pexels-cottonbro-5082554.jpg&fm=jpg'
    ),
    CategoriesModel(
        title: 'Air conditioner',
        image:'https://cdn.pixabay.com/photo/2019/05/15/10/16/air-conditioner-4204637_1280.jpg'),
    CategoriesModel(
        title: 'Camera',
        image:'https://cdn.pixabay.com/photo/2014/11/22/00/51/camera-541213_1280.jpg'
    ),
    CategoriesModel(
        title: 'Mobile',
        image:'https://images.pexels.com/photos/8066714/pexels-photo-8066714.png?cs=srgb&dl=pexels-mediamodifier-8066714.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Laptop',
        image:'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?cs=srgb&dl=pexels-craig-dennis-205421.jpg&fm=jpg'),
    CategoriesModel(
        title: 'Bicycle',
        image:'https://images.pexels.com/photos/5911709/pexels-photo-5911709.jpeg?cs=srgb&dl=pexels-cottonbro-5911709.jpg&fm=jpg'
    ),
    CategoriesModel(
        title: 'Computer',
        image:'https://images.pexels.com/photos/5082554/pexels-photo-5082554.jpeg?cs=srgb&dl=pexels-cottonbro-5082554.jpg&fm=jpg'
    ),
    CategoriesModel(
        title: 'Air conditioner',
        image:'https://cdn.pixabay.com/photo/2019/05/15/10/16/air-conditioner-4204637_1280.jpg'),
  ];
   CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: categories.map((category) => buildCategory(category)).toList(),
        ),
      ),
    );
  }

  Widget buildCategory(CategoriesModel model){
    return  Card(
      color: Colors.red,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.network(
            model.image,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            height: 30,
            child: Text(
              model.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
