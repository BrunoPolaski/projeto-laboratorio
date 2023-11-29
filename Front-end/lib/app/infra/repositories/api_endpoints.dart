class ApiEndpoints{
  static String baseUrl = "http://localhost:8080/api/v1";

  static String get createBill => baseUrl;

  static String get getUnpaidBills => "$baseUrl/unpaid";
  static String get getPaidBills => "$baseUrl/paid";

  static String get updateBill => "$baseUrl/{id}";
}