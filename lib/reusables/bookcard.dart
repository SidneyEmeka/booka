import 'package:booka/stylings.dart';
import 'package:booka/stylings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bookcard extends StatelessWidget {
  const Bookcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: Get.width*0.2,
      height: Get.width*0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(image: AssetImage("assets/images/book.jpeg",),fit: BoxFit.fill)
            ),
            width: Get.width*0.2,
            height: Get.width*0.2,
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("The Chakras",style: Stylings.bodyRegularSmallest,softWrap: false,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 1,),
              Text("₦5,700",style: Stylings.bodyRegularSmallest,),
            ],
          ))
        ],
      ),
    );
  }
}
