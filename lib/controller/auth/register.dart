import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/widgets/dialog_item_widget.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';

class SignupController extends GetxController {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  void _pickedImage({required ImageSource src}) async {
    final image = await _picker.pickImage(source: src);
    if (image != null) {
      imageFile = File(image.path);
      Get.back();
      update();
    } else {
      Get.back();
      kErrorSnackBar('Please , select image');
    }
  }

  void _removeImage() {
    if (imageFile != null) {
      imageFile!.delete();
      imageFile = null;
      Get.back();
    } else {
      Get.back();
      kErrorSnackBar('There are no image to remove it');
    }

    update();
  }

  void chooseImage() async {
    await Get.dialog(
      AlertDialog(
        title: Text(
          'Choose Option',
          style: TextStyle(
            color: ConstColors.starterColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogItemWidget(
              onTap: () async {
                _pickedImage(
                  src: ImageSource.camera,
                );
              },
              icon: Icons.camera,
              title: 'Camera',
              color: ConstColors.starterColor,
            ),
            DialogItemWidget(
              onTap: () {
                _pickedImage(
                  src: ImageSource.gallery,
                );
              },
              icon: Icons.photo_library_outlined,
              title: 'Gallery',
              color: ConstColors.starterColor,
            ),
            DialogItemWidget(
              onTap: () {
                _removeImage();
              },
              icon: Icons.clear,
              title: 'Remove',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

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
