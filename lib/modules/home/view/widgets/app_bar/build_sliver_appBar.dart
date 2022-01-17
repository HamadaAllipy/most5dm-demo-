import 'package:flutter/material.dart';
import 'package:most5dm/modules/home/view/widgets/search/custom_search_delegate.dart';


/// build app bar for home Screen
class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      pinned: true,
      actions: _buildAction(context),
      bottom: _buildTabBar(),
    );
  }

  PreferredSizeWidget _buildTabBar(){
    return const TabBar(
      padding: EdgeInsets.zero,
      tabs: [
        Tab(
          icon: null,
          child: Text(
            'الإعلانات',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: null,
          child: Text(
            'الأقسام',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: null,
          child: Text(
            'متاجر',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: null,
          child: Text(
            'شوهد',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildAction(
    BuildContext context,
  ) {
    return [
      IconButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        icon: const Icon(
          Icons.search,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
        ),
      ),
    ];
  }
}
