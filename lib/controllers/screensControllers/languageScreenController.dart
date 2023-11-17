import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class languageScreenController extends GetxController{
  List<String> languagesList = [
    "English",
    "Chinese",
    "Spanish",
    "Hindi",
    "Arabic",
    "Bengali",
    "Portuguese",
    "Russian",
    "Japanese",
    "German",
    "French",
    "Urdu",
    "Korean",
    "Turkish",
    "Italian",
    "Dutch",
    "Polish",
    "Vietnamese",
    "Tamil",
    "Punjabi",
    "Cantonese",
    "Telugu",
    "Javanese",
    "Marathi",
    "Wu",
    "Kannada",
    "Malayalam",
    "Hausa",
    "Burmese",
  ];
  RxString selectedLanguage = "English".obs;
  TextEditingController searchTextController = TextEditingController();
  RxBool isTextBoxEmpty = true.obs;

  RxList<String> searchedList = [""].obs;

  searchList(String name){
    searchedList.clear();
    for(String language in languagesList){
      if (language.toLowerCase().contains(name.toLowerCase().trim())) {
        searchedList.add(language);
      }
    }

    print(searchedList);

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchedList.clear();
  }

}