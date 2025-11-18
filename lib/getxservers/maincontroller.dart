import 'package:get/get.dart';

class MainControoller extends GetxController{

  var navIndex = 0.obs;
  onTapNavItem(int tappedIndex) {
    navIndex.value = tappedIndex;
  }
}