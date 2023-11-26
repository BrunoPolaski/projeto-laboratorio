class UnreceivedPaymentsModel{
  String nameOfSender;
  String amount;
  String date;

  UnreceivedPaymentsModel({
    required this.nameOfSender,
    required this.amount,
    required this.date,
  });

  factory UnreceivedPaymentsModel.fromJson(Map<String, dynamic> json) {
    return UnreceivedPaymentsModel(
      nameOfSender: json['nameOfSender'],
      amount: json['amount'],
      date: json['date'],
    );
  }
}