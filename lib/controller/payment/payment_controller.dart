import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/payment.dart';
import 'package:store_app/model/order.dart';
import 'package:store_app/utils/middleware/dio/dio.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentController extends GetxController {
  int progress = 0;

  RxBool isLoading = false.obs;

  String initUrl =
      'https://accept.paymob.com/api/acceptance/iframes/379680?payment_token=$kFinalTokenCardID';

  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  void updateProgressValue({required int newProgress}) {
    progress = newProgress;
    update();
  }

  bool get showLoading => progress == 100 ? false : true;

  JavascriptChannel toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Payment',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  Future getAuthToken({
    required int price,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    isLoading.value = true;
    try {
      var data = await DioHelperPayment.postData(
        path: 'auth/tokens',
        data: {
          'api_key': kPaymobApiKey,
        },
      );
      kAuthToken = data.data['token'];
      log(kAuthToken + '\n===========================');

      await getOrderID(price: price * 100);
      isLoading.value = true;
      update();
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }

  Future getOrderID({required int price}) async {
    isLoading.value = true;
    try {
      var data = await DioHelperPayment.postData(
        path: 'ecommerce/orders',
        data: {
          'auth_token': kAuthToken,
          'delivery_needed': false,
          'amount_cents': price.toString(),
          'items': [],
        },
      );
      kOrderID = data.data['id'].toString();
      log(kOrderID + '\n===========================');
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }

  Future getTokenCardID({
    required int price,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    isLoading.value = true;
    try {
      var data = await DioHelperPayment.postData(
        path: 'acceptance/payment_keys',
        data: {
          'auth_token': kAuthToken,
          'delivery_needed': false,
          'amount_cents': (price * 100).toString(),
          "expiration": 3600,
          "order_id": kOrderID,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phoneNumber,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": int.parse(kIntegrationIDCard),
        },
      );
      kFinalTokenCardID = data.data['token'].toString();
      log(kFinalTokenCardID + '\n===========================');
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }

  Future getTokenKiosk({
    required int price,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      isLoading.value = true;
      var data = await DioHelperPayment.postData(
        path: 'acceptance/payment_keys',
        data: {
          'auth_token': kAuthToken,
          'delivery_needed': false,
          'amount_cents': (price * 100).toString(),
          "expiration": 3600,
          "order_id": kOrderID,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phoneNumber,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": int.parse(kIntegrationIDKiosk),
        },
      );
      kFinalTokenKiosk = data.data['token'].toString();
      log(kFinalTokenKiosk + '\n===========================');
      _getReferenceCode();
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }

  Future _getReferenceCode() async {
    isLoading.value = true;
    try {
      var data = await DioHelperPayment.postData(
          path: 'acceptance/payments/pay',
          data: {
            "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
            "payment_token": kFinalTokenKiosk,
          });
      kRefCode = data.data['id'].toString();
      log(kRefCode + '\n===========================');
      isLoading.value = true;
      update();
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }

  OrderModel? orderModel;
  Future uploadOrderDetailsToFirebaseFiredtore(
      {required List<String> productsId,
      required List<String> quantity,
      required String price}) async {
    isLoading.value = true;

    try {
      orderModel = OrderModel(
        orderId: kOrderID,
        userId: FirebaseAuth.instance.currentUser!.uid,
        productId: productsId,
        title: 'Order' + FirebaseAuth.instance.currentUser!.uid,
        price: price,
        imageUrl: FirebaseAuth.instance.currentUser!.photoURL.toString(),
        quantity: quantity,
        orderDate: Timestamp.now(),
      );
      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('UserOrders')
          .add(
            orderModel!.toMap(),
          );
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }
}
