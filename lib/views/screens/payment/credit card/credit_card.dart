import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/payment.dart';
import 'package:store_app/controller/payment/payment_controller.dart';
import 'package:store_app/views/screens/main_screen.dart';
import 'package:store_app/views/widgets/loading_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    log('xxx================xxx');
    log(argument['argument']['price'].toString());
    List<String> productsId = [];
    List<String> quantity = [];
    for (var i = 0;
        i < argument['argument']['argument']['products'].toList().length;
        i++) {
      productsId
          .add(argument['argument']['argument']['products'][i].id.toString());
      quantity.add(
          argument['argument']['argument']['products'][i].quantity.toString());
    }

    final PaymentController paymentController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Payment'),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(MainScreen.routeName);
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl:
                'https://accept.paymob.com/api/acceptance/iframes/379680?payment_token=$kFinalTokenCardID',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              paymentController.controller.complete(webViewController);
            },
            debuggingEnabled: true,
            zoomEnabled: true,
            allowsInlineMediaPlayback: true,
            onProgress: (int newProgress) {
              log('WebView is loading (progress : $newProgress%)');
              paymentController.updateProgressValue(newProgress: newProgress);
            },
            javascriptChannels: <JavascriptChannel>{
              paymentController.toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.google.com/')) {
                log('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              log('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              log('Page started loading: $url');
            },
            onPageFinished: (String url) {
              log('Page finished loading: $url');
              if (url.contains('data.message=Approved')) {
                //ToDo: upload new order to firebase firestore;
                paymentController.uploadOrderDetailsToFirebaseFiredtore(
                  productsId: productsId,
                  quantity: quantity,
                  price: argument['argument']['price'].toString(),
                );
              }
              log('==================================');
            },
            gestureNavigationEnabled: true,
            backgroundColor: const Color(0x00000000),
          ),
          GetBuilder(
            builder: (PaymentController controller) {
              return LoadingWidget(
                size: size,
                visible: paymentController.showLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
