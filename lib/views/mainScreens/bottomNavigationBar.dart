import 'package:fitrees_customer/controllers/apiController/userAuthentication.dart';
import 'package:fitrees_customer/controllers/screensControllers/navigationBarController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(navigationBarController());
    return Obx(
      () => Scaffold(
        backgroundColor: backgroundColor,
        body: controller.screensList[controller.screenSelected.value],
        bottomNavigationBar: Container(
          height: 80,
          width: deviceWidth,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border(
                top: BorderSide(
                  color: lightGreyColor,
                  width: 1,
                ),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.screenSelected.value = 0,
                child: SizedBox(
                  width: (deviceWidth - 50) / 5,
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    height: 25,
                    width: 25,
                    color: controller.screenSelected.value == 0
                        ? Colors.white
                        : lightGreyColor,
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.screenSelected.value = 1,
                child: SizedBox(
                  width: (deviceWidth - 50) / 5,
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                    height: 25,
                    width: 25,
                    color: controller.screenSelected.value == 1
                        ? Colors.white
                        : lightGreyColor,
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.screenSelected.value = 2,
                child: SizedBox(
                  width: (deviceWidth - 50) / 5,
                  child: SvgPicture.asset(
                    "assets/icons/insight.svg",
                    height: 25,
                    width: 25,
                    color: controller.screenSelected.value == 2
                        ? Colors.white
                        : lightGreyColor,
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.screenSelected.value = 3,
                child: SizedBox(
                  width: (deviceWidth - 50) / 5,
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    height: 25,
                    width: 25,
                    color: controller.screenSelected.value == 3
                        ? Colors.white
                        : lightGreyColor,
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () => controller.screenSelected.value = 4,
                elevation: 2.0,
                focusColor: Colors.transparent,
                padding: const EdgeInsets.all(8),
                shape: CircleBorder(
                  side: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: lightGreyColor,
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: backgroundColor,
                  backgroundImage: NetworkImage(
                    userData.profileImageUrl!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
