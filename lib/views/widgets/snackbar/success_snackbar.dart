import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController kSuccesssSnackBar(String message) {
  return Get.snackbar(
    'Success',
    message,
    colorText: Colors.black,
    backgroundColor: Colors.green.shade200,
  );
}
