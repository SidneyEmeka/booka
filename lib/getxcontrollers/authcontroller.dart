import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:booka/auths/log_in.dart';
import 'package:booka/auths/otherinformation.dart';
import 'package:booka/auths/sign_up.dart';
import 'package:booka/homes/homepage.dart';
import 'package:booka/reusables/loadingpage.dart';
import 'package:booka/stylings.dart';
import 'package:booka/verifyemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/departmentmodel.dart';
import '../models/universitymodel.dart';
import '../models/usermodel.dart';
import '../server/apiclient.dart';


class AuthController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    mountRefreshTimer();
  }


  ///Auths Locale////
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
      else if(decodedResponse['success']==false){
        Get.off(()=>const SignUpPage());
      //  print("fail ${u}");
        Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
      }
      else{
        Get.off(()=>const SignUpPage());
        //  print("fail ${u}");
        Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
      }
    }).catchError((e){
    //  print("catch $e}");
      Get.off(()=>const SignUpPage());
      Get.snackbar("Something Happened", e.toString().contains("^")?"A network error occurred, please try again":"$e",duration: const Duration(seconds: 5),

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
      else if (decodedResponse['success']==false){
        Get.off(()=>const SignUpPage());
       // print("fail $u");
        Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
      }
      else{
      Get.off(()=>const SignUpPage());
      //  print("fail ${u}");
      Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
      }
    }).catchError((e){
      Get.off(()=>const SignUpPage());
      Get.snackbar("Something Happened", e.toString().contains("^")?"A network error occurred, please try again":"$e",duration: const Duration(seconds: 5),
          colorText: Colors.white);
    });
  }

  var userUsername = "".obs;
  var userEmail = "".obs;
  var userPassword = "".obs;
  var userUniversityId = "fbb16e26-bc11-477c-86c1-4fc2744ea01d".obs; //default for unn
  var userDepartment = "Radiography".obs;
  var userLevel = 0.obs;
  var userPhoneNumber = "".obs;

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
        }
        else if (decodedResponse['success']==false){
          print("${decodedResponse['message']}");
          Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
          Get.offAll(()=>const SignUpPage());
        }
        else{
        Get.offAll(()=>const SignUpPage());
        //  print("fail ${u}");
        Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
        }
      }).catchError((e){
        Get.snackbar("Something Happened", e.toString().contains("^")?"A network error occurred, please try again":"$e",
            colorText: Colors.white,duration: const Duration(seconds: 5));
        Get.offAll(()=>const SignUpPage());
      });

  }


  var loginEmail = "".obs;
  var loginPassword = "".obs;

  var userData = {
    "name": "",
    "id": "",
    "email": "",
    "uniId": "",
    "uniName": "",
    "uniSlug": "",
  }.obs;

  var userAccessToken = "".obs;
  var userRefreshToken = "".obs;


  loginAccount(){
    Get.to(()=>const Loadingpage(doingWhat: "Signing you in"));
    //  print( {
    //   "email": loginEmail.value,
    //   "password": loginPassword.value,
    // });

    // login
    UserApiClient().makePostRequest(endPoint: "login-user", body:
    {
      "email": loginEmail.value,
      "password": loginPassword.value,
    }
    ).then((c) {
      var decodedResponse = jsonDecode(c);
      if (decodedResponse['success']==true) {
        final userModel = userModelFromJson(c);
        final userModelBiodata = userModel.data.user;
        final userModelUniversity = userModel.data.user.university;
        final userModelTokens = userModel.data.tokens;
        //biodata
        userData["name"] = userModelBiodata.name;
        userData["id"] = userModelBiodata.id;
        userData["email"] = userModelBiodata.email;
        //uniInfos
        userData["uniId"] = userModelUniversity.id;
        userData["uniName"] = userModelUniversity.name;
        userData["uniSlug"] = userModelUniversity.slug;
        //Tokens
        userAccessToken.value = userModelTokens.accessToken;
        userRefreshToken.value = userModelTokens.refreshToken;

        Get.offAll(()=>const Homepage());
      }
      else if (decodedResponse['success']==false){
        Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
        Get.offAll(()=>const LogIn());
      }
      else{
      Get.offAll(()=>const LogIn());
      //  print("fail ${u}");
      Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
      }
    }).catchError((e){
      print(e);
      Get.snackbar("Something Happened", e.toString().contains("^")?"A network error occurred, please try again":"$e",
          colorText: Colors.white,duration: const Duration(seconds: 5));
      Get.offAll(()=>const LogIn());
    });

  }



///REFRESH TOKEN///
 Worker? _refreshWorker;
  Timer? _refreshTimer;

  mountRefreshTimer() {
    _refreshWorker = ever(userAccessToken, (_){
      _refreshTimer = Timer.periodic(
          const Duration(minutes: 12),
              (timer) async {
      await refreshAccessToken();
      }
      );
    });
  }

  refreshAccessToken(){
   // print("refresh called");
    UserApiClient().makePostRequest(endPoint: "refresh-user-token", body: {"refreshToken":"$userRefreshToken"}).then((t){
      var decodedResponse = jsonDecode(t);
      if (decodedResponse['success']==true) {
        userAccessToken.value = decodedResponse["data"]["accessToken"];
        //print("refreshed");
      }
      else{
        Get.offAll(()=>LogIn());
        print(decodedResponse);
        print("ref failed ${decodedResponse['message']}");
      }
    }).catchError((e){
      Get.offAll(()=>LogIn());
      print("ref catch $e");

    });
  }


  @override
  void onClose() {
    _refreshWorker?.dispose();
    _refreshTimer?.cancel();
    super.onClose();
  }
//END
}
