class KioskPayment {
  KioskPayment({
    required this.id,
    required this.pending,
    required this.amountCents,
    required this.success,
    required this.isAuth,
    required this.isCapture,
    required this.isStandalonePayment,
    required this.isVoided,
    required this.isRefunded,
    required this.is3DSecure,
    required this.integrationId,
    required this.profileId,
    required this.hasParentTransaction,
    required this.order,
    required this.createdAt,
    required this.currency,
    required this.terminalId,
    required this.merchantCommission,
    required this.installment,
    required this.isVoid,
    required this.isRefund,
    required this.errorOccured,
    required this.refundedAmountCents,
    required this.capturedAmount,
    required this.merchantStaffTag,
    required this.updatedAt,
    required this.owner,
    required this.parentTransaction,
    required this.merchantOrderId,
    required this.dataMessage,
    required this.sourceDataType,
    required this.sourceDataPan,
    required this.sourceDataSubType,
    required this.acqResponseCode,
    required this.txnResponseCode,
    required this.hmac,
    required this.useRedirection,
    required this.redirectionUrl,
    required this.merchantResponse,
    required this.bypassStepSix,
  });

  int id;
  String pending;
  int amountCents;
  String success;
  String isAuth;
  String isCapture;
  String isStandalonePayment;
  String isVoided;
  String isRefunded;
  String is3DSecure;
  int integrationId;
  int profileId;
  String hasParentTransaction;
  int order;
  DateTime createdAt;
  String currency;
  String terminalId;
  int merchantCommission;
  String installment;
  String isVoid;
  String isRefund;
  String errorOccured;
  int refundedAmountCents;
  int capturedAmount;
  String merchantStaffTag;
  DateTime updatedAt;
  int owner;
  String parentTransaction;
  String merchantOrderId;
  String dataMessage;
  String sourceDataType;
  String sourceDataPan;
  String sourceDataSubType;
  String acqResponseCode;
  String txnResponseCode;
  String hmac;
  bool useRedirection;
  String redirectionUrl;
  String merchantResponse;
  bool bypassStepSix;
}
