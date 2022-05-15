import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/middleware/storage/get_storage_middle_ware.dart';
import 'package:store_app/views/screens/login/login.dart';

class SignOutController extends GetxController {
  final GetStorageMiddleWare _middleWare = GetStorageMiddleWare();
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    _middleWare.setValue(status: false, key: 'isLogin');
    Get.offAllNamed(LoginScreen.routeName);
  }
}
