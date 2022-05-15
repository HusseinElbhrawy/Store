import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/auth/login.dart';
import 'package:store_app/views/screens/forget_password/forget_password.dart';
import 'package:store_app/views/screens/signup/signup.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';
import 'package:store_app/views/screens/login/widgets/logo.dart';
import 'package:store_app/views/widgets/loading_widget.dart';
import 'package:store_app/views/widgets/custom_outlined_button_with_icon.dart';
import 'package:store_app/views/widgets/wave_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            WaveBackground(size: size),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: loginController.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 120),
                    const Logo(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextFormFiled(
                        focusNode: loginController.emailFocusNode,
                        textEditingController: loginController.emailController,
                        textInputAction: TextInputAction.next,
                        hint: 'Email Address',
                        keyboard: TextInputType.emailAddress,
                        iconData: Icons.email,
                        validator: (newValue) {
                          if (!GetUtils.isEmail(newValue!)) {
                            return 'this email is not valid';
                          }
                          return null;
                        },
                      ),
                    ),
                    GetBuilder(
                      builder: (LoginController controller) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CustomTextFormFiled(
                            focusNode: loginController.passwordFoucsNode,
                            textEditingController:
                                loginController.passwordConroller,
                            onSubmit: (newValue) {
                              loginController.login();
                              // loginController.login();
                            },
                            textInputAction: TextInputAction.done,
                            hint: 'Password',
                            keyboard: TextInputType.visiblePassword,
                            iconData: Icons.lock,
                            validator: (newValue) {
                              if (newValue!.isEmpty || newValue.length < 7) {
                                return 'This password is too short , it must be at least 7 chars';
                              }
                              return null;
                            },
                            isPassword: loginController.isPasswordHidden,
                            suffixIcon: Material(
                              child: IconButton(
                                onPressed: () =>
                                    loginController.updatePasswordStatus(),
                                icon: Icon(
                                  loginController.isPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blue.shade900,
                        ),
                        onPressed: () {
                          Get.toNamed(ForgetPasswordScreen.routeName);
                        },
                        child: const Text('Forget Password'),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width, 50),
                          primary: ConstColors.starterColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          loginController.login();
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
                              onTap: () {
                                loginController.signInWithGoogle();
                              },
                              title: 'Google',
                              fontColor: Colors.deepOrange,
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: CustomOutlinedButton(
                              borderColor: Colors.blue,
                              iconData: FontAwesome5.facebook_f,
                              onTap: () {
                                loginController.signInWithFacebook();
                              },
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
                          onPressed: () {
                            Get.offNamed(SignUpScreen.routeName);
                          },
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
            GetX(
              init: LoginController(),
              builder: (LoginController controller) {
                return LoadingWidget(
                  size: size,
                  visible: controller.isLoading.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
