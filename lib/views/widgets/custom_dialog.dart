import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customDialog({required Function onTap}) {
  return Get.dialog(
    AlertDialog(
      title: const Text(
        '⚠️\tAre You Sure to delete all products',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => onTap(),
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
