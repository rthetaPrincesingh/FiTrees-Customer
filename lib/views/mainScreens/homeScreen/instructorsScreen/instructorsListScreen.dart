import 'package:fitrees_customer/themes.dart';
import 'package:fitrees_customer/views/mainScreens/homeScreen/instructorsScreen/trainerDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class instructorsListScreen extends StatelessWidget {
  const instructorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    "FITNESS TRAINERS",
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
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: ()=> Get.to(trainerDetailsScreen()),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8,),
                        child: Container(
                          height: 120,
                          width: deviceWidth - 40,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.transparent,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        "https://img.freepik.com/free-photo/young-attractive-woman-exercising-with-dumbbells-gym_1303-22571.jpg",
                                        fit: BoxFit.cover,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Richard Will", style: GoogleFonts.openSans(fontSize: 20, color: textColor, fontWeight: FontWeight.w600),),
                                        const SizedBox(width: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                            child: Text("4.5", style: GoogleFonts.openSans(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text("High Intensity Training", style: GoogleFonts.openSans(fontSize: 14, color: textColor, fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 10),
                                    Text("5 years experience", style: GoogleFonts.openSans(fontSize: 14, color: primaryColor, fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                const Spacer(),
                                Icon(Icons.arrow_forward_ios_rounded, color: textColor, size: 20,),
                                const SizedBox(width: 10,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
