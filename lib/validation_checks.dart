import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationChecks {
  static displayAlertMessage(String message) {
    Get.snackbar(
      "Alert",
      message,
      colorText: Colors.black,
      backgroundColor: Colors.white60,
    );
  }
}
