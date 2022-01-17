import 'package:flutter/material.dart';
import 'package:most5dm/components/read_json.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/modules/auth/view/widgets/default_button.dart';
import 'package:most5dm/modules/categories/viewModels/all_categories_view_model.dart';
import 'package:most5dm/modules/categories/views/widgets/default_category_screen.dart';
import 'package:most5dm/shared/model/categories_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class FinishScreen extends StatelessWidget {
  final collection;
  final AllCategoriesViewModel viewModel = AllCategoriesViewModel();

   FinishScreen({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.defaultColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    height: 120,
                    width: 120,
                    child: InkWell(
                      onTap: () {
                        // TODO picker image
                      },
                      splashColor: AppColor.defaultColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 55,
                          ),
                          Text(
                            'أضف صورة',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    child: ListView.separated(
                      itemCount: collection.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${collection[index]['title_ar']}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                '${collection[index]['data']}',
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            ],
                          ),
                          onTap: (){
                            var model ;
                            switch(index){
                              case 0:
                                model = categoriesModel;
                                break;
                              case 1:
                                model = CategoriesModel.fromJson(categoriesModel?.items![0]);
                                break;
                            }
                            navigateTo(
                              context: context,
                              widget: DefaultCategoryScreen(
                                model: model,
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){},
            color: AppColor.defaultColor,
            minWidth: double.infinity,
            height: 45,
            child: const Text(
              'حفظ ونشر الاعلان',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
