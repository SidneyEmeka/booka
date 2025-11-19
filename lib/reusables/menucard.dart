import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';

class Menucard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const Menucard({super.key, required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: Get.height*0.2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,size: 25,color: Colors.white,),
          Text(title,style: Stylings.displayBoldMedium,)
        ],
      ),
    );
  }
}
