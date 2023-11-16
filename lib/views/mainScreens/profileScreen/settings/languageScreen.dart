import 'package:fitrees_customer/controllers/languageScreenController.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class languageScreen extends StatelessWidget {
  const languageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(languageScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: deviceHeight - 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: RawMaterialButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          fillColor: lightGreyColor,
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: Colors.white, size: 20),
                        ),
                      ),
                      Text(
                        "LANGUAGE",
                        style: TextStyle(
                            fontFamily: "integralcf",
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 40)
                    ],
                  ),
                  const SizedBox(height: 30),

                  //Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: controller.searchTextController,
                              onChanged: (name) {
                                controller.searchList(name);
                                controller.isTextBoxEmpty.value = name.isEmpty;
                              },
                              onTapOutside: (e){FocusManager.instance.primaryFocus?.unfocus();},
                              decoration: InputDecoration(
                                icon: SvgPicture.asset(
                                  "assets/icons/search.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: const Color(0xff505050),
                                    decoration: TextDecoration.none),
                              ),
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: textColor,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(() {
                        return Visibility(
                          visible: !controller.isTextBoxEmpty.value,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              controller.searchedList.clear();
                              controller.searchTextController.clear();
                              },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.clear_rounded,
                                    color: backgroundColor, size: 15),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Language List
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: controller.searchedList.isEmpty
                            ? controller.languagesList.length
                            : controller.searchedList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              controller.selectedLanguage.value =
                                  (controller.searchedList.isEmpty
                                      ? controller.languagesList[index]
                                      : controller.searchedList[index]);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const horizontalDivider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Text(
                                        controller.searchedList.isEmpty
                                            ? controller.languagesList[index]
                                            : controller.searchedList[index],
                                        style: GoogleFonts.openSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: textColor),
                                      ),
                                    ),
                                    Obx(() {
                                      return Visibility(
                                        visible:
                                            controller.selectedLanguage.value ==
                                                (controller.searchedList.isEmpty
                                                    ? controller
                                                        .languagesList[index]
                                                    : controller
                                                        .searchedList[index]),
                                        child: Icon(Icons.check_box_rounded,
                                            color: primaryColor),
                                      );
                                    })
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
