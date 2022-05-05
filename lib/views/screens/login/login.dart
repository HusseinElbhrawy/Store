import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';
import 'package:store_app/views/screens/login/widgets/logo.dart';
import 'package:store_app/views/widgets/wave_background.dart';
import 'package:store_app/views/widgets/custom_outlined_button_with_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  static final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            WaveBackground(size: size),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 120),
                    const Logo(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextFormFiled(
                        hint: 'Email Address',
                        iconData: Icons.email,
                        validator: (newValue) {
                          if (newValue!.isEmpty ||
                              !newValue.contains('@') ||
                              !newValue.contains('.')) {
                            return 'this email is not valid';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextFormFiled(
                        hint: 'Password',
                        iconData: Icons.lock,
                        validator: (newValue) {
                          if (newValue!.isEmpty || newValue.length < 7) {
                            return 'This password is too short , it must be at least 7 chars';
                          }
                          return null;
                        },
                        suffixIcon: Material(
                          child: IconButton(
                            onPressed: () {
                              log('tapped');
                            },
                            icon: const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ConstColors.starterColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            log('Not valid');
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              height: 5,
                              width: Get.height,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('Or Connect With'),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              height: 5,
                              width: Get.height,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const VerticalDivider(),
                          Expanded(
                            child: CustomOutlinedButton(
                              borderColor: Colors.deepOrange,
                              iconData: FontAwesome5.google_plus_g,
                              onTap: () {},
                              title: 'Google',
                              fontColor: Colors.deepOrange,
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: CustomOutlinedButton(
                              borderColor: Colors.blue,
                              iconData: FontAwesome5.facebook_f,
                              onTap: () {},
                              title: 'Facebook',
                            ),
                          ),
                          const VerticalDivider(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'SignUp',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
