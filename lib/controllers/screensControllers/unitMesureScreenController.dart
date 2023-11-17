import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class unitMesureScreenController extends GetxController{

  DropListModel heightItemsList = DropListModel([
    OptionItem(title: "Centimeters (Cms)"),
    OptionItem(title: "Meters (m)"),
    OptionItem(title: "Inches (In)"),
  ]);
  var heightItemSelected = OptionItem(title: "Centimeters (Cms)").obs;

  DropListModel weightItemsList = DropListModel([
    OptionItem(title: "Kilogram (Kg)"),
    OptionItem(title: "Gram (g)"),
    OptionItem(title: "Lbs"),
  ]);
  var weightItemSelected = OptionItem(title: "Kilogram (Kg)").obs;

  DropListModel temperatureItemsList = DropListModel([
    OptionItem(title: "Fahrenheit (f°)"),
    OptionItem(title: "Celcius (c°)"),
  ]);
  var temperatureItemSelected = OptionItem(title: "Fahrenheit (f°)").obs;

  DropListModel deviceItemsList = DropListModel([
    OptionItem(title: "Thermometer"),
    OptionItem(title: "Glucometer"),
    OptionItem(title: "BP Monitor"),
    OptionItem(title: "Oximeter"),
  ]);
  var deviceItemSelected = OptionItem(title: "Thermometer").obs;
}