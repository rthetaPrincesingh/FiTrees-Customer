import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class contactUsScreen extends StatelessWidget {
  const contactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: deviceHeight - 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        "CONTACT US",
                        style: TextStyle(
                            fontFamily: "integralcf",
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 30),
                    child: Container(
                      width: deviceWidth - 20,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                          stops: [0.25, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                            image: NetworkImage(
                              "https://skipfusion.com/wp-content/uploads/2021/05/banner_contact_us_1.jpg",
                            ),
                            opacity: 0.6),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth - 40,
                    child: Text(
                      "If you have any enquiries get in touch with us. We'll be happy to help!",
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.openSans(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  //Phone Number
                  const horizontalDivider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CONTACT",
                          style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: deviceWidth - 60,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.headphonesSimple, color: primaryColor,),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "+91 9876543210",
                                          style: GoogleFonts.openSans(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Phone",
                                          style: GoogleFonts.openSans(
                                            color: textColor.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(indent: 0, endIndent: 20, color: lightGreyColor, thickness: 2, height: 30),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.envelopeOpenText, color: primaryColor,),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "contact@fitrees.com",
                                          style: GoogleFonts.openSans(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Email",
                                          style: GoogleFonts.openSans(
                                            color: textColor.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Social Media
                  const horizontalDivider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SOCIAL MEDIA",
                          style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: deviceWidth - 60,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.instagram, color: primaryColor,),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "@fitreesOfficial",
                                          style: GoogleFonts.openSans(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Instagram",
                                          style: GoogleFonts.openSans(
                                            color: textColor.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(indent: 0, endIndent: 20, color: lightGreyColor, thickness: 2, height: 30),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.facebook, color: primaryColor,),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "@fitreesOfficial",
                                          style: GoogleFonts.openSans(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Facebook",
                                          style: GoogleFonts.openSans(
                                            color: textColor.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(indent: 0, endIndent: 20, color: lightGreyColor, thickness: 2, height: 30),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.twitter, color: primaryColor,),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "@fitreesOfficial",
                                          style: GoogleFonts.openSans(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Twitter",
                                          style: GoogleFonts.openSans(
                                            color: textColor.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(indent: 0, endIndent: 20, color: lightGreyColor, thickness: 2, height: 30),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.youtube, color: primaryColor,),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "@fitreesOfficial",
                                          style: GoogleFonts.openSans(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Youtube",
                                          style: GoogleFonts.openSans(
                                            color: textColor.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
