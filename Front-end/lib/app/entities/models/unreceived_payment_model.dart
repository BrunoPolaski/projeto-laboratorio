class UnreceivedPaymentsModel{
  int billId;
  String debtor;
  String paymentMode;
  double debtValue;
  String nextDueDate;

  UnreceivedPaymentsModel({
    required this.billId,
    required this.debtor,
    required this.paymentMode,
    required this.debtValue,
    required this.nextDueDate,
  });

  factory UnreceivedPaymentsModel.fromJson(Map<String, dynamic> json) {
    return UnreceivedPaymentsModel(
      billId: json['billId'],
      debtor: json['debtor'],
      paymentMode: json['paymentMode'],
      debtValue: json['debtValue'],
      nextDueDate: json['nextDueDate'],
    );
  }
}