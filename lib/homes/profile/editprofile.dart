import 'package:booka/reusables/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../stylings.dart';


class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

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
        //color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Edit Profile",style: Stylings.displaySemiBoldMedium.copyWith(color: Stylings.accentBlue),),
                SizedBox(height: Get.height*0.02),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/avatar.png"),
                ),
                SizedBox(height: Get.height*0.015),
                Text("Agoha Isdore",style: Stylings.displayBoldMedium.copyWith(color: Stylings.accentBlue),),
                Text("Agric Economics and Extension",style: Stylings.displaySemiBoldSmaller),
                SizedBox(height: Get.height*0.04),


                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border(
                        top: BorderSide(color: Stylings.accentBlue,width: 1.5),
                        right: BorderSide(color: Stylings.accentBlue,width: 1.5),
                        left: BorderSide(color: Stylings.accentBlue,width: 1.5),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //username
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
                            hintText: "Username",
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),

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
                      const SizedBox(height: 40,),

                      Mybutton(bText: "Save Changes",toDo: (){})
                    ]
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
