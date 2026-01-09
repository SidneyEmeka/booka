import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../stylings.dart';


class Booktile extends StatelessWidget {
  final String bookName;
  final String authorName;
  final int bookPrice;
  final String bookCover;
  const Booktile({super.key, required this.bookName, required this.authorName, required this.bookPrice, required this.bookCover});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      //height: Get.height,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF1F6193),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.only(right: 10,left: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(imageUrl: bookCover,
              key: UniqueKey(),
              width: Get.width*0.18,
              height: Get.width*0.18,
              fit: BoxFit.fill,
              placeholder: (context,url)=>Shimmer.fromColors(
                baseColor: Stylings.accentBlue.withOpacity(0.1),
                period:Duration(seconds: 5),
                highlightColor: Stylings.bgColor.withOpacity(0.3),
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                ),),
              ),
              errorWidget: (context,url,error)=>Shimmer.fromColors(
                baseColor: Stylings.accentBlue.withOpacity(0.1),
                period:Duration(seconds: 5),
                highlightColor: Stylings.bgColor.withOpacity(0.3),
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100 ,
                ),),
              ),), ),

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
          )),

          Align(
    alignment: Alignment(1, -1),
            child: Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 23,),
    ),
          
        ],
      ),
    );
  }
}
