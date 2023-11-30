class ReceivedPaymentsModel{
  int billId;
  String debtor;
  String paymentMode;
  double totalValue;
  String totalPaidAt;

  ReceivedPaymentsModel({
    required this.billId,
    required this.debtor,
    required this.paymentMode,
    required this.totalValue,
    required this.totalPaidAt,
  });

  factory ReceivedPaymentsModel.fromJson(Map<String, dynamic> json) {
    return ReceivedPaymentsModel(
      billId: json['billId'],
      debtor: json['debtor'],
      paymentMode: json['paymentMode'],
      totalValue: json['totalValue'],
      totalPaidAt: json['totalPaidAt'],
    );
  }
}