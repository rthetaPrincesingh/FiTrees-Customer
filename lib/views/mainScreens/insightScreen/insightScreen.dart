import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:fitrees_customer/controllers/screensControllers/insightScreenController.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

class insightScreen extends StatelessWidget {
  const insightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final controller = Get.put(insightScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Raise Enquiry",
                  style: TextStyle(
                      fontFamily: "integralcf",
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                const horizontalDivider(),

                //User Type
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Type",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected: controller.selectedUserType.value,
                          dropListModel: controller.userType,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 95,
                          borderColor: lightGreyColor,
                          textColorTitle: primaryColor,
                          textColorItem: Colors.black,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.selectedUserType.value = optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const horizontalDivider(),

                //Company
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Company",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected: controller.selectedCompanyList.value,
                          dropListModel: controller.companyList,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 130,
                          borderColor: lightGreyColor,
                          textColorTitle: primaryColor,
                          textColorItem: Colors.black,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.selectedCompanyList.value = optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const horizontalDivider(),

                //Branch
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Branch",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected: controller.selectedBranchList.value,
                          dropListModel: controller.branchList,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 130,
                          borderColor: lightGreyColor,
                          textColorTitle: primaryColor,
                          textColorItem: Colors.black,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.selectedBranchList.value = optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const horizontalDivider(),

                //Text Field
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: deviceWidth,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      width: 1,
                      color: lightGreyColor,
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: controller.queryText,
                      maxLines: 8,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 15, bottom: 12, top: 12, right: 15),
                        hintText: "Write your query here...",
                        hintStyle: TextStyle(
                            color: textColor.withOpacity(0.3), fontSize: 16),
                      ),
                      onFieldSubmitted: (_)=>FocusManager.instance.primaryFocus?.unfocus(),
                      onTapOutside:(_)=> FocusManager.instance.primaryFocus?.unfocus(),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your query first\n\n\n\n\n\n";
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: SizedBox(
                    width: deviceWidth - 100,
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(48),
                      color: primaryColor,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if(_formKey.currentState!.validate()){
                          controller.sendEnquiry(context);
                        }
                      },
                      padding: EdgeInsets.zero,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        child: Text(
                          "Send Enquiry",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
