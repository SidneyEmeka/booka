import 'dart:convert';

import 'package:booka/models/allbooksmodel.dart';
import 'package:booka/models/recomendedbooksmodel.dart';
import 'package:booka/models/searchedBooksModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../reusables/loadingpage.dart';
import '../server/apiclient.dart';

class BooksController extends GetxController {

 ///Recomended books
var recomendedBooks = <Book>[].obs;
var recBooksLoading = false.obs;

 Future getRecomendedBooks() async{
 if(recBooksLoading.value){return;}
 recBooksLoading.value=true;

  await BooksApiClient().makeGetRequest("get-recommended-books").then((b){
  var decodedResponse = jsonDecode(b);
  if (decodedResponse['success']==true){
  // print("trueeee $b");
   final recommendedBooksModel = recommendedBooksModelFromJson(b);
  //print("Raw ${recommendedBooksModel}");
  // print(recommendedBooksModel.data.books);
   recomendedBooks.value = recommendedBooksModel.data.books;
  recBooksLoading.value=false;
  }
  else if (decodedResponse['success']==false){
   print("false");
  recBooksLoading.value=false;
  print("elif ${decodedResponse}");
  //Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
  else{
  recBooksLoading.value=false;
  print("el ${decodedResponse}");
  // Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
  }).catchError((e){
  recBooksLoading.value=false;
print("catch ${e}");

  // Get.snackbar("Something Happened", "$e",duration: const Duration(seconds: 5),
   //     colorText: Colors.white);
  });
 }



 ///All books by Pagination
// Paginated
var currentPage = 1.obs;
var totalPages = 0.obs;
var totalItems = 0.obs;
var limit = 20;
 var hasMoreData = true.obs;

var allBooks = <Item>[].obs;
var allbooksLoading = false.obs;

Future getAllBooks({required bool refresh,String endpoint = "get-books-user?q="}) async{
 if (refresh) {
  currentPage.value = 1;
  allBooks.clear();
  hasMoreData.value = true;
 }
 if(allbooksLoading.value){return;}
 allbooksLoading.value=true;
 await BooksApiClient().makeGetRequest(endpoint).then((b){
  var decodedResponse = jsonDecode(b);
  if (decodedResponse['success']==true){
   //print(allBooksModelFromJson(b));
   final allBooksModel = allBooksModelFromJson(b);
   allBooks.value = allBooksModel.data.items;
   totalPages.value = allBooksModel.data.totalPages;
   totalItems.value = allBooksModel.data.total;
   hasMoreData.value = currentPage.value < totalPages.value;

   allbooksLoading.value=false;
  }
  else if (decodedResponse['success']==false){
   allbooksLoading.value=false;
   print(decodedResponse);
   //Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
  else{
   allbooksLoading.value=false;
   print(decodedResponse);
   // Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
 }).catchError((e){
  allbooksLoading.value=false;
  print("catch $e");
  // Get.snackbar("Something Happened", "$e",duration: const Duration(seconds: 5),
  //     colorText: Colors.white);
 });
}



//Search
 var searchQuery = ''.obs;
 searchBooks()  {
  getAllBooks(refresh: true, endpoint: "get-books-user?q=${searchQuery.value}");
 }



 

 var isLoadingMore = false.obs;
 //Load More books
loadMore() async{
 if (isLoadingMore.value || !hasMoreData.value || allbooksLoading.value) {
  return;
 }
 isLoadingMore.value = true;
 currentPage.value++;

 await BooksApiClient().makeGetRequest("get-books-user?q=${searchQuery.value}&page=${currentPage.value}").then((b){
  var decodedResponse = jsonDecode(b);
  if (decodedResponse['success']==true){
   //print(allBooksModelFromJson(b));
   final allBooksModel = allBooksModelFromJson(b);
   allBooks.addAll(allBooksModel.data.items);
   totalPages.value = allBooksModel.data.totalPages;
   totalItems.value = allBooksModel.data.total;
   hasMoreData.value = currentPage.value < totalPages.value;

   isLoadingMore.value=false;
  }
  else if (decodedResponse['success']==false){
   currentPage.value--;
   isLoadingMore.value=false;
   print(decodedResponse);
   //Get.snackbar("Oops!", "${decodedResponse['message']}",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
  else{
   isLoadingMore.value=false;
   currentPage.value--;
   print(decodedResponse);
   // Get.snackbar("Oops!", "We are experiencing a downtime. Please try again",duration: const Duration(seconds: 5),colorText: Colors.white,);
  }
 }).catchError((e){
  currentPage.value--;
  isLoadingMore.value=false;
  print("catch $e");
 });
}




//END
}

