import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width*0.5,
        leading:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Stylings.transparent,
              onTap: (){
              },
              child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,)),
            ),
          ],
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Stylings.transparent,
            onTap: (){
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(Icons.share,color: Stylings.accentBlue,size: 23,),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
