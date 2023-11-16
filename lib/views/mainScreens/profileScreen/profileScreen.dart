import 'package:fitrees_customer/views/mainScreens/subscriptionScreen/subscriptionScreen.dart';
import 'package:fitrees_customer/controllers/authentication/userAuthentication.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/settingScreen.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                width: deviceWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.0, 01],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                        "https://img.freepik.com/premium-photo/contemporary-spotless-fitness-gym-center-interiorgenerative-ai_391052-10889.jpg",
                      ),
                      opacity: 0.35),
                ),
              ),

              // Setting Gear
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Get.to(const settingScreen()),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FaIcon(
                        FontAwesomeIcons.gear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              //Circular Avatar
              Positioned.fill(
                bottom: -35,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    focusColor: Colors.transparent,
                    padding: const EdgeInsets.all(10),
                    shape: CircleBorder(
                      side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: lightGreyColor,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: backgroundColor,
                      radius: 50,
                      backgroundImage: NetworkImage(
                        userData.profileImageUrl!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SizedBox(
              height: deviceHeight - 335,
              child: Column(
                children: [
                  Text(
                    "${userData.firstName} ${userData.lastName}",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      fontFamily: "integralcf",
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: (deviceWidth - 65) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "50 Kg",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Current\nWeight",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: textColor.withOpacity(0.3),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: textColor.withOpacity(0.3),
                            ),
                            SizedBox(
                              width: (deviceWidth - 65) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "183 Cm",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Current\nHeight",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: textColor.withOpacity(0.3),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: textColor.withOpacity(0.3),
                            ),
                            SizedBox(
                              width: (deviceWidth - 65) / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "90 Days",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Premium\nLeft",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: textColor.withOpacity(0.3),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  //Premium Container
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Get.to(const subscriptionScreen()),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: redColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Text(" PRO ",
                                          style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Upgrade to Premium",
                                    style: GoogleFonts.openSans(
                                        color: textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "This subscription is auto-renewable",
                                    style: GoogleFonts.openSans(
                                        color: textColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: textColor,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const horizontalDivider(),

                  //Sign Out
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => signOut(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 5, bottom: 15, top: 15),
                      child: Text(
                        "Sign Out",
                        style: GoogleFonts.openSans(
                          color: redColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const horizontalDivider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
