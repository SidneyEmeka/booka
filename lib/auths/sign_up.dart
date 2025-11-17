import 'package:booka/auths/log_in.dart';
import 'package:booka/reusables/mybutton.dart';
import 'package:booka/stylings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  SizedBox(height: Get.height*0.03,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Welcome back!\nSign Up to continue',
                      style: Stylings.displayBoldMedium.copyWith(color: Stylings.accentBlue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: Get.height*0.03,),
                Container(
                  width: Get.width,
                  height: Get.height*0.064,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        stops: [
                          0.7,
                          1.0
                        ],
                        colors: [
                          Color(0xFF1A73E8),
                          Color(0xFF00C6FF),
                        ]),
                    //   color: isActive?bColor:Stylings.priYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //child: Text(bText,style: Stylings.thicSubtitle.copyWith(color: isActive?Colors.white:Colors.grey.shade200,fontSize: 11*Get.size.aspectRatio*2.5),),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width:16,
                            height: 16,
                            child: Image.asset("assets/images/googlelogo.png")),
                        const SizedBox(width: 10,),
                        Text("Sign Up with Google",style: Stylings.buttonTexts)]),
                ),
        SizedBox(height: Get.height*0.03,),
                  Text('or',style: Stylings.bodyRegularLargest,),
               SizedBox(height: Get.height*0.03,),

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
                  const SizedBox(height: 20,),
                  //Email/Phone
                  SizedBox(
                    height: Get.height * 0.055,
                    child: TextFormField(
                      onTap: () {

                      },
                      onChanged: (p) {

                      },
                      style: Stylings.bodyRegularMedium.copyWith(
                          color: const Color(0xFF222222)),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.grey.shade500,
                      cursorHeight: 15,
                      cursorWidth: 1,
                      decoration: const InputDecoration(
                        hintText: "Email or phone number",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //password
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
                   Mybutton(bText: "Sign Up",diffColor: false, toDo: () {  },),
                  SizedBox(height: Get.height*0.03,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
                    child: Text(
                      'By signing you are agreed with our friendly terms and condition',
                      style: Stylings.bodyRegularSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: Get.height*0.04,),
                  Text(
                    'Already have an account?',
                    style: Stylings.bodyRegularSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height*0.04,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>LogIn());
                      },
                      child: Text(
                      'Sign in',
                      style: Stylings.bodyMediumLarge,
                      textAlign: TextAlign.center,
                                        ),
                    ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
