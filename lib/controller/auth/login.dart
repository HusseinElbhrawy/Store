import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/middleware/get_storage_middle_ware.dart';
import 'package:store_app/views/screens/main_screen.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordConroller = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFoucsNode = FocusNode();
  RxBool isLoading = false.obs;
  final GetStorageMiddleWare _middleWare = GetStorageMiddleWare();
  late final bool isLogin = _middleWare.getValue(key: 'isLogin') ?? false;
  bool isPasswordHidden = true;
  UserCredential? authResult;
  void updatePasswordStatus() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  void disposeAllControllers() {
    emailController.dispose();
    passwordConroller.dispose();
    emailFocusNode.dispose();
    passwordFoucsNode.dispose();
  }

  Future _signinWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      log(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        kErrorSnackBar(e.message.toString());
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        kErrorSnackBar(e.message.toString());
        throw 'Wrong password provided for that user.';
      } else {
        kErrorSnackBar(e.message.toString());
        throw e.message.toString();
      }
    } catch (e) {
      log(e.toString());
      kErrorSnackBar(e.toString());
    }
  }

  void login() async {
    Get.focusScope!.unfocus();
    if (formkey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await _signinWithEmailAndPassword(
          emailAddress: emailController.text.trim(),
          password: passwordConroller.text.trim(),
        );
        _middleWare.setValue(status: true, key: 'isLogin');
        isLoading.value = false;
        Get.offAllNamed(MainScreen.routeName);
      } catch (e) {
        isLoading.value = false;
      }
    }
  }

  Future signInWithGoogle() async {
    isLoading.value = true;
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          authResult = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          _middleWare.setValue(status: true, key: 'isLogin');
          isLoading.value = false;
          Get.offAllNamed(MainScreen.routeName);
        } catch (error) {
          log(error.toString());
          isLoading.value = false;
        }
      }
    } else {
      kErrorSnackBar('No Account selected');
      authResult = null;
    }
    isLoading.value = false;
    return authResult;
  }

  @override
  void onClose() {
    disposeAllControllers();
    super.onClose();
  }

  @override
  void dispose() {
    disposeAllControllers();
    super.dispose();
  }
}
