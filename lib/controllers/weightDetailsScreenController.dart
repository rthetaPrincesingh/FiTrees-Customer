import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class weightDetailsScreenController extends GetxController {
  RxDouble selectedWeightDouble = 30.00.obs;
  TextEditingController weightText = TextEditingController();

  void validateAndAdjustWeight() {
    if (weightText.text.isEmpty) {
      // Handle empty input, e.g., show an error message.
      return;
    }

    final double enteredWeight = double.tryParse(weightText.text) ?? 0.0;

    if (enteredWeight < 10.0) {
      // Weight is below the minimum, set to 10.00
      selectedWeightDouble.value = 10.00;
      weightText.text = "10.00";
    } else if (enteredWeight > 250.0) {
      // Weight is above the maximum, set to 250.00
      selectedWeightDouble.value = 250.00;
      weightText.text = "250.00";
    } else {
      // Weight is within the valid range, set it to the entered value
      selectedWeightDouble.value = enteredWeight;
      weightText.text = enteredWeight.toStringAsFixed(2);
    }
  }
}
