import 'package:flutter/material.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class BuildItemListView extends StatelessWidget {

  final Widget? widget;
  const BuildItemListView({Key? key, this.widget, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        if(widget != null){
          navigateToByWidget(context, widget!);
        }
      },
      title: Text(
        'سيارات وقطع غيار',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,size: 19,),
    );
  }
}
