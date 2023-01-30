import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'validation_checks.dart';

class PayCalculator extends GetxController {
  var numberOfHours = TextEditingController().obs;
  var hourlyRate = TextEditingController().obs;
  RxDouble regularPay = RxDouble(0.0);
  RxDouble overtimePay = RxDouble(0.0);
  RxDouble totalPay = RxDouble(0.0);
  RxDouble tax = RxDouble(0.0);
  RxBool calculationFinished = false.obs;

  calculation() {
    if (validateInput()) {
      calculationFinished.value = false;
      if (double.parse(numberOfHours.value.text) <= 40) {
        totalPay.value = double.parse(numberOfHours.value.text) *
            double.parse(hourlyRate.value.text);
        regularPay.value = totalPay.value;
      } else {
        totalPay.value = (double.parse(numberOfHours.value.text) - 40) *
                double.parse(hourlyRate.value.text) *
                1.5 +
            40 * double.parse(hourlyRate.value.text);
      }
      overtimePay.value = totalPay.value - regularPay.value;
      tax.value = totalPay.value * 0.18;
      calculationFinished.value = true;
    }
  }

  bool validateInput() {
    if (numberOfHours.value.text.trim().isEmpty) {
      ValidationChecks.displayAlertMessage("Enter Number of Hours");
      return false;
    } else if (hourlyRate.value.text.trim().isEmpty) {
      ValidationChecks.displayAlertMessage("Enter Hourly Rate");
      return false;
    } else {
      return true;
    }
  }
}
