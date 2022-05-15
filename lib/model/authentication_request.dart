class AuthenticationModel {
  AuthenticationModel({
    required this.profile,
    required this.token,
  });
  late final Profile profile;
  late final String token;

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    profile = Profile.fromJson(json['profile']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profile'] = profile.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Profile {
  Profile({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.active,
    required this.profileType,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
    required this.emailNotification,
    this.orderRetrievalEndpoint,
    this.deliveryUpdateEndpoint,
    this.logoUrl,
    required this.isMobadra,
    required this.sector,
    required this.activationMethod,
    required this.signedUpThrough,
    required this.failedAttempts,
    this.password,
    required this.customExportColumns,
    required this.serverIP,
    this.username,
    required this.primaryPhoneNumber,
    required this.primaryPhoneVerified,
    required this.isTempPassword,
    required this.otp,
    required this.otpSentAt,
    required this.otpSentTo,
    required this.otpValidatedAt,
    this.awbBanner,
    this.emailBanner,
    this.identificationNumber,
    required this.deliveryStatusCallback,
    this.merchantExternalLink,
    required this.merchantStatus,
    required this.deactivatedByBank,
    this.bankDeactivationReason,
    required this.bankMerchantStatus,
    this.nationalId,
    this.superAgent,
    this.walletLimitProfile,
    this.address,
    this.commercialRegistration,
    this.commercialRegistrationArea,
    this.distributorCode,
    this.distributorBranchCode,
    required this.allowTerminalOrderId,
    required this.allowEncryptionBypass,
    this.walletPhoneNumber,
    required this.suspicious,
    this.latitude,
    this.longitude,
    required this.bankStaffs,
    this.bankRejectionReason,
    required this.bankReceivedDocuments,
    required this.bankMerchantDigitalStatus,
    this.bankDigitalRejectionReason,
    required this.filledBusinessData,
    required this.dayStartTime,
    this.dayEndTime,
    required this.withholdTransfers,
    required this.smsSenderName,
    this.withholdTransfersReason,
    this.withholdTransfersNotes,
    required this.canBillDepositWithCard,
    required this.canTopupMerchants,
    this.topupTransferId,
    required this.referralEligible,
    required this.paymobAppMerchant,
    this.settlementFrequency,
    this.dayOfTheWeek,
    this.dayOfTheMonth,
    required this.allowTransactionNotifications,
    required this.allowTransferNotifications,
    this.acqPartner,
    required this.salesOwner,
    this.dom,
    this.bankRelated,
    required this.permissions,
  });
  late final int id;
  late final User user;
  late final String createdAt;
  late final bool active;
  late final String profileType;
  late final List<String> phones;
  late final List<String> companyEmails;
  late final String companyName;
  late final String state;
  late final String country;
  late final String city;
  late final String postalCode;
  late final String street;
  late final bool emailNotification;
  late final orderRetrievalEndpoint;
  late final deliveryUpdateEndpoint;
  late final logoUrl;
  late final bool isMobadra;
  late final String sector;
  late final int activationMethod;
  late final int signedUpThrough;
  late final int failedAttempts;
  late final password;
  late final List<dynamic> customExportColumns;
  late final List<dynamic> serverIP;
  late final username;
  late final String primaryPhoneNumber;
  late final bool primaryPhoneVerified;
  late final bool isTempPassword;
  late final String otp;
  late final String otpSentAt;
  late final String otpSentTo;
  late final String otpValidatedAt;
  late final awbBanner;
  late final emailBanner;
  late final identificationNumber;
  late final String deliveryStatusCallback;
  late final merchantExternalLink;
  late final int merchantStatus;
  late final bool deactivatedByBank;
  late final bankDeactivationReason;
  late final int bankMerchantStatus;
  late final nationalId;
  late final superAgent;
  late final walletLimitProfile;
  late final address;
  late final commercialRegistration;
  late final commercialRegistrationArea;
  late final distributorCode;
  late final distributorBranchCode;
  late final bool allowTerminalOrderId;
  late final bool allowEncryptionBypass;
  late final walletPhoneNumber;
  late final int suspicious;
  late final latitude;
  late final longitude;
  late final BankStaffs bankStaffs;
  late final bankRejectionReason;
  late final bool bankReceivedDocuments;
  late final int bankMerchantDigitalStatus;
  late final bankDigitalRejectionReason;
  late final bool filledBusinessData;
  late final String dayStartTime;
  late final dayEndTime;
  late final bool withholdTransfers;
  late final String smsSenderName;
  late final withholdTransfersReason;
  late final withholdTransfersNotes;
  late final bool canBillDepositWithCard;
  late final bool canTopupMerchants;
  late final topupTransferId;
  late final bool referralEligible;
  late final bool paymobAppMerchant;
  late final settlementFrequency;
  late final dayOfTheWeek;
  late final dayOfTheMonth;
  late final bool allowTransactionNotifications;
  late final bool allowTransferNotifications;
  late final acqPartner;
  late final String salesOwner;
  late final dom;
  late final bankRelated;
  late final List<dynamic> permissions;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = User.fromJson(json['user']);
    createdAt = json['created_at'];
    active = json['active'];
    profileType = json['profile_type'];
    phones = List.castFrom<dynamic, String>(json['phones']);
    companyEmails = List.castFrom<dynamic, String>(json['company_emails']);
    companyName = json['company_name'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postal_code'];
    street = json['street'];
    emailNotification = json['email_notification'];
    orderRetrievalEndpoint = null;
    deliveryUpdateEndpoint = null;
    logoUrl = null;
    isMobadra = json['is_mobadra'];
    sector = json['sector'];
    activationMethod = json['activation_method'];
    signedUpThrough = json['signed_up_through'];
    failedAttempts = json['failed_attempts'];
    password = null;
    customExportColumns =
        List.castFrom<dynamic, dynamic>(json['custom_export_columns']);
    serverIP = List.castFrom<dynamic, dynamic>(json['server_IP']);
    username = null;
    primaryPhoneNumber = json['primary_phone_number'];
    primaryPhoneVerified = json['primary_phone_verified'];
    isTempPassword = json['is_temp_password'];
    otp = json['otp'];
    otpSentAt = json['otp_sent_at'];
    otpSentTo = json['otp_sent_to'];
    otpValidatedAt = json['otp_validated_at'];
    awbBanner = null;
    emailBanner = null;
    identificationNumber = null;
    deliveryStatusCallback = json['delivery_status_callback'];
    merchantExternalLink = null;
    merchantStatus = json['merchant_status'];
    deactivatedByBank = json['deactivated_by_bank'];
    bankDeactivationReason = null;
    bankMerchantStatus = json['bank_merchant_status'];
    nationalId = null;
    superAgent = null;
    walletLimitProfile = null;
    address = null;
    commercialRegistration = null;
    commercialRegistrationArea = null;
    distributorCode = null;
    distributorBranchCode = null;
    allowTerminalOrderId = json['allow_terminal_order_id'];
    allowEncryptionBypass = json['allow_encryption_bypass'];
    walletPhoneNumber = null;
    suspicious = json['suspicious'];
    latitude = null;
    longitude = null;
    bankStaffs = BankStaffs.fromJson(json['bank_staffs']);
    bankRejectionReason = null;
    bankReceivedDocuments = json['bank_received_documents'];
    bankMerchantDigitalStatus = json['bank_merchant_digital_status'];
    bankDigitalRejectionReason = null;
    filledBusinessData = json['filled_business_data'];
    dayStartTime = json['day_start_time'];
    dayEndTime = null;
    withholdTransfers = json['withhold_transfers'];
    smsSenderName = json['sms_sender_name'];
    withholdTransfersReason = null;
    withholdTransfersNotes = null;
    canBillDepositWithCard = json['can_bill_deposit_with_card'];
    canTopupMerchants = json['can_topup_merchants'];
    topupTransferId = null;
    referralEligible = json['referral_eligible'];
    paymobAppMerchant = json['paymob_app_merchant'];
    settlementFrequency = null;
    dayOfTheWeek = null;
    dayOfTheMonth = null;
    allowTransactionNotifications = json['allow_transaction_notifications'];
    allowTransferNotifications = json['allow_transfer_notifications'];
    acqPartner = null;
    salesOwner = json['sales_owner'];
    dom = null;
    bankRelated = null;
    permissions = List.castFrom<dynamic, dynamic>(json['permissions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user'] = user.toJson();
    _data['created_at'] = createdAt;
    _data['active'] = active;
    _data['profile_type'] = profileType;
    _data['phones'] = phones;
    _data['company_emails'] = companyEmails;
    _data['company_name'] = companyName;
    _data['state'] = state;
    _data['country'] = country;
    _data['city'] = city;
    _data['postal_code'] = postalCode;
    _data['street'] = street;
    _data['email_notification'] = emailNotification;
    _data['order_retrieval_endpoint'] = orderRetrievalEndpoint;
    _data['delivery_update_endpoint'] = deliveryUpdateEndpoint;
    _data['logo_url'] = logoUrl;
    _data['is_mobadra'] = isMobadra;
    _data['sector'] = sector;
    _data['activation_method'] = activationMethod;
    _data['signed_up_through'] = signedUpThrough;
    _data['failed_attempts'] = failedAttempts;
    _data['password'] = password;
    _data['custom_export_columns'] = customExportColumns;
    _data['server_IP'] = serverIP;
    _data['username'] = username;
    _data['primary_phone_number'] = primaryPhoneNumber;
    _data['primary_phone_verified'] = primaryPhoneVerified;
    _data['is_temp_password'] = isTempPassword;
    _data['otp'] = otp;
    _data['otp_sent_at'] = otpSentAt;
    _data['otp_sent_to'] = otpSentTo;
    _data['otp_validated_at'] = otpValidatedAt;
    _data['awb_banner'] = awbBanner;
    _data['email_banner'] = emailBanner;
    _data['identification_number'] = identificationNumber;
    _data['delivery_status_callback'] = deliveryStatusCallback;
    _data['merchant_external_link'] = merchantExternalLink;
    _data['merchant_status'] = merchantStatus;
    _data['deactivated_by_bank'] = deactivatedByBank;
    _data['bank_deactivation_reason'] = bankDeactivationReason;
    _data['bank_merchant_status'] = bankMerchantStatus;
    _data['national_id'] = nationalId;
    _data['super_agent'] = superAgent;
    _data['wallet_limit_profile'] = walletLimitProfile;
    _data['address'] = address;
    _data['commercial_registration'] = commercialRegistration;
    _data['commercial_registration_area'] = commercialRegistrationArea;
    _data['distributor_code'] = distributorCode;
    _data['distributor_branch_code'] = distributorBranchCode;
    _data['allow_terminal_order_id'] = allowTerminalOrderId;
    _data['allow_encryption_bypass'] = allowEncryptionBypass;
    _data['wallet_phone_number'] = walletPhoneNumber;
    _data['suspicious'] = suspicious;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['bank_staffs'] = bankStaffs.toJson();
    _data['bank_rejection_reason'] = bankRejectionReason;
    _data['bank_received_documents'] = bankReceivedDocuments;
    _data['bank_merchant_digital_status'] = bankMerchantDigitalStatus;
    _data['bank_digital_rejection_reason'] = bankDigitalRejectionReason;
    _data['filled_business_data'] = filledBusinessData;
    _data['day_start_time'] = dayStartTime;
    _data['day_end_time'] = dayEndTime;
    _data['withhold_transfers'] = withholdTransfers;
    _data['sms_sender_name'] = smsSenderName;
    _data['withhold_transfers_reason'] = withholdTransfersReason;
    _data['withhold_transfers_notes'] = withholdTransfersNotes;
    _data['can_bill_deposit_with_card'] = canBillDepositWithCard;
    _data['can_topup_merchants'] = canTopupMerchants;
    _data['topup_transfer_id'] = topupTransferId;
    _data['referral_eligible'] = referralEligible;
    _data['paymob_app_merchant'] = paymobAppMerchant;
    _data['settlement_frequency'] = settlementFrequency;
    _data['day_of_the_week'] = dayOfTheWeek;
    _data['day_of_the_month'] = dayOfTheMonth;
    _data['allow_transaction_notifications'] = allowTransactionNotifications;
    _data['allow_transfer_notifications'] = allowTransferNotifications;
    _data['acq_partner'] = acqPartner;
    _data['sales_owner'] = salesOwner;
    _data['dom'] = dom;
    _data['bank_related'] = bankRelated;
    _data['permissions'] = permissions;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.dateJoined,
    required this.email,
    required this.isActive,
    required this.isStaff,
    required this.isSuperuser,
    this.lastLogin,
    required this.groups,
    required this.userPermissions,
  });
  late final int id;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String dateJoined;
  late final String email;
  late final bool isActive;
  late final bool isStaff;
  late final bool isSuperuser;
  late final lastLogin;
  late final List<dynamic> groups;
  late final List<int> userPermissions;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    email = json['email'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    lastLogin = null;
    groups = List.castFrom<dynamic, dynamic>(json['groups']);
    userPermissions = List.castFrom<dynamic, int>(json['user_permissions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['date_joined'] = dateJoined;
    _data['email'] = email;
    _data['is_active'] = isActive;
    _data['is_staff'] = isStaff;
    _data['is_superuser'] = isSuperuser;
    _data['last_login'] = lastLogin;
    _data['groups'] = groups;
    _data['user_permissions'] = userPermissions;
    return _data;
  }
}

class BankStaffs {
  BankStaffs();

  BankStaffs.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
