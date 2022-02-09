import 'package:flutter/material.dart';
import 'package:most5dm/components/background_image.dart';
import 'package:most5dm/components/custom_status_bar.dart';
import 'package:most5dm/constants/app_colors.dart';
import 'package:most5dm/layout/views/widgets/custom_app_bar.dart';
import 'package:most5dm/modules/add_ads/view/screen/add_ads_screen.dart';
import 'package:most5dm/modules/add_ads/view/widgets/build_item_list_view.dart';

import 'add_ads_screen_.dart';

class SelectBrandScreen extends StatelessWidget {
  const SelectBrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      child: BackgroundImage(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 100,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    if(index.isOdd){
                      return Divider(
                        height: 0.5,
                        color: AppColor.dimGrey,
                      );
                    }
                    else{
                      return BuildItemListView(widget: AddAdsScreen_(),);
                    }
                  },
                ),
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
            onPressed: () {},
            icon: Icon(
              Icons.clear,
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
