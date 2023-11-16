import 'package:fitrees_customer/views/mainScreens/profileScreen/settings/notificationsScreen.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/settings/unitMesureScreen.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/settings/contactUsScreen.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/settings/languageScreen.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/settings/privacyPolicyScreen.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/settings/editProfileScreen.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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
                        padding: const EdgeInsets.all(10),
                        shape: const CircleBorder(),
                        child: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "SETTINGS",
                      style: TextStyle(
                          fontFamily: "integralcf",
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 40,)
                  ],
                ),
                const SizedBox(height: 30),

                //Edit Profile
                const horizontalDivider(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Get.to(editProfileScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit Profile",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const horizontalDivider(),

                //Units of Measure
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: ()=>Get.to(unitMesureScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Units of Measure",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const horizontalDivider(),

                //Notifications
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: ()=>Get.to(appNotificationScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notifications",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const horizontalDivider(),

                //Language
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: ()=> Get.to(languageScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Language",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const horizontalDivider(),

                //Privacy Policy
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Get.to(const privacyPolicyScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Privacy Policy",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const horizontalDivider(),

                //Contact Us
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: ()=>Get.to(contactUsScreen()),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact Us",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const horizontalDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
