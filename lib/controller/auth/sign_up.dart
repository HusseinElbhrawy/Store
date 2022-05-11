import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';

class SignupController extends GetxController {
  Future registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      log(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        kErrorSnackBar(e.message.toString());
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        kErrorSnackBar(e.message.toString());
        log('The account already exists for that email.');
      } else {
        kErrorSnackBar(e.message.toString());
        log(e.message.toString());
      }
    } catch (e) {
      kErrorSnackBar(e.toString());

      log(e.toString());
    }
  }
}
