import 'package:flutter/material.dart'
    show BuildContext, MaterialPageRoute, Navigator, Route, Widget;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void navigateTo({
  required BuildContext context,
  required String routeName,
}) =>
    Navigator.pushNamed(context, routeName);

void navigateToAndFinish({
  required BuildContext context,
  required String routeName,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
}

void navigateToAndFinishByWidget(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

void navigateToByWidget(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}




void navigateToOutSideBottomNav({
  required BuildContext context,
  required Widget widget,
}){
  pushNewScreen(
    context,
    screen: widget,
    withNavBar: false, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}