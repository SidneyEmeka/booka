import 'package:booka/reusables/mybutton.dart';
import 'package:booka/stylings.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Verifyemail extends StatelessWidget {
  const Verifyemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),

              Text("Account Verification",style: Stylings.displaySemiBold.copyWith(color: Stylings.accentBlue),),
              SizedBox(height: 5),
              Text("Your Booka account is ready. Verify your email address to Sign in",style: Stylings.displaySemiBoldSmall,textAlign: TextAlign.center,),
              //  Image.asset("assets/images/success.png"),
              Spacer(flex: 2,),

              Icon(FluentIcons.mail_32_regular,color: Colors.white,size: Get.height*0.3,),
              Text("Kindly check your mail to verify your email address",style: Stylings.displaySemiBoldSmall,textAlign: TextAlign.center,),
              Spacer(flex: 2,),

              Mybutton(bText: "Proceed to Sign in", toDo: (){},),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
