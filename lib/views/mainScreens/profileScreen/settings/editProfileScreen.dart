import 'package:fitrees_customer/controllers/apiController/userAuthentication.dart';
import 'package:fitrees_customer/controllers/screensControllers/editProfileScreenController.dart';
import 'package:fitrees_customer/modules/emailValidator.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editProfileScreen extends StatelessWidget {
  const editProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(editProfileScreenController());
    controller.firstNameTextController.text = userData.firstName!;
    controller.lastNameTextController.text =
        userData.lastName! == "User" ? "" : userData.lastName!;
    controller.emailTextController.text =
        "${userData.email == "user@example.com" ? "Update Email" : userData.email}";
    controller.heightTextController.text = userData.height.toString();
    controller.weightTextController.text = userData.weight.toString();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: SizedBox(
              height: deviceHeight - 20,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          "EDIT PROFILE",
                          style: TextStyle(
                              fontFamily: "integralcf",
                              color: textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            backgroundColor: backgroundColor,
                            radius: 60,
                            backgroundImage: NetworkImage(
                              userData.profileImageUrl!,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -10,
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: RawMaterialButton(
                                onPressed: () {
                                  controller.pickImageFromGallery();
                                  // controller.selectedImage != null ? Image.file(controller.selectedImage!) : ,
                                },
                                elevation: 0,
                                fillColor: lightGreyColor,
                                padding: EdgeInsets.all(10),
                                shape: CircleBorder(),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/icons/camera.svg",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //First Name
                    const horizontalDivider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "First Name",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: lemonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: deviceWidth - 80,
                      child: TextFormField(
                        controller: controller.firstNameTextController,
                        // focusNode: controller.focusNode,
                        cursorHeight: 20,
                        dragStartBehavior: DragStartBehavior.down,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        cursorColor: Colors.white,
                        cursorOpacityAnimates: true,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        showCursor: true,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onTapOutside: (_) {
                          // controller.focusNode.unfocus();
                        },
                        validator: (fName) {
                          if (fName!.isEmpty) {
                            return "Enter valid first name";
                          }
                          return null;
                        },
                      ),
                    ),

                    //Last Name
                    const horizontalDivider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Last Name",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: lemonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: deviceWidth - 80,
                      child: TextFormField(
                        controller: controller.lastNameTextController,
                        // focusNode: controller.focusNode,
                        cursorHeight: 20,
                        dragStartBehavior: DragStartBehavior.down,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        cursorColor: Colors.white,
                        cursorOpacityAnimates: true,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        showCursor: true,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onTapOutside: (_) {
                          // controller.focusNode.unfocus();
                        },
                        validator: (lName) {
                          if (lName!.isEmpty) {
                            return "Enter valid last name";
                          }
                          return null;
                        },
                      ),
                    ),

                    //Email
                    const horizontalDivider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Email",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: lemonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: deviceWidth - 80,
                      child: TextFormField(
                        controller: controller.emailTextController,
                        // focusNode: controller.focusNode,
                        cursorHeight: 20,
                        dragStartBehavior: DragStartBehavior.down,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: userData.email == "user@example.com"
                              ? "Update email"
                              : userData.email,
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 20,
                            height: 1.3,
                            color: Colors.white24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        cursorColor: Colors.white,
                        cursorOpacityAnimates: true,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        showCursor: true,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onTapOutside: (_) {
                          // controller.focusNode.unfocus();
                        },
                        validator: (email) {
                          if (email!.isEmpty || !isValidEmail(email)) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                      ),
                    ),

                    //Height
                    const horizontalDivider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Height",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: lemonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: deviceWidth - 80,
                      child: TextFormField(
                        controller: controller.heightTextController,
                        cursorHeight: 20,
                        dragStartBehavior: DragStartBehavior.down,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          suffixText: "cm",
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 20,
                            height: 1.3,
                            color: Colors.white24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        cursorColor: Colors.white,
                        cursorOpacityAnimates: true,
                        cursorWidth: 1,
                        keyboardType: TextInputType.number,
                        showCursor: true,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        validator: (height) {
                          if (height!.isEmpty || double.parse(height)<90 || double.parse(height)>250) {
                            return "Enter valid height";
                          }
                          return null;
                        },
                      ),
                    ),

                    //Weight
                    const horizontalDivider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Weight",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: lemonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: deviceWidth - 80,
                      child: TextFormField(
                        controller: controller.weightTextController,
                        // focusNode: controller.focusNode,
                        cursorHeight: 20,
                        dragStartBehavior: DragStartBehavior.down,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          suffixText: "Kg",
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 20,
                            height: 1.3,
                            color: Colors.white24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        cursorColor: Colors.white,
                        cursorOpacityAnimates: true,
                        cursorWidth: 1,
                        keyboardType: TextInputType.number,
                        showCursor: true,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onTapOutside: (_) {
                          // controller.focusNode.unfocus();
                        },
                        validator: (weight) {
                          if (weight!.isEmpty || double.parse(weight) < 10 || double.parse(weight) > 250) {
                            return "Enter valid weight";
                          }
                          return null;
                        },
                      ),
                    ),

                    const horizontalDivider(),

                    const Spacer(),
                    SizedBox(
                      width: deviceWidth - 100,
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(48),
                        color: primaryColor,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if(_formKey.currentState!.validate()){
                            controller.updateData();
                          }
                        },
                        padding: EdgeInsets.zero,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          child: Text(
                            "Save",
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
