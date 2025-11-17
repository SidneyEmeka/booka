import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,)),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Stylings.transparent,
              onTap: (){
              },
              child: Icon(Icons.menu,color: Stylings.accentBlue,size: 23,),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
                width: 38,
                height: 20,
                child: Image.asset("assets/images/logospelled.png")),
          ],
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Stylings.transparent,
            onTap: (){
            },
            child: Icon(Icons.shopping_cart_outlined,color: Stylings.accentBlue,size: 23,),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Stylings.transparent,
            onTap: (){
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.person,color: Stylings.accentBlue,size: 23,),
            ),
          ),
        ],
      ),
    );
  }
}
