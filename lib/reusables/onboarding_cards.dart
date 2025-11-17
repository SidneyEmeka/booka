import 'dart:ui';

import 'package:booka/stylings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class OnboardingCards extends StatelessWidget {
  final ImageProvider picture;
  final String info;


  const OnboardingCards({super.key, required this.picture, required this.info,});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: Get.width,
      height: Get.height*0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
             // color: Colors.red,
                width: Get.width,
                child: Image(image: picture,fit: BoxFit.contain,)),
          ),
          Container(
            width: Get.width*0.60,
            child: Text(info, style: Stylings.bodyMediumLargest,
            textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
