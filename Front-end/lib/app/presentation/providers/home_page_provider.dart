import 'package:app_facul/app/entities/models/unreceived_payment_model.dart';
import 'package:app_facul/app/infra/repositories/home_page_repository.dart';
import 'package:app_facul/app/entities/models/received_payment_model.dart';
import 'package:app_facul/app/usecases/get_received_payments_usecase.dart';
import 'package:app_facul/app/usecases/get_unreceived_payments_usecase.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{
  HomePageRepository homePageRepository = HomePageRepository();
  GetReceivedPaymentsUseCase getReceivedPaymentsUseCase = GetReceivedPaymentsUseCase(HomePageRepository());
  GetUnreceivedPaymentsUseCase getUnreceivedPaymentsUseCase = GetUnreceivedPaymentsUseCase(HomePageRepository());

  HomePageProvider(HomePageRepository homePageRepository, GetReceivedPaymentsUseCase getReceivedPaymentsUseCase)
  {
    resetFilterLists();
  }

  List<ReceivedPaymentsModel> receivedPayments = [];
  List<ReceivedPaymentsModel> receivedPaymentsFiltered = [];
  List<UnreceivedPaymentsModel> unreceivedPayments = [];
  List<UnreceivedPaymentsModel> unreceivedPaymentsFiltered = [];
  bool receivedButtonOn = true;
  IconData icon = Icons.search;

  Future<void> getReceivedPayments() async {
    final response = await getReceivedPaymentsUseCase.execute();
    receivedPayments = response;
    notifyListeners();
  }

  Future<void> getUnreceivedPayments() async {
    final response = await getUnreceivedPaymentsUseCase.execute();
    unreceivedPayments = response;
    notifyListeners();
  }

  void setReceivedButtonOn(bool value) {
    receivedButtonOn = value;
    notifyListeners();
  }

  void setReceivedButtonIcon(IconData value) {
    icon = value;
    notifyListeners();
  }

  void filterReceivedPayments(String value) {
    receivedPaymentsFiltered = receivedPayments;
    receivedPaymentsFiltered = receivedPaymentsFiltered.where((element) => element.nameOfSender.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }

  void filterUnreceivedPayments(String value) {
    unreceivedPaymentsFiltered = unreceivedPayments;
    unreceivedPaymentsFiltered = unreceivedPaymentsFiltered.where((element) => element.nameOfSender.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }

  void resetFilterLists() {
    receivedPaymentsFiltered = receivedPayments;
    unreceivedPaymentsFiltered = unreceivedPayments;
    notifyListeners();
  }
}