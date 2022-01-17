import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_cubit.dart';
import 'package:most5dm/modules/add_ads/viewModel/cubit/add_ads_states.dart';
import 'package:most5dm/modules/categories/views/screens/all_categories_screen.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class AddAdsScreen extends StatelessWidget {
  const AddAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AddAdsCubit.get(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            _buildDialog(context, cubit, mediaQuery);
          },
        ),
        title: const Text(
          'أضف إعلان',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocBuilder<AddAdsCubit, AddAdsStates>(
            builder:(context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.15,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
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
                          width: 20,
                        ),
                        if(cubit.image != null)
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.defaultColor.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  height: 120,
                                  width: 120,
                                  child: Image.file(
                                    File(cubit.image!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            itemCount: 10,
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 1.0,
                    color: Colors.grey[100],
                    child: Row(
                      children: const [
                        Text(
                          'ما الذي توده بيعه أو الاعلان عنه',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                      ],
                    ),
                    onPressed: () {
                      navigateTo(
                          context: context, widget: const AllCategoriesScreen());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: Card(
                    color: Colors.grey[100],
                    elevation: 5,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(
                            start: 16,
                          ),
                          hintText: 'اسم الإعلان (مثال: تويوتا كامري ٢٠١٨ للبيع)',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Card(
                    color: Colors.grey[100],
                    elevation: 5,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(
                            start: 16,
                          ),
                          hintText: 'وصف الاعلان (أضف المزيد من التفاصيل)',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: Card(
                    color: Colors.grey[100],
                    elevation: 5,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(
                            start: 16,
                          ),
                          hintText: 'السعر المطلوب',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: MaterialButton(
                    onPressed: () {},
                    color: AppColor.defaultColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'حفظ ونشر الاعلان',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _buildDialog(BuildContext context, AddAdsCubit cubit, MediaQueryData mediaQuery){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog(
        clipBehavior: Clip.antiAlias,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 10
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          height: mediaQuery.size.height * 0.25,
              padding: const EdgeInsetsDirectional.all(20),
              width: double.infinity,
          decoration:  const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إلغاء إضافة إعلان',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'هل انت متأكد من إلغاء إضافة إعلان؟',
                style: Theme.of(context).textTheme.headline5,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'إلغاء',
                        ),
                      ),
                  TextButton(
                        onPressed: () {
                          navigateToAndFinish(context: context, routeName: AppString.appLayout);
                        },
                        child: const Text(
                          'نعم',
                        ),
                      ),
                    ],
              ),
            ],
          ),
        ),
      );
    });
  }


  void _buildDialogSelectImage(BuildContext context, AddAdsCubit cubit, MediaQueryData mediaQuery){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog(
        clipBehavior: Clip.antiAlias,
        insetPadding: const EdgeInsets.symmetric(
            horizontal: 10
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          height: mediaQuery.size.height * 0.25,
          padding: const EdgeInsetsDirectional.all(20),
          width: double.infinity,
          decoration:  const BoxDecoration(
            color: Colors.red,
          ),
        ),
      );
    });
  }
}


