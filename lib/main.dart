import 'package:booka/reusables/loadingpage.dart';
import 'package:booka/splash_screen.dart';
import 'package:booka/stylings.dart';
import 'package:booka/verifyemail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'getxcontrollers/maincontroller.dart';
import 'onboarding/onboarding.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeControllers();
  runApp(const MyApp());
}

Future<void> initializeControllers() async {
  await Get.put(MainController());
  FlutterNativeSplash.remove();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Booka",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF081831)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF081831),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle:  Stylings.errorText,
          errorMaxLines: 2,
         // isCollapsed: true,
          fillColor: Colors.white, //check usage
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Stylings.transparent)),
          isDense: true,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Stylings.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Stylings.transparent, width: 0.5)),
          hintStyle: Stylings.bodyRegularMedium.copyWith(
              color: Color(0xFF222222)),

        ),
        appBarTheme: AppBarTheme(
          color: Stylings.bgColor,
          scrolledUnderElevation: 0
        )
      ),
      home: const Onboarding(),
     //home: Verifyemail(),
    );
  }
}

