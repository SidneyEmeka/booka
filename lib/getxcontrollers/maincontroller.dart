import 'package:booka/getxcontrollers/authcontroller.dart';
import 'package:booka/getxcontrollers/bookscontroller.dart';
import 'package:booka/homes/homepage.dart';
import 'package:booka/homes/profile/profile.dart';
import 'package:booka/reusables/loadingpage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController{

  @override
  void onInit() {
    Get.put<AuthController>(AuthController());
    Get.put<BooksController>(BooksController());
    super.onInit();
  }




  //date formatter to how mamny days or hours ago
  getRelativeTime(String isoString) {
    // Parse the ISO 8601 string to DateTime
    DateTime dateTime = DateTime.parse(isoString);

    // Get the current time
    DateTime now = DateTime.now().toUtc();

    // Calculate the difference
    Duration difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return "${difference.inDays ~/ 365} ${difference.inDays ~/ 365 == 1 ? 'year' : 'years'} ago";
    } else if (difference.inDays > 30) {
      return "${difference.inDays ~/ 30} ${difference.inDays ~/ 30 == 1 ? 'month' : 'months'} ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
    } else {
      return "just now";
    }
  }

  //date formaterr to dd/mm/yy
  dateFormat(String theDate) {
    String dateTimeString = theDate;
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Create a DateFormat object with the desired format
    DateFormat formatter = DateFormat('EEEE, MMMM d');

    // Format the date and time
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
    // print(formattedDateTime);
  }

  var navIndex = 0.obs;
  onTapNavItem(int tappedIndex) {
    navIndex.value = tappedIndex;

    //navigate
    switch (navIndex.value) {
      case 0: return Get.to(()=>Homepage());
      case 1: return Get.to(()=>Loadingpage(doingWhat: '1 page',));
      case 2: return Get.to(()=>Loadingpage(doingWhat: '2 page',));
      case 3: return Get.to(()=>Loadingpage(doingWhat: '3 page',));
      case 4: return Get.to(()=>Profile());

    }
  }

  RxMap<String, dynamic> userNotificationPreferences =
  RxMap({"email": true, "sms": true, });

  ///END
}