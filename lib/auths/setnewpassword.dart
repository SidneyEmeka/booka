import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../reusables/mybutton.dart';
import '../stylings.dart';

class Setnewpassword extends StatelessWidget {
  const Setnewpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading:  InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Stylings.transparent,
          onTap: (){
          },
          child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
          color: Stylings.bgColor,
          width: Get.width,
          height: Get.height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 76,
                      height: 39,
                      child: Image.asset("assets/images/logospelled.png")),
                  SizedBox(height: Get.height*0.03,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Forgot your password?',
                      style: Stylings.displayBoldMedium.copyWith(color: Stylings.accentBlue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: Get.height*0.03,),



                  //new password
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
                        hintText: "Password",
                      ),
                    ),
                  ),




                  const SizedBox(height: 20,),
                  //new password
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
                        hintText: "Password",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //Sign up button
                   Mybutton(bText: "Reset Password",diffColor: false, toDo: () {  },),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
