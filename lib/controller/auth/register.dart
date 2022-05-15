import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/model/register_model.dart';
import 'package:store_app/views/screens/main_screen.dart';
import 'package:store_app/views/widgets/dialog_item_widget.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FocusNode fullNameFoucesNode = FocusNode();
  final FocusNode emailFoucesNode = FocusNode();
  final FocusNode passwordFoucesNode = FocusNode();
  final FocusNode phoneFoucesNode = FocusNode();

  void _disposeAllControllers() {
    fullNameController.dispose();
    fullNameFoucesNode.dispose();
    emailController.dispose();
    emailFoucesNode.dispose();
    passwordController.dispose();
    passwordFoucesNode.dispose();
    phoneFoucesNode.dispose();
    phoneController.dispose();
    update();
  }

  void changePasswordStatus() {
    isPassword = !isPassword;
    update();
  }

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

  get removeIamge => _removeImage();
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

  RegisterModel? registerModel;
  String? imageUrl;
  String? userId;
  Future _uploadProfileImageToFirebaseStorage() async {
    String imageName = basename(imageFile!.path);

    final Reference storage = FirebaseStorage.instance
        .ref()
        .child('UsersProfileImages')
        .child(userId! + imageName);
    await storage.putFile(imageFile!);
    imageUrl = await storage.getDownloadURL();
    update();
  }

  Future _uploadDateToFirestore({
    required String fullName,
    required String email,
    required String phoneNumber,
  }) async {
    registerModel = RegisterModel(
      joinnedDate: Timestamp.now(),
      uID: userId!,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      imageUrl: imageUrl ??
          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
    );
    await _firestore
        .collection('Users')
        .doc(userId)
        .set(registerModel!.toMap());
    update();
  }

  Future _registerWithEmailAndPassword({
    required String fullName,
    required String emailAddress,
    required String password,
    required String phoneNumber,
  }) async {
    isLoading.value = true;
    try {
      if (imageFile != null) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        userId = credential.user!.uid;
        log(userId.toString());
        await _uploadProfileImageToFirebaseStorage();
        await _uploadDateToFirestore(
          email: emailAddress,
          fullName: fullName,
          phoneNumber: phoneNumber,
        );
      } else {
        throw 'Please select image';
      }

      isLoading.value = false;
      Get.offNamed(MainScreen.routeName);
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
      isLoading.value = false;
    } catch (e) {
      kErrorSnackBar(e.toString());
      isLoading.value = false;
      log(e.toString());
    }
  }

  Future signUp() async {
    Get.focusScope!.unfocus();
    if (formKey.currentState!.validate()) {
      await _registerWithEmailAndPassword(
        emailAddress: emailController.text.trim(),
        fullName: fullNameController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: phoneController.text.trim(),
      );
    }
  }

  @override
  void onClose() {
    _disposeAllControllers();

    super.onClose();
  }

  @override
  void dispose() {
    _disposeAllControllers();

    super.dispose();
  }
}
