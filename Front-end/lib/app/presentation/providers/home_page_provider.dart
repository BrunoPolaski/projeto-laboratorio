import 'package:app_facul/app/infra/repositories/home_page_repository.dart';
import 'package:app_facul/app/entities/models/received_payment_models.dart';
import 'package:app_facul/app/usecases/get_received_payments_usecase.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{
  HomePageRepository homePageRepository = HomePageRepository();
  GetReceivedPaymentsUseCase getReceivedPaymentsUseCase = GetReceivedPaymentsUseCase(HomePageRepository());

  HomePageProvider(HomePageRepository homePageRepository, GetReceivedPaymentsUseCase getReceivedPaymentsUseCase)
  {
    getReceivedPayments();
  }

  List<ReceivedPaymentsModel> receivedPayments = [];
  PageController pageController = PageController();

  Future<void> getReceivedPayments() async {
    final response = await getReceivedPaymentsUseCase.execute();
    receivedPayments = response;
    notifyListeners();
  }
}