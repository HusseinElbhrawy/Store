import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class ThemeMiddleWare {
  final GetStorage _box = GetStorage();
  void setValue({required bool status}) async {
    await _box.write('isDarkTheme', status);
    log('Done');
  }

  bool? getThemeStatus() {
    return _box.read('isDarkTheme');
  }
}
