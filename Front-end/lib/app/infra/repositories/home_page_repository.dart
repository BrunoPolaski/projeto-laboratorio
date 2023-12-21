import 'package:app_facul/app/entities/models/api_exception.dart';
import 'package:app_facul/app/entities/models/create_debt_model.dart';
import 'package:app_facul/app/entities/models/received_payment_model.dart';
import 'package:app_facul/app/entities/models/unreceived_payment_model.dart';
import 'package:app_facul/app/infra/dio.dart';
import 'package:app_facul/app/infra/repositories/api_endpoints.dart';
import 'package:app_facul/app/utils/warnings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HomePageRepository {
  Dio dio = Api.getInstance();
  

  Future<List<ReceivedPaymentsModel>> getReceivedPayments() async {
    try {
    final response = await dio.get(ApiEndpoints.getPaidBills);
    if (kDebugMode) print(response.data);

    if(response.statusCode != 200) throw Exception;

    List<ReceivedPaymentsModel> list = response.data.map<ReceivedPaymentsModel>((item) => ReceivedPaymentsModel.fromJson(item)).toList();
    
    return list;
    }catch(e){
      if(kDebugMode) print("--------------------erro aqui em repository-------------------");
      if(kDebugMode) print(e);
      throw ApiException(message: Warnings.couldntFindData);
    }
  }

  Future<List<UnreceivedPaymentsModel>> getUnreceivedPayments() async {
    try {
    final response = await dio.get(ApiEndpoints.getUnpaidBills);

    if(response.statusCode != 200) {
      throw Exception;
    }

    List<UnreceivedPaymentsModel> list = response.data.map<UnreceivedPaymentsModel>((item) => UnreceivedPaymentsModel.fromJson(item)).toList();
    
    return list;
    }catch(e){
      if(kDebugMode) print(e);
      throw ApiException(message: Warnings.couldntFindData);
    }
  }

  Future<void> updateReceivedPayment(UnreceivedPaymentsModel payment) async {
    try {
      final response = await dio.put(ApiEndpoints.updateBill.replaceAll("{id}", payment.billId.toString()));

    if(response.statusCode != 200) {
      throw Exception;
    }
;
    if(kDebugMode) print(response.data);
    if(kDebugMode) print(response.statusCode);
    }catch(e){
      if(kDebugMode) print(e);
      throw ApiException(message: Warnings.couldntUpdateData);
    }
  }

  Future<void> createDebt(CreateDebtModel debt) async {
    try {
      final response = await dio.post(ApiEndpoints.createDebt, data: debt.toJson());

    if(response.statusCode != 201) {
      throw Exception;
    }
}
    catch(e){
      if(kDebugMode) print(e);
      throw ApiException(message: Warnings.couldntFindData);
    }
  }
}