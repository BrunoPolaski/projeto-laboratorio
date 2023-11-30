class ApiEndpoints{
  static String baseUrl = "http://10.0.2.2:8080/api/v1";

  static String get createDebt => baseUrl;

  static String get getUnpaidBills => "$baseUrl/unpaid";
  static String get getPaidBills => "$baseUrl/paid";

  static String get updateBill => "$baseUrl/{id}";
}