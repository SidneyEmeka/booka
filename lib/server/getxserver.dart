import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:booka/auths/otherinformation.dart';
import 'package:booka/auths/sign_up.dart';
import 'package:booka/reusables/loadingpage.dart';
import 'package:booka/stylings.dart';
import 'package:booka/verifyemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/departmentmodel.dart';
import '../models/universitymodel.dart';
import 'apiclient.dart';


class Bookax extends GetxController {




  var obscure = true.obs;

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


  //Toast



  // emailInputFormatter() {
  //   if (userEmail.isEmpty) {
  //     bIsActive.value = false;
  //   } else if (!userEmail.contains("@") ||
  //       !userEmail.contains(".") ||
  //       userEmail.contains(" ")) {
  //     bIsActive.value = false;
  //   } else {
  //     bIsActive.value = true;
  //   }
  // }

  var userAccessToken = "".obs;




  var isLoading = false.obs;
  //var statusCode = 0.obs;

  var registerErrorText = "".obs;

  ///Auths Locale///
  var userUsername = "".obs;
  var userEmail = "".obs;
  var userPassword = "".obs;
  var userUniversityId = "fbb16e26-bc11-477c-86c1-4fc2744ea01d".obs; //default for unn
  var userDepartment = "Radiography".obs;
  var userLevel = 0.obs;
  var userPhoneNumber = "".obs;


  var universities = [].obs;

  getUniversities(){
    Get.to(()=>const Loadingpage(doingWhat: "Fetching Universities"));
    UniversityApiClient().makeGetRequest("get-universities").then((u){
      var decodedResponse = jsonDecode(u);
      if (decodedResponse['success']==true){
        final universityModel = universityModelFromJson(u);
        universities.value = universityModel.data.universities;
        getDepartments("fbb16e26-bc11-477c-86c1-4fc2744ea01d"); //for unn as default
       // Get.off(()=>Otherinformation());
      }
      else{
        Get.off(()=>const SignUpPage());
      //  print("fail ${u}");
        Get.snackbar("Oops!", "${decodedResponse['message']}",duration: Duration(seconds: 5),colorText: Colors.white,);
      }
    }).catchError((e){
    //  print("catch $e}");
      Get.off(()=>const SignUpPage());
      Get.snackbar("Something Happened", "$e",duration: Duration(seconds: 5),
      colorText: Colors.white,);
    });
  }


  var departments = [].obs;

  getDepartments(String deptID){
    Get.to(()=>const Loadingpage(doingWhat: "Fetching Departments"));
    DepartmentApiClient().makeGetRequest("get-university-departments/$deptID").then((u){
      var decodedResponse = jsonDecode(u);
      if (decodedResponse['success']==true){
        final departmentModel = departmentModelFromJson(u);
        departments.value = departmentModel.data.departments;
        Get.off(()=>const Otherinformation());
      }
      else{
        Get.off(()=>const SignUpPage());
        print("fail $u");
        Get.snackbar("Oops!", "${decodedResponse['message']}",duration: Duration(seconds: 5),colorText: Colors.white,);
      }
    }).catchError((e){
      Get.off(()=>const SignUpPage());
      Get.snackbar("Something Happened", "$e",duration: Duration(seconds: 5),
          colorText: Colors.white);
    });
  }





  createAccount() {
    Get.to(()=>const Loadingpage(doingWhat: "Getting you Signed up"));
    //  print( {
    //   "name": userUsername.value,
    //   "email": userEmail.value,
    //   "phoneNumber": userPhoneNumber.value,
    //   "password": userPassword.value,
    //   "department": userDepartment.value,
    //   "level": userLevel.value,
    //   "universityId": userUniversityId.value
    // });

     // register
      UserApiClient().makePostRequest(endPoint: "signup-user", body:
      {
        "name": userUsername.value,
        "email": userEmail.value,
        "phoneNumber": userPhoneNumber.value,
        "password": userPassword.value,
        "department": userDepartment.value,
        "level": userLevel.value,
        "universityId": userUniversityId.value
      }
      ).then((c) {
        var decodedResponse = jsonDecode(c);
        if (decodedResponse['success']==true) {
          Get.offAll(()=>const Verifyemail());
        } else {
          print("${decodedResponse['message']}");
          Get.snackbar("Oops!", "${decodedResponse['message']}",duration: Duration(seconds: 5),colorText: Colors.white,);
          Get.offAll(()=>const SignUpPage());
        }
      }).catchError((e){
        Get.snackbar("Something Happened", "$e",
            colorText: Colors.white,duration: Duration(seconds: 5));
        Get.offAll(()=>const SignUpPage());
      });

  }



//END
}
