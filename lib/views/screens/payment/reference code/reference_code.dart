import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/payment.dart';
import 'package:store_app/controller/payment/payment_controller.dart';

class ReferenceCodeScreen extends StatelessWidget {
  const ReferenceCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    // log(argument.toString());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You should Go to Any Market to pay',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 15),
            Text(
              'This is Reference Code',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            GetBuilder(
              autoRemove: false,
              init: PaymentController(),
              builder: (PaymentController controller) {
                return Container(
                  child: Text(
                    kRefCode,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
