class CreateDebtModel{
  String? email;
  String? debtor;
  String? paymentMode;
  double? totalValue;
  int? numberOfInstallments;

  CreateDebtModel({
    this.email,
    this.debtor,
    this.paymentMode,
    this.totalValue,
    this.numberOfInstallments,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "debtor": debtor,
      "paymentMode": paymentMode,
      "totalValue": totalValue,
      "numberOfInstallments": numberOfInstallments ?? 0,
    };
  }
}