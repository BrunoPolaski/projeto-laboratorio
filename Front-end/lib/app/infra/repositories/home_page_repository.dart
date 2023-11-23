
import 'package:app_facul/app/domain/entities/models/received_payment_models.dart';
import 'package:dio/dio.dart';

class HomePageRepository {
  Dio dio = Dio();

  Future<List<ReceivedPaymentsModel>> getReceivedPayments() async {
    try {
    // final response = await dio.get('api');

    // if(response.statusCode != 200) {
    //   throw Exception;
    // }

    final jsonMock = {
      {
        "nameOfSender": "João",
        "amount": "R\$ 100,00",
        "date": "10/10/2021"
      },
      {
        "nameOfSender": "Maria",
        "amount": "R\$ 200,00",
        "date": "10/10/2021"
      },
      {
        "nameOfSender": "José",
        "amount": "R\$ 300,00",
        "date": "10/10/2021"
      },
      {
        "nameOfSender": "Pedro",
        "amount": "R\$ 400,00",
        "date": "10/10/2021"
      },
      {
        "nameOfSender": "Paulo",
        "amount": "R\$ 500,00",
        "date": "10/10/2021"
      },
      {
        "nameOfSender": "Joana",
        "amount": "R\$ 600,00",
        "date": "10/10/2021"
      },
      {
        "nameOfSender": "Ana",
        "amount": "R\$ 700,00",
        "date": "10/10/2021"
    },
    };

    List<ReceivedPaymentsModel> list = jsonMock.map((item) => ReceivedPaymentsModel.fromJson(item)).toList();
    
    return list;
    }catch(e){
      throw Exception('Erro ao carregar dados');
    }
  }
}