import 'dart:convert';

import 'package:booka/models/recomendedbooksmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../reusables/loadingpage.dart';
import '../server/apiclient.dart';

class BooksController extends GetxController {

var recomendedBooks = <Book>[].obs;

var hitTimme = 0.obs;


var recBooksLoading = false.obs;
 Future getRecomendedBooks() async{
 if(recBooksLoading.value){return;}
 recBooksLoading.value=true;
  await BooksApiClient().makeGetRequest("get-recommended-books").then((b){
  var decodedResponse = jsonDecode(b);
  if (decodedResponse['success']==true){
  //print(decodedResponse);
  final recommendedBooksModel = recommendedBooksModelFromJson(b);
  recomendedBooks.value = recommendedBooksModel.data.books;
  recBooksLoading.value=false;
  hitTimme.value++;
  }
  else if (decodedResponse['success']==false){
  recBooksLoading.value=false;
  print(decodedResponse);
  //Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
  else{
  recBooksLoading.value=false;
  print(decodedResponse);
  // Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
  }).catchError((e){
  recBooksLoading.value=false;


  // Get.snackbar("Something Happened", "$e",duration: const Duration(seconds: 5),
   //     colorText: Colors.white);
  });
 }

  //END
}

