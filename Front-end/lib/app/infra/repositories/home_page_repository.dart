
import 'dart:convert';

import 'package:app_facul/app/entities/models/api_exception.dart';
import 'package:app_facul/app/entities/models/received_payment_model.dart';
import 'package:app_facul/app/entities/models/unreceived_payment_model.dart';
import 'package:app_facul/app/infra/repositories/api_endpoints.dart';
import 'package:app_facul/app/utils/warnings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomePageRepository {
  Dio dio = Dio();
  

  Future<List<ReceivedPaymentsModel>> getReceivedPayments() async {
    try {
    final response = await http.get(Uri.https('localhost:8080', '/api/v1/paid'));

    if(response.statusCode != 200) throw Exception;

    final data = jsonDecode(response.body);

    List<ReceivedPaymentsModel> list = data.map((item) => ReceivedPaymentsModel.fromJson(item)).toList();
    
    return list;
    }catch(e){
      throw ApiException(message: Warnings.couldntFindData);
    }
  }

  Future<List<UnreceivedPaymentsModel>> getUnreceivedPayments() async {
    try {
    final response = await dio.get(ApiEndpoints.getUnpaidBills);

    if(response.statusCode != 200) {
      throw Exception;
    }

    List<UnreceivedPaymentsModel> list = response.data.map((item) => UnreceivedPaymentsModel.fromJson(item)).toList();
    
    return list;
    }catch(e){
      throw ApiException(message: Warnings.couldntFindData);
    }
  }

  Future<void> updateReceivedPayment(ReceivedPaymentsModel payment) async {
    try {
      final response = await dio.put(ApiEndpoints.updateBill, data: payment.billId);

    if(response.statusCode != 200) {
      throw Exception;
    }
;
    if(kDebugMode) print(response.data);
    if(kDebugMode) print(response.statusCode);
    }catch(e){
      throw ApiException(message: Warnings.couldntUpdateData);
    }
  }
}