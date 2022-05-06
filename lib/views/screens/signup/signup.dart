import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/screens/login/login.dart';
import 'package:store_app/views/widgets/custom_outlined_button_with_icon.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';
import 'package:store_app/views/widgets/dialog_item_widget.dart';
import 'package:store_app/views/widgets/wave_background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/SignupScreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          WaveBackground(size: size),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          backgroundColor: ConstColors.starterColor,
                          radius: 70,
                          child: CircleAvatar(
                            backgroundColor: ConstColors.endColor,
                            radius: 65,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(8),
                          shape: const CircleBorder(),
                          primary: ConstColors.starterColor,
                        ),
                        onPressed: () {
                          Get.dialog(
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
                                    icon: Icons.camera,
                                    title: 'Camera',
                                    color: ConstColors.starterColor,
                                  ),
                                  DialogItemWidget(
                                    icon: Icons.photo_library_outlined,
                                    title: 'Gallery',
                                    color: ConstColors.starterColor,
                                  ),
                                  const DialogItemWidget(
                                    icon: Icons.clear,
                                    title: 'Remove',
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextFormFiled(
                      hint: 'Full Name',
                      iconData: Icons.person,
                      validator: (newValue) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextFormFiled(
                      hint: 'Email Address',
                      iconData: Icons.email,
                      validator: (newValue) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextFormFiled(
                      hint: 'Password',
                      iconData: Icons.lock,
                      validator: (newValue) {},
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextFormFiled(
                      hint: 'PHone Number',
                      iconData: Icons.phone_android,
                      validator: (newValue) {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ConstColors.starterColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Sign up'),
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
                      const Text("Do you have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(LoginScreen.routeName);
                        },
                        child: const Text(
                          'Login',
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
    );
  }
}
