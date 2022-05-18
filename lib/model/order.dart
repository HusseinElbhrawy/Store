import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final List<String> productId;
  final String title;
  final String price;
  final String imageUrl;
  final List<String> quantity;
  final Timestamp orderDate;
  OrderModel({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.orderDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'productId': productId,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'orderDate': orderDate,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] ?? '',
      userId: map['userId'] ?? '',
      productId: List<String>.from(map['productId']),
      title: map['title'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      quantity: map['quantity'] ?? '',
      orderDate: map['orderDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, userId: $userId, productId: $productId, title: $title, price: $price, imageUrl: $imageUrl, quantity: $quantity, orderDate: $orderDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.orderId == orderId &&
        other.userId == userId &&
        listEquals(other.productId, productId) &&
        other.title == title &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.quantity == quantity &&
        other.orderDate == orderDate;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        userId.hashCode ^
        productId.hashCode ^
        title.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        quantity.hashCode ^
        orderDate.hashCode;
  }
}
