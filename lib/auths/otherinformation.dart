import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../reusables/mybutton.dart';
import '../stylings.dart';


class Otherinformation extends StatelessWidget {
  const Otherinformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Stylings.transparent,
          onTap: (){
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Other Information',
                    style: Stylings.displaySemiBoldMedium.copyWith(color: Stylings.accentBlue),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: Get.height*0.03,),


                //University
                SizedBox(
                  height: Get.height * 0.055,
                  child: TextFormField(
                    onTap: () {

                    },
                    onChanged: (p) {

                    },
                    style: Stylings.bodyRegularMedium.copyWith(
                        color: const Color(0xFF222222)),
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                      hintText: "Search University",
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

                //Department
                SizedBox(
                  height: Get.height * 0.055,
                  child: TextFormField(
                    onTap: () {

                    },
                    onChanged: (p) {

                    },
                    style: Stylings.bodyRegularMedium.copyWith(
                        color: const Color(0xFF222222)),
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                      hintText: "Department",
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

                //level
                SizedBox(
                  height: Get.height * 0.055,
                  child: TextFormField(
                    onTap: () {

                    },
                    onChanged: (p) {

                    },
                    style: Stylings.bodyRegularMedium.copyWith(
                        color: const Color(0xFF222222)),
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                      hintText: "Level",
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

                Mybutton(bText: "Continue",toDo: (){}),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
