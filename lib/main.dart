import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/views/screens/user_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Store',
      home: const UserInfoScreen(),
    );
  }
}
