import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';


class Cartcard extends StatelessWidget {
  const Cartcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: const Color(0xFF1F6193),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(image: AssetImage("assets/images/book2.jpeg"),
                        fit: BoxFit.fill)
                ),
                width: Get.width*0.25,
                height: Get.width*0.23,
              ),
              const SizedBox(width: 15,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gross Anatomy of Upper Limb",style: Stylings.bodyMediumLarge,softWrap: false,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  Text("Vishram E.",style: Stylings.bodyRegularLarge,),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("₦5,700",style: Stylings.displayBoldSmaller,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           const Icon(FluentIcons.delete_48_regular,size: 23,color: Colors.black,),
                           const SizedBox(height: 10,),
                           //Counter
                           Container(
                             padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 2),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: const Color(0xFFFFD166),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Icon(Icons.remove,size: 20,color: Stylings.bgColor,),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  alignment: const Alignment(0, 0),
                                  color: Colors.white,
                                  child: const Text("1"),
                                ),
                                 Icon(Icons.add,size: 20,color: Stylings.bgColor,),
                               ],
                             ),
                           )
                         ],
                      )
                    ],
                  ),

                ],
              ))
            ],











          ),
          const SizedBox(height: 8,),
          Divider(color: Colors.black.withOpacity(0.5),),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}
