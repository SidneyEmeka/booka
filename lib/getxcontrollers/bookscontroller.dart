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
  //print(decodedResponse);
  final recommendedBooksModel = recommendedBooksModelFromJson(b);
  recomendedBooks.value = recommendedBooksModel.data.books;
  recBooksLoading.value=false;
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




 ///All books by Pagination


var isLoadingMore = false.obs;

// Paginated
var currentPage = 1.obs;
var totalPages = 0.obs;
var totalItems = 0.obs;
var limit = 20;
 var hasMoreData = true.obs;

var allBooks = <Item>[].obs;
var allbooksLoading = false.obs;

Future getAllBooks({required bool refresh}) async{
 if (refresh) {
  currentPage.value = 1;
  allBooks.clear();
  hasMoreData.value = true;
 }
 if(allbooksLoading.value){return;}
 allbooksLoading.value=true;
 await BooksApiClient().makeGetRequest("get-books-user").then((b){
  var decodedResponse = jsonDecode(b);
  if (decodedResponse['success']==true){
   //print(decodedResponse);
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


  // Get.snackbar("Something Happened", "$e",duration: const Duration(seconds: 5),
  //     colorText: Colors.white);
 });
}



//Search
 var searchQuery = ''.obs;
var searchResults = <SearchedItem>[].obs;
 searchBooks(String authorOrTitle) async {
  if(allbooksLoading.value){return;}
  allbooksLoading.value=true;
  await BooksApiClient().makeGetRequest("get-books-user?q=$authorOrTitle").then((b){
   var decodedResponse = jsonDecode(b);
   if (decodedResponse['success']==true){
    //print(decodedResponse);
    final searchedBooksModel = searchedBooksModelFromJson(b);
    searchResults.value = searchedBooksModel.data.items;
    stotalPages.value = searchedBooksModel.data.totalPages;
    stotalItems.value = searchedBooksModel.data.total;
    shasMoreData.value = scurrentPage.value < stotalPages.value;

    allbooksLoading.value=false;
   }
   else if (decodedResponse['success']==false){
    allbooksLoading.value=false;
    print(decodedResponse);
    searchResults.clear();   }
   else{
    allbooksLoading.value=false;
    print(decodedResponse);
    searchResults.clear();
   }
  }).catchError((e){
   allbooksLoading.value=false;
   searchResults.clear();
  });
 }


//END
}



https://api.example.com/books?page=2&limit=10&search=harry
↑
Query parameters start here


//
//
//
// class BookController extends GetxController {
//
//  var errorMessage = ''.obs;
//  // Search
//  var searchQuery = ''.obs;
//
//  @override
//  void onInit() {
//   super.onInit();
//   fetchBooks();
//
//   // Debounce search
//   debounce(
//    searchQuery,
//        (_) => searchBooks(),
//    time: Duration(milliseconds: 500),
//   );
//  }
//
//  // Initial fetch
//  Future<void> fetchBooks({bool refresh = false}) async {
//   if (refresh) {
//    currentPage.value = 1;
//    books.clear();
//    hasMoreData.value = true;
//    errorMessage.value = '';
//   }
//
//   if (isLoading.value) return;
//
//   isLoading.value = true;
//   errorMessage.value = '';
//
//   try {
//    final response = await _apiService.getBooks(
//     page: currentPage.value,
//     limit: limit,
//     search: searchQuery.value.isEmpty ? null : searchQuery.value,
//    );
//
//    books.value = response.books;
//    totalPages.value = response.totalPages;
//    totalItems.value = response.totalItems;
//
//    // Check if there's more data
//    hasMoreData.value = currentPage.value < totalPages.value;
//
//   } catch (e) {
//    errorMessage.value = 'Failed to load books: $e';
//    Get.snackbar(
//     'Error',
//     errorMessage.value,
//     snackPosition: SnackPosition.BOTTOM,
//    );
//   } finally {
//    isLoading.value = false;
//   }
//  }
//
//  // Load more (infinite scroll)
//  Future<void> loadMore() async {
//   // Prevent multiple simultaneous requests
//   if (isLoadingMore.value || !hasMoreData.value || isLoading.value) {
//    return;
//   }
//
//   isLoadingMore.value = true;
//   currentPage.value++;
//
//   try {
//    final response = await _apiService.getBooks(
//     page: currentPage.value,
//     limit: limit,
//     search: searchQuery.value.isEmpty ? null : searchQuery.value,
//    );
//
//    // Add new books to existing list
//    books.addAll(response.books);
//    totalPages.value = response.totalPages;
//    totalItems.value = response.totalItems;
//
//    // Check if there's more data
//    hasMoreData.value = currentPage.value < totalPages.value;
//
//    if (!hasMoreData.value) {
//     Get.snackbar(
//      'End of List',
//      'No more books to load',
//      snackPosition: SnackPosition.BOTTOM,
//      duration: Duration(seconds: 2),
//     );
//    }
//
//   } catch (e) {
//    currentPage.value--; // Revert on error
//    errorMessage.value = 'Failed to load more: $e';
//    Get.snackbar(
//     'Error',
//     errorMessage.value,
//     snackPosition: SnackPosition.BOTTOM,
//    );
//   } finally {
//    isLoadingMore.value = false;
//   }
//  }
//
//  // Search
//  void searchBooks() {
//   currentPage.value = 1;
//   fetchBooks(refresh: true);
//  }
//
//
// }