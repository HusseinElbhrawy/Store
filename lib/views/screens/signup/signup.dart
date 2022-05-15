import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/views/screens/login/login.dart';
import 'package:store_app/views/widgets/custom_outlined_button_with_icon.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';
import 'package:store_app/views/widgets/loading_widget.dart';
import 'package:store_app/controller/auth/register.dart';
import 'package:store_app/views/widgets/wave_background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/SignupScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final SignupController signUpController = Get.put(SignupController());

    return Scaffold(
      body: Stack(
        children: [
          WaveBackground(size: size),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: signUpController.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        GetBuilder(
                          builder: (SignupController controller) {
                            return CircleAvatar(
                              radius: 75,
                              backgroundColor: Colors.transparent,
                              child: CircleAvatar(
                                backgroundColor: ConstColors.starterColor,
                                radius: 70,
                                child: CircleAvatar(
                                  backgroundColor: ConstColors.endColor,
                                  radius: 65,
                                  backgroundImage: signUpController.imageFile !=
                                          null
                                      ? FileImage(signUpController.imageFile!)
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            shape: const CircleBorder(),
                            primary: ConstColors.starterColor,
                          ),
                          onPressed: () {
                            signUpController.chooseImage();
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
                        focusNode: signUpController.fullNameFoucesNode,
                        textEditingController:
                            signUpController.fullNameController,
                        textInputAction: TextInputAction.next,
                        keyboard: TextInputType.name,
                        iconData: Icons.person,
                        validator: (newValue) {
                          if (newValue!.isEmpty || newValue.length < 5) {
                            return 'It must be at least 6 chars ';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextFormFiled(
                        hint: 'Email Address',
                        focusNode: signUpController.emailFoucesNode,
                        textEditingController: signUpController.emailController,
                        textInputAction: TextInputAction.next,
                        keyboard: TextInputType.emailAddress,
                        iconData: Icons.email,
                        validator: (newValue) {
                          if (!GetUtils.isEmail(newValue!)) {
                            return 'Bad Email Format';
                          }
                          return null;
                        },
                      ),
                    ),
                    GetBuilder(
                      builder: (SignupController controller) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CustomTextFormFiled(
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            hint: 'Password',
                            focusNode: signUpController.passwordFoucesNode,
                            textEditingController:
                                signUpController.passwordController,
                            textInputAction: TextInputAction.next,
                            keyboard: TextInputType.visiblePassword,
                            isPassword: signUpController.isPassword,
                            onSubmit: (newValue) {
                              Get.focusScope!.nextFocus();
                            },
                            iconData: Icons.lock,
                            validator: (newValue) {
                              if (newValue!.isEmpty || newValue.length < 7) {
                                return 'It must be at least 7 chars ';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                signUpController.changePasswordStatus();
                              },
                              icon: Icon(
                                signUpController.isPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextFormFiled(
                        hint: 'Phone Number',
                        focusNode: signUpController.phoneFoucesNode,
                        textEditingController: signUpController.phoneController,
                        textInputAction: TextInputAction.done,
                        keyboard: TextInputType.phone,
                        iconData: Icons.phone_android,
                        onSubmit: (newValue) {
                          signUpController.signUp();
                        },
                        validator: (newValue) {
                          if (!GetUtils.isPhoneNumber(newValue!)) {
                            return 'Bad phone number Format';
                          }
                          return null;
                        },
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
                        onPressed: () {
                          signUpController.signUp();
                        },
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
          ),
          GetX(
            init: SignupController(),
            builder: (SignupController controller) {
              return LoadingWidget(
                size: size,
                visible: signUpController.isLoading.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
