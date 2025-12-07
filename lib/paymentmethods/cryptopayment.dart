import 'package:booka/reusables/mybutton.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../stylings.dart';

class Cryptopayment extends StatelessWidget {
  const Cryptopayment({super.key});

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
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,)),
            ),
            // Builder(
            //     builder: (context)=> GestureDetector(
            //         onTap: (){
            //           Scaffold.of(context).openDrawer();
            //         },
            //         child: Icon(Icons.menu,color: Stylings.accentBlue,size: 23,)),
            // ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 20,
                child: Image.asset("assets/images/logospelled.png")),
          ],
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Crypto",style: Stylings.displaySemiBoldMedium.copyWith(color: Stylings.accentBlue),),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF161D2D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                   // width: Get.width*0.45,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    margin: const EdgeInsets.symmetric(vertical: 25,horizontal: 50),
                    //height: Get.height*0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: PrettyQrView.data(
                      data: 'lorem ipsum dolor sit amet',
                    ),
                  ),

                  Container(
                   // width: Get.width*0.7,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF293144),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("bhsdhbhhsbbdsksbskughdug", style: Stylings.bodyRegularSmall,),
                        const SizedBox(width: 10,),
                        const Icon(FluentIcons.copy_32_regular,color: Colors.white, size: 23,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            //amount
            Container(
              alignment: Alignment(0, 0),
              //width: Get.width*0.7,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration:  BoxDecoration(
                  color: const Color(0xFF161D2D),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Text("Amount : 10,400 = 0.00006BTC", style: Stylings.bodyRegularSmall,),

            ),
            SizedBox(height: 15),
            //warning
            Container(
              alignment: Alignment(0, 0),
             // width: Get.width*0.7,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration:  BoxDecoration(
                  color: const Color(0xFF161D2D),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(FluentIcons.warning_32_filled,color: Colors.yellow, size: 23,),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Please transfer the exact amount.",
                        softWrap: true,
                        style: Stylings.bodyRegularSmall,),
                      Text("Ensure network fees covered.",
                        softWrap: true,
                        style: Stylings.bodyRegularSmall,),
                    ],
                  ),
                ],
              ),

            ),

            SizedBox(height: 30),
            //button
            Mybutton(bText: "Pay Now", toDo: (){}),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
