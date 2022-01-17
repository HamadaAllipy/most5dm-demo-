import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:most5dm/modules/categories/views/screens/finish_screen.dart';
import 'package:most5dm/shared/model/categories_model.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class DefaultCategoryScreen extends StatelessWidget {

  final CategoriesModel? model;

   const DefaultCategoryScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model?.titleAppBar.toString()?? 'null',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100],
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: model?.hintSearch?? '',
                        hintStyle: const TextStyle(height: 1),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if(model != null)
            Expanded(
              child: ListView.separated(
                itemCount: model?.items?.length?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: model!.items![index]['path_icon']!=null? SvgPicture.asset(
                      model!.items![index]['path_icon'].toString(),
                      height: 25,
                      width: 25,
                    ):null,
                    title: Text(model?.items![index]['name']),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                    onTap: () {
                        navigateTo(
                          context: context,
                          widget: model?.end== null ? DefaultCategoryScreen(
                            model: CategoriesModel.fromJson(
                              model?.items![index],
                            ),
                          ): FinishScreen(collection: model?.items![index]['collection'],),
                        );
                      },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
