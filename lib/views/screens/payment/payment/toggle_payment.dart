import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/payment.dart';
import 'package:store_app/controller/payment/payment_controller.dart';
import 'package:store_app/views/screens/payment/credit%20card/credit_card.dart';
import 'package:store_app/views/screens/payment/reference%20code/reference_code.dart';

class TogglePayment extends StatelessWidget {
  const TogglePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(
      PaymentController(),
      permanent: true,
    );
    var argument = Get.arguments;
    log(argument.toString());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PaymentWidget(
                imagePath: 'assets/images/card.png',
                onTap: () async {
                  await paymentController.getTokenCardID(
                    price: argument['price'],
                    firstName: argument['firstName'],
                    lastName: argument['lastName'],
                    email: argument['email'],
                    phoneNumber: argument['phoneNumber'],
                  );
                  await Get.off(
                    () => const CreditCardScreen(),
                    arguments: {
                      'cardId': kFinalTokenCardID,
                      'argument': argument,
                    },
                  );
                },
                title: 'Pay With Credit Card',
              ),
            ),
            Expanded(
              child: PaymentWidget(
                imagePath: 'assets/images/tourist.png',
                onTap: () async {
                  await paymentController.getTokenKiosk(
                    price: argument['price'],
                    firstName: argument['firstName'],
                    lastName: argument['lastName'],
                    email: argument['email'],
                    phoneNumber: argument['phoneNumber'],
                  );
                  Get.off(
                    () => const ReferenceCodeScreen(),
                    arguments: kRefCode,
                  );
                },
                title: 'Pay With Reference Code',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 50),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
