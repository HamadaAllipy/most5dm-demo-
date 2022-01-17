import 'package:flutter/material.dart';
import 'package:most5dm/modules/home/view/widgets/app_bar/build_sliver_appBar.dart';
import 'package:most5dm/modules/home/view/widgets/drawer/default_drawer.dart';
import 'package:most5dm/modules/home/view/widgets/tab_bar_view/build_tabBar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DefaultDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const BuildSliverAppBar(),
            ];
          },
          body: BuildTabBarView(),
        ),
      ),
    );
  }


}
