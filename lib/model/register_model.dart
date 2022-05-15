import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterModel {
  final String uID;
  final Timestamp joinnedDate;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String imageUrl;
  RegisterModel({
    required this.uID,
    required this.joinnedDate,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'uID': uID,
      'joinnedDate': joinnedDate,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      uID: map['uID'] ?? '',
      joinnedDate: map['joinnedDate'] ?? Timestamp.now(),
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));

  RegisterModel copyWith({
    String? uID,
    Timestamp? joinnedDate,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) {
    return RegisterModel(
      uID: uID ?? this.uID,
      joinnedDate: joinnedDate ?? this.joinnedDate,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'RegisterModel(uID: $uID, joinnedDate: $joinnedDate, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.uID == uID &&
        other.joinnedDate == joinnedDate &&
        other.fullName == fullName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return uID.hashCode ^
        joinnedDate.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        imageUrl.hashCode;
  }
}
