import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController kErrorSnackBar(String errorMessage) {
  return Get.snackbar(
    'Error',
    errorMessage,
    colorText: Colors.black,
    backgroundColor: Colors.red.shade400,
  );
}
