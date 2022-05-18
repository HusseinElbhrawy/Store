import 'dart:developer';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/payment/payment_controller.dart';
import 'package:store_app/views/screens/landing/widgets/auth_button.dart';
import 'package:store_app/views/screens/payment/payment/toggle_payment.dart';
import 'package:store_app/views/widgets/custom_text_form_filed.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  static const routeName = '/checkoutScreen';
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
    var argument = Get.arguments;
    log('==========================');
    log(argument.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstColors.backgroundColor,
        title: const Text(
          'Order Check Out',
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                    if (!GetUtils.isPhoneNumber(newValue!)) {
                      return 'Must fill the field';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Container(
                  // height: 10,
                  decoration: DottedDecoration(
                    shape: Shape.line,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 150,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        'Total Payment',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      OrderCheckOutIPaymenttemWidget(
                        title1: 'Total Buy',
                        title2: argument['price'].toString(),
                      ),
                      const OrderCheckOutIPaymenttemWidget(
                        title1: 'Shipping Price',
                        title2: 'Free',
                        isShippingFree: true,
                      ),
                      OrderCheckOutIPaymenttemWidget(
                        title1: 'Total',
                        title2: argument['price'].toString(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Pay',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Divider(),
                Text(
                  '${argument['price']}\$',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ],
            ),
            GetX(
              init: PaymentController(),
              builder: (PaymentController controller) {
                if (controller.isLoading.value) {
                  return const SizedBox(
                    height: 50,
                    child: SpinKitThreeInOut(
                      color: Color.fromARGB(255, 58, 54, 54),
                    ),
                  );
                } else {
                  return AuthButton(
                    height: 50,
                    minWidth: Get.size.width / 2.4,
                    onTap: () async {
                      controller.isLoading.value = false;
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        await controller.getAuthToken(
                          price: argument['price'].round(),
                          firstName: firstNameController.text,
                          lastName: lasttNameController.text,
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                        );
                        await Get.off(
                          () => const TogglePayment(),
                          arguments: {
                            'price': argument['price'].round(),
                            'email': emailController.text,
                            'firstName': firstNameController.text,
                            'lastName': lasttNameController.text,
                            'phoneNumber': phoneController.text,
                            'argument': argument,
                          },
                        );
                        controller.isLoading.value = false;
                      }
                      controller.isLoading.value = false;
                    },
                    title: 'Pay',
                    bgColor: ConstColors.gradiendFEnd,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCheckOutIPaymenttemWidget extends StatelessWidget {
  const OrderCheckOutIPaymenttemWidget({
    Key? key,
    required this.title1,
    required this.title2,
    this.isShippingFree = false,
  }) : super(key: key);
  final String title1, title2;
  final bool isShippingFree;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title1,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontFamily: 'jannah'),
        ),
        const Spacer(),
        Text(
          isShippingFree ? title2 : "$title2\$",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontFamily: 'jannah'),
        ),
      ],
    );
  }
}
