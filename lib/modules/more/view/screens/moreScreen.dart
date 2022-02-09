import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_string.dart';
import 'package:most5dm/modules/account/view/screens/view_profile_screen.dart';
import 'package:most5dm/shared/widgets/widgets.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  List<String> items = [
    'حسابي',
    'mohamed',
    'seif',
    'ahmed',
  ];

  ScrollController controller = ScrollController();

  List<String> screens = [
    AppString.viewProfileScreen,

  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return const ViewProfileScreen();
                    }
                ));
              },
              child: const Text(
                'hamada',
              ),
            ),
            const Text('hamada'),
            const Text('hamada'),
            const Text('hamada'),
            const Text('hamada'),
            const Text('hamada'),
            const Text('hamada'),
            const Text('hamada'),
            const Text('hamada'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
              width: 1.3,
            )),
            child: dropDown(context),
          ),
        ),
        customDrop(),
      ],
    ); 
  }

  Widget dropDown(context){
    return DropdownButton(
      enableFeedback: true,
      items: items.map((String value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
          enabled: true,
          onTap: () {
            print('hellow');


          },
        );
      }).toList(),

      onChanged: (value) {
        if(value == 'حسابي'){
          navigateTo(context: context, routeName: AppString.viewProfileScreen);
        }
        else{
          print('no thing');
        }
      },
      style: const TextStyle(
        color: Colors.red,
      ),
      hint: const Text(
        'المساعدة ولاعدادات',
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 32,
      ),
      isExpanded: true,
      underline: DropdownButtonHideUnderline(
        child: Container(),
      ),
      isDense: false,
    );
  }

  Widget customDrop(){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                controller.jumpTo(500);
              },
              icon: const Icon(Icons.arrow_downward),
            ),
          ],
        ),
      ),
    );
  }
}
