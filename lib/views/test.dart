import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavigationBar(
            destinations: const [
              Text('label1'),
              Text('label1'),
              Text('label1'),
              Text('label1'),
              Text('label1'),
              Text('label1'),
              Text('label1'),
            ],
          ),
        ],
      ),
    );
  }
}
