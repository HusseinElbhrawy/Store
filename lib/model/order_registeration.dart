class OrderRegisterationModel {
  OrderRegisterationModel({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    this.collector,
    required this.amountCents,
    required this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    this.merchantStaffTag,
    required this.apiSource,
    required this.data,
    required this.token,
    required this.url,
  });
  late final int id;
  late final String createdAt;
  late final bool deliveryNeeded;
  late final Merchant merchant;
  late final collector;
  late final int amountCents;
  late final ShippingData shippingData;
  late final String currency;
  late final bool isPaymentLocked;
  late final bool isReturn;
  late final bool isCancel;
  late final bool isReturned;
  late final bool isCanceled;
  late final merchantOrderId;
  late final walletNotification;
  late final int paidAmountCents;
  late final bool notifyUserWithEmail;
  late final List<Items> items;
  late final String orderUrl;
  late final int commissionFees;
  late final int deliveryFeesCents;
  late final int deliveryVatCents;
  late final String paymentMethod;
  late final merchantStaffTag;
  late final String apiSource;
  late final Data data;
  late final String token;
  late final String url;

  OrderRegisterationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    createdAt = json['created_at'] ?? '';
    deliveryNeeded = json['delivery_needed'] ?? false;
    merchant = Merchant.fromJson(json['merchant']);
    collector = json['collector'] ?? '';
    amountCents = json['amount_cents'];
    shippingData = ShippingData.fromJson(json['shipping_data']);
    currency = json['currency'];
    isPaymentLocked = json['is_payment_locked'];
    isReturn = json['is_return'];
    isCancel = json['is_cancel'];
    isReturned = json['is_returned'];
    isCanceled = json['is_canceled'];
    merchantOrderId = json['merchant_order_id'] ?? '';
    walletNotification = json['wallet_notification'] ?? '';
    paidAmountCents = json['paid_amount_cents'];
    notifyUserWithEmail = json['notify_user_with_email'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    orderUrl = json['order_url'];
    commissionFees = json['commission_fees'];
    deliveryFeesCents = json['delivery_fees_cents'];
    deliveryVatCents = json['delivery_vat_cents'];
    paymentMethod = json['payment_method'];
    merchantStaffTag = json['merchant_staff_tag'] ?? '';
    apiSource = json['api_source'];
    data = Data.fromJson(json['data']);
    token = json['token'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['delivery_needed'] = deliveryNeeded;
    _data['merchant'] = merchant.toJson();
    _data['collector'] = collector;
    _data['amount_cents'] = amountCents;
    _data['shipping_data'] = shippingData.toJson();
    _data['currency'] = currency;
    _data['is_payment_locked'] = isPaymentLocked;
    _data['is_return'] = isReturn;
    _data['is_cancel'] = isCancel;
    _data['is_returned'] = isReturned;
    _data['is_canceled'] = isCanceled;
    _data['merchant_order_id'] = merchantOrderId;
    _data['wallet_notification'] = walletNotification;
    _data['paid_amount_cents'] = paidAmountCents;
    _data['notify_user_with_email'] = notifyUserWithEmail;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['order_url'] = orderUrl;
    _data['commission_fees'] = commissionFees;
    _data['delivery_fees_cents'] = deliveryFeesCents;
    _data['delivery_vat_cents'] = deliveryVatCents;
    _data['payment_method'] = paymentMethod;
    _data['merchant_staff_tag'] = merchantStaffTag;
    _data['api_source'] = apiSource;
    _data['data'] = data.toJson();
    _data['token'] = token;
    _data['url'] = url;
    return _data;
  }
}

class Merchant {
  Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
  });
  late final int id;
  late final String createdAt;
  late final List<String> phones;
  late final List<String> companyEmails;
  late final String companyName;
  late final String state;
  late final String country;
  late final String city;
  late final String postalCode;
  late final String street;

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    phones = List.castFrom<dynamic, String>(json['phones']);
    companyEmails = List.castFrom<dynamic, String>(json['company_emails']);
    companyName = json['company_name'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postal_code'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['phones'] = phones;
    _data['company_emails'] = companyEmails;
    _data['company_name'] = companyName;
    _data['state'] = state;
    _data['country'] = country;
    _data['city'] = city;
    _data['postal_code'] = postalCode;
    _data['street'] = street;
    return _data;
  }
}

class ShippingData {
  ShippingData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.postalCode,
    required this.extraDescription,
    required this.shippingMethod,
    required this.orderId,
    required this.order,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String street;
  late final String building;
  late final String floor;
  late final String apartment;
  late final String city;
  late final String state;
  late final String country;
  late final String email;
  late final String phoneNumber;
  late final String postalCode;
  late final String extraDescription;
  late final String shippingMethod;
  late final int orderId;
  late final int order;

  ShippingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    apartment = json['apartment'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    postalCode = json['postal_code'];
    extraDescription = json['extra_description'];
    shippingMethod = json['shipping_method'];
    orderId = json['order_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['street'] = street;
    _data['building'] = building;
    _data['floor'] = floor;
    _data['apartment'] = apartment;
    _data['city'] = city;
    _data['state'] = state;
    _data['country'] = country;
    _data['email'] = email;
    _data['phone_number'] = phoneNumber;
    _data['postal_code'] = postalCode;
    _data['extra_description'] = extraDescription;
    _data['shipping_method'] = shippingMethod;
    _data['order_id'] = orderId;
    _data['order'] = order;
    return _data;
  }
}

class Items {
  Items({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
  });
  late final String name;
  late final String description;
  late final int amountCents;
  late final int quantity;

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    amountCents = json['amount_cents'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['amount_cents'] = amountCents;
    _data['quantity'] = quantity;
    return _data;
  }
}

class Data {
  Data();

  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
