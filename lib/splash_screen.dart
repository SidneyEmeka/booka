import 'dart:async';

import 'package:booka/onboarding/onboarding.dart';
import 'package:booka/stylings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3),() {
     Get.offAll(()=>const Onboarding());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),//for relative spacing
            SizedBox(
              width: Get.width * 0.26,
              height: Get.height * 0.14,
              child: const Image(
                // width: 98,
                // height: 115.15,
                ///You don't do this because what happens in smaller/bigger screen sizes?
                image: AssetImage('assets/images/bookalogo.png'),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Booka',
              style: Stylings.displayBold
            ),
            const Spacer(),
            Text(
              'Smart Textbook Access for \nUniversity Students',
              textAlign: TextAlign.center,
              style: Stylings.displayBoldSmall
            ),

          ],
        ),
      ),
    );
  }
}
