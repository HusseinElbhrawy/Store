import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app/views/screens/login/login.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';
import 'package:store_app/views/widgets/snackbar/success_snackbar.dart';

class ForgetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController resetPasswordController = TextEditingController();

  void reset() async {
    Get.focusScope!.unfocus();

    if (formKey.currentState!.validate()) {
      _resetPassword();
    }
  }

  Future _resetPassword() async {
    isLoading.value = true;
    try {
      log(resetPasswordController.text.toString());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPasswordController.text.trim());
      resetPasswordController.clear();
      isLoading.value = false;
      kSuccesssSnackBar('Please , Check you email');
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.offAllNamed(LoginScreen.routeName);
        },
      );
    } on FirebaseAuthException catch (e) {
      kErrorSnackBar(e.message.toString());
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
      kErrorSnackBar(e.toString());
      isLoading.value = false;
    }
  }
}
