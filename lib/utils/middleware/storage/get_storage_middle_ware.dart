import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class GetStorageMiddleWare {
  final GetStorage _box = GetStorage();
  void setValue({required bool status, required key}) async {
    await _box.write(key, status);
    log('Done');
  }

  bool? getValue({required key}) {
    return _box.read(key);
  }
}
