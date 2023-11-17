import 'dart:io';
import 'package:fitrees_customer/controllers/apiController/userAuthentication.dart';
import 'package:fitrees_customer/modules/emailValidator.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editProfileScreenController extends GetxController {
  RegExp emailRegExp =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();

  void updateData() async {
    String newFirstName = firstNameTextController.text.trim();
    String newLastName = lastNameTextController.text.trim();
    String newEmail = emailTextController.text.trim();

    final Map<String, dynamic> profileData = {};

    if (newFirstName.isNotEmpty && newFirstName != userData.firstName) {
      profileData["firstName"] = newFirstName;
    }

    if (newLastName.isNotEmpty && newLastName != userData.lastName) {
      profileData["lastName"] = newLastName;
    }

    if (newEmail.isNotEmpty &&
        newEmail != userData.email &&
        isValidEmail(newEmail)) {
      profileData["email"] = newEmail;
    }

    profileData["height"] = int.parse(heightTextController.text);
    profileData["weight"] = double.parse(weightTextController.text);

    final Map<String, dynamic> requestBody = {
      "profile": profileData,
    };

    if (await updateUserData(requestBody)) {
      if (newFirstName.isNotEmpty && newFirstName != userData.firstName) {
        userData.firstName = newFirstName;
      }
      if (newLastName.isNotEmpty && newLastName != userData.lastName) {
        userData.lastName = newLastName;
      }
      if (newEmail.isNotEmpty && newEmail != userData.email) {
        userData.email = newEmail;
      }
      userData.height = int.parse(heightTextController.text);
      userData.weight = double.parse(weightTextController.text);
      Get.back();
      Get.snackbar("Updated", "Details successfully updated!");
    } else {
      Get.snackbar("Error", 'Some error occurred! Try again later.');
    }
  }

  File? selectedImage;

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    returnedImage != null
        ? cropImage(returnedImage.path)
        : print("Nothing selected");
  }

  Future cropImage(path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      compressQuality: 50,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
          backgroundColor: backgroundColor,
          statusBarColor: primaryColor,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    croppedFile != null ? print(croppedFile.path) : print("Did not cropped");
  }
}
