import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/payment.dart';
import 'package:store_app/controller/payment/payment_controller.dart';
import 'package:store_app/views/widgets/loading_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            },
            gestureNavigationEnabled: true,
            backgroundColor: const Color(0x00000000),
          ),
          GetBuilder(
            builder: (PaymentController controller) => LoadingWidget(
              size: size,
              visible: paymentController.showLoading,
            ),
          ),
        ],
      ),
    );
  }
}
