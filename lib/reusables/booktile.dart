import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../stylings.dart';


class Booktile extends StatelessWidget {
  final String bookName;
  final String authorName;
  final int bookPrice;
  const Booktile({super.key, required this.bookName, required this.authorName, required this.bookPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      //height: Get.height,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF1F6193),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(image: AssetImage("assets/images/book2.jpeg"),
              fit: BoxFit.fill)
            ),
            width: Get.width*0.18,
            height: Get.width*0.18,
          ),
          const SizedBox(width: 15,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bookName,style: Stylings.displaySemiBoldSmall,softWrap: false,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 1,),
              Text(authorName,style: Stylings.bodyRegularSmallest,),
              const SizedBox(height: 1,),
              Text(
              "₦${NumberFormat.decimalPattern('en').format(bookPrice)}",style: Stylings.displaySemiBoldSmall,),
            ],
          ))
        ],
      ),
    );
  }
}
