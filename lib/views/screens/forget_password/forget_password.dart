import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/auth/forget_password.dart';
import 'package:store_app/views/screens/landing/widgets/auth_button.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';
import 'package:store_app/views/widgets/loading_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgetPassword';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final ForgetPasswordController forgetPasswordController =
        Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: forgetPasswordController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forget Password ',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enter Your email to reset password ',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextFormFiled(
                      textEditingController:
                          forgetPasswordController.resetPasswordController,
                      textInputAction: TextInputAction.next,
                      hint: 'Email Address',
                      keyboard: TextInputType.emailAddress,
                      iconData: Icons.email,
                      validator: (newValue) {
                        if (!GetUtils.isEmail(newValue!)) {
                          return 'This Email is not valid';
                        }
                        return null;
                      },
                    ),
                  ),
                  AuthButton(
                    onTap: () {
                      forgetPasswordController.reset();
                    },
                    title: 'Confirm',
                    minWidth: double.infinity,
                    bgColor: ConstColors.starterColor,
                  ),
                ],
              ),
            ),
          ),
          GetX(
            builder: (ForgetPasswordController controller) => LoadingWidget(
              size: size,
              visible: forgetPasswordController.isLoading.value,
            ),
          ),
        ],
      ),
    );
  }
}
