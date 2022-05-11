import 'package:store_app/utils/middleware/get_storage_middle_ware.dart';
import 'package:store_app/views/screens/landing/landing.dart';
import 'package:store_app/views/screens/main_screen.dart';

class UserStatus {
  static final GetStorageMiddleWare _middleWare = GetStorageMiddleWare();
  static late final bool _isLogin =
      _middleWare.getValue(key: 'isLogin') ?? false;

  static String get page =>
      _isLogin ? MainScreen.routeName : LandingScreen.routeName;
}
