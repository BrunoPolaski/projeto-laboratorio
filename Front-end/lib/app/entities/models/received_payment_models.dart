class ReceivedPaymentsModel{
  String nameOfSender;
  String amount;
  String date;

  ReceivedPaymentsModel({
    required this.nameOfSender,
    required this.amount,
    required this.date,
  });

  factory ReceivedPaymentsModel.fromJson(Map<String, dynamic> json) {
    return ReceivedPaymentsModel(
      nameOfSender: json['nameOfSender'],
      amount: json['amount'],
      date: json['date'],
    );
  }
}