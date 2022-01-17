import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:most5dm/constants/app_colors.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: AppColor.defaultColor.withOpacity(0.3),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          size: 33,
                          color: AppColor.defaultColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hamada Mohamed',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '0222222222222',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.2),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    buildItem(
                      icon: Icons.ac_unit_sharp,
                      nameIcon: 'اشعارات',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    buildItem(
                      icon: Icons.ac_unit_sharp,
                      nameIcon: 'اشعارات',
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 16,
                    ),
                    buildItem(
                      icon: Icons.ac_unit_sharp,
                      nameIcon: 'اشعارات',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    buildItem(
                      icon: Icons.ac_unit_sharp,
                      nameIcon: 'اشعارات',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItem({
    required String nameIcon,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          nameIcon,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
