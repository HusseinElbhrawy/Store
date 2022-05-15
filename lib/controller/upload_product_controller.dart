import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/controller/auth/register.dart';
import 'package:store_app/views/widgets/snackbar/error_snackbar.dart';

class UploadProductCotroller extends GetxController {
  final _controlelr = Get.lazyPut(() => SignupController());
  final SignupController _signupController = Get.find();

  File? pickeImageFile;
  void pickedImage({required ImageSource src}) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? picked = await imagePicker.pickImage(source: src);
    if (picked != null) {
      pickeImageFile = File(picked.path);
    } else {
      kErrorSnackBar('Please , select image');
    }

    update();
  }

  void removeImage() {
    if (pickeImageFile != null) {
      pickeImageFile!.delete();
      pickeImageFile = null;

      update();
    } else {
      kErrorSnackBar('No Image');
    }
  }
}
