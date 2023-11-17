import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:fitrees_customer/controllers/apiController/enquiryApi.dart';
import 'package:fitrees_customer/controllers/apiController/userAuthentication.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class insightScreenController extends GetxController {
  DropListModel userType = DropListModel([
    OptionItem(title: "New Visitor", id: "NewVisitor"),
    OptionItem(title: "Other", id: "Other"),
  ]);
  var selectedUserType = OptionItem(title: "New Visitor", id: "NewVisitor").obs;

  DropListModel companyList = DropListModel([
    OptionItem(title: "Company 1", id: "65576cf8c8cabe10136ea81b"),
    OptionItem(title: "Company 2", id: "65576cf8c8cabe10136ea81c"),
    OptionItem(title: "Company 3", id: "65576cf8c8cabe10136ea81d"),
    OptionItem(title: "Company 4", id: "65576cf8c8cabe10136ea81e"),
    OptionItem(title: "Company 5", id: "65576cf8c8cabe10136ea81f"),
  ]);
  var selectedCompanyList =
      OptionItem(title: "Company 1", id: "65576cf8c8cabe10136ea81b").obs;

  DropListModel branchList = DropListModel([
    OptionItem(title: "Branch 1", id: "65576cf8c8cabe10136ea820"),
    OptionItem(title: "Branch 2", id: "65576cf8c8cabe10136ea821"),
    OptionItem(title: "Branch 3", id: "65576cf8c8cabe10136ea822"),
    OptionItem(title: "Branch 4", id: "65576cf8c8cabe10136ea823"),
    OptionItem(title: "Branch 5", id: "65576cf8c8cabe10136ea824"),
  ]);
  var selectedBranchList =
      OptionItem(title: "Branch 1", id: "65576cf8c8cabe10136ea820").obs;

  TextEditingController queryText = TextEditingController();

  sendEnquiry(context) async {
    var requestBody = [
      {
        "enquiryType": selectedUserType.value.id,
        "company": selectedCompanyList.value.id,
        "branch": selectedBranchList.value.id,
        "enquiry": queryText.text.trim(),
        "enquiryBy": userData.id,
        "isActive": true
      }
    ];

    if (await raiseEnquiry(requestBody)) {
      queryText.text = "";
      showCustomDialog(context);
    }
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            width: deviceWidth - 200,
            height: deviceWidth - 200,
            padding: const EdgeInsets.all(20.0),
            child: Lottie.asset("assets/animations/Success Animation.json",
                repeat: false, onLoaded: (_) {
              Future.delayed(Duration(seconds: 3), () {
                Get.back();
              });
            }),
          ),
        );
      },
    );
  }
}
