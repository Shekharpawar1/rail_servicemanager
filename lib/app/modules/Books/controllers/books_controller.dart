import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:serviceman/app/modules/Books/views/BookTypeDetails.dart';

import '../../../../utils/Constant.dart';
import '../views/bookTypes.dart';

class BooksController extends GetxController {
  //TODO: Implement BooksController
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchbyidController = TextEditingController();
  final count = 0.obs;


  RxBool isLoading=false.obs;
  var selectedValue1 = "".obs;
  RxList books= [].obs;
  RxList filteredbooks = [].obs;
  void selectValue1(String value) {
    selectedValue1.value = value;
    print("books================================${selectedValue1.value}");
  }

  Future<void> getbooks() async{
    print("books");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.book}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        books.value.assignAll(data['data']);
        filteredbooks.assignAll(books);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("books==============================${books.value}");
      }else{
        print("Failed to load a books");
      }
    }catch(e){
      print("Error in fatching books${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void filterbooks(String query) {
    if (query.isEmpty) {
      filteredbooks.assignAll(books);
    } else {
      filteredbooks.assignAll(books.where((book) {
        return book['department'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }


  RxList booksbyDep= [].obs;
  RxList filteredbooksbyDep = [].obs;
  Future<void> getbooksById(String Id) async{
    print("books");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.bookdep}/$Id'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        print("data==============================$data");
        booksbyDep.value.assignAll(data['data']);
        filteredbooksbyDep.assignAll(booksbyDep);
        isLoading.value=true;
        Get.to(BookTypes());
        update();
        print("data==============================$data");
        print("booksbyDep==============================${booksbyDep.value}");
        print("booksbyDep==============================${filteredbooksbyDep.value}");
      }else{
        print("Failed to load a booksbyDep");
      }
    }catch(e){
      print("Error in fatching booksbyDep${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void filterbooksbyDep(String query) {
    if (query.isEmpty) {
      filteredbooksbyDep.assignAll(booksbyDep);
    } else {
      filteredbooksbyDep.assignAll(booksbyDep.where((booksbyDep) {
        return booksbyDep['category'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  var selectedValue2 = "".obs;
  RxList booksbyIdDetial= [].obs;
  void selectValue2(String value) {
    selectedValue2.value = value;
    print("books================================${selectedValue2.value}");
  }

  Future<void> getbooksByIdDetial(String Id) async{
    print("books");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.bookform}/$Id'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        print("data==============================$data");
        booksbyIdDetial.value.assignAll(data['data']);

        isLoading.value=true;
        Get.to(BookTypeDetails());
        update();
        print("data==============================$data");
        print("booksbyDep==============================${booksbyDep.value}");
      }else{
        print("Failed to load a booksbyIdDetial");
      }
    }catch(e){
      print("Error in fatching booksbyIdDetial${e}");
    }finally{
      isLoading.value=false;
    }
  }
  @override
  void onInit() {
    super.onInit();
    getbooks();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
