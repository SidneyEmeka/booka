import 'package:booka/server/getxserver.dart';
import 'package:get/get.dart';

class MainControoller extends GetxController{

  @override
  void onInit() {
    Get.put<Bookax>(Bookax());
    super.onInit();
  }

  var navIndex = 0.obs;
  onTapNavItem(int tappedIndex) {
    navIndex.value = tappedIndex;
  }

  RxMap<String, dynamic> userNotificationPreferences =
  RxMap({"email": true, "sms": true, });

  ///END
}