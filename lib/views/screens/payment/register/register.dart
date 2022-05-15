import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/payment/payment_controller.dart';
import 'package:store_app/views/screens/payment/payment/toggle_payment.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lasttNameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController priceController = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstColors.backgroundColor,
        title: const Text(
          'Payment Integration',
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                CustomTextFormFiled(
                  textEditingController: firstNameController,
                  hint: 'First Name',
                  iconData: Icons.title,
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return 'Must fill the field';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormFiled(
                  textEditingController: lasttNameController,
                  hint: 'Last Name',
                  iconData: Icons.title,
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return 'Must fill the field';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormFiled(
                  textEditingController: emailController,
                  hint: 'Email',
                  iconData: Icons.email,
                  keyboard: TextInputType.emailAddress,
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return 'Must fill the field';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormFiled(
                  textEditingController: phoneController,
                  hint: 'Phone Number',
                  keyboard: TextInputType.phone,
                  iconData: Icons.phone,
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return 'Must fill the field';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormFiled(
                  textEditingController: priceController,
                  hint: 'Price',
                  iconData: Icons.title,
                  keyboard: TextInputType.number,
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return 'Must fill the field';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                GetBuilder(
                  autoRemove: false,
                  init: PaymentController(),
                  builder: (PaymentController controller) {
                    return MaterialButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(16),
                      minWidth: double.infinity,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          await controller.getAuthToken(
                            price: int.parse(
                              priceController.text.trim(),
                            ),
                            firstName: firstNameController.text,
                            lastName: lasttNameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                          );
                          Get.off(
                            () => const TogglePayment(),
                            arguments: {
                              'price': int.parse(
                                priceController.text.trim(),
                              ),
                              'email': emailController.text,
                              'firstName': firstNameController.text,
                              'lastName': lasttNameController.text,
                              'phoneNumber': phoneController.text,
                            },
                          );
                        }
                      },
                      child: const Text('Pay'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
