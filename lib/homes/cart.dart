import 'package:booka/paymentmethods/cryptopayment.dart';
import 'package:booka/reusables/cartcard.dart';
import 'package:booka/reusables/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            SizedBox(height: Get.height*0.02),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
              decoration: BoxDecoration(
                  color: const Color(0xFF1F6193),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: const Alignment(-1, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Text("Find books by course or title",style: Stylings.bodyMediumLarger.copyWith(color: Stylings.bgColor.withOpacity(0.6)),),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Icon(Icons.search,color: Colors.white,size: 25,)
                ],
              ),
            ),
            SizedBox(height: Get.height*0.04),


            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.only(left: 10,right: 20,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFF1F6193)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Cartcard(),
                  Cartcard(),
                  Cartcard(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Subtotal :",style: Stylings.bodyMediumLarge,),
                      Text(" ₦510,000",style: Stylings.displayBoldestSmall,),
                    ],
                  ),
                  SizedBox(height: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Service fee :",style: Stylings.bodyMediumLarge,),
                      Text(" ₦500",style: Stylings.displayBoldestSmall,),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Order total :",style: Stylings.bodyMediumLarge,),
                      Text(" ₦510,500",style: Stylings.displayBoldestSmall.copyWith(color:Stylings.priGreen ),),
                    ],
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            
          Padding(padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30,),
              Text("Payment Method",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
              SizedBox(height: 5,),
              Row(
                children: [
                  Expanded(child: Mybutton(bText: "Card", toDo: (){},diffColor: true,col1: Color(0xFF2F3746),col2: Color(0xFF2F3746),)),
                  SizedBox(width: 12,),
                  Expanded(child: Mybutton(bText: "Bank Transfer", toDo: (){},diffColor: true,col1: Color(0xFF2F3746),col2: Color(0xFF2F3746),)),
                  SizedBox(width: 12,),
                  Expanded(child: Mybutton(bText: "Wallet", toDo: (){},diffColor: true,col1: Color(0xFF2F3746),col2: Color(0xFF2F3746),))
                ],
              ),
              SizedBox(height: 15),
              Mybutton(bText: "Proceed to payment", toDo: (){Get.to(()=>Cryptopayment());}),
              SizedBox(height: 30,),
            ],
          ),)
          ],
        ),
      ),
    );
  }
}
