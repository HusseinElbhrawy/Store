import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/model/register_model.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/views/widgets/dialog_item_widget.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';

class EditInfoUserScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController shippingAddressController =
      TextEditingController();
  final User _currentUser = FirebaseAuth.instance.currentUser!;

  RxBool isLoading = false.obs;

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

  String? imageUrl;

  Future _uploadProfileImageToFirebaseStorage() async {
    final Reference storage = FirebaseStorage.instance
        .ref()
        .child('UsersProfileImages')
        .child(_currentUser.uid);
    await storage.putFile(imageFile!);
    imageUrl = await storage.getDownloadURL();
    update();
  }

  RegisterModel? registerModel;

  Future updateUserInformation() async {
    isLoading.value = true;
    await _uploadProfileImageToFirebaseStorage();
    registerModel = RegisterModel(
      joinnedDate: Timestamp.now(),
      uID: _currentUser.uid,
      fullName: fullNameController.text,
      email: emailAddressController.text,
      phoneNumber: phoneNumberController.text,
      imageUrl: imageUrl ??
          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
    );
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(_currentUser.uid)
          .update(
            registerModel!.toMap(),
          );
      isLoading.value = false;
    } catch (e) {
      kErrorSnackBar(e.toString());
      isLoading.value = false;
    }
  }

  void initTextformfiledWithData({required Map arguments}) {
    fullNameController.text = arguments['fullName'];
    emailAddressController.text = arguments['emailAddress'];
    phoneNumberController.text = arguments['phoneNumber'];
    shippingAddressController.text = arguments['shippingAddress'];
    update();
  }

  void _disposeAllController() {
    fullNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    shippingAddressController.dispose();
  }

  @override
  void onClose() {
    _disposeAllController();
    super.onClose();
  }
}
