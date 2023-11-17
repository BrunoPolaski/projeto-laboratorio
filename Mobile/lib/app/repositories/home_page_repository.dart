
import 'package:app_facul/app/models/received_payment_models.dart';
import 'package:dio/dio.dart';

class HomePageRepository {
  Dio dio = Dio();

  Future<List<ReceivedPaymentsModel>> getReceivedPayments() async {
    try {
    final response = await dio.get('api');

    if(response.statusCode != 200) {
      throw Exception;
    }

    List<ReceivedPaymentsModel> list = response.data.Map((item) => ReceivedPaymentsModel.fromJson(item)).toList();
    
    return list;
    }catch(e){
      throw Exception('Erro ao carregar dados');
    }
  }
}