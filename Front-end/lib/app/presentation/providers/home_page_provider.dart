import 'package:app_facul/app/entities/models/create_debt_model.dart';
import 'package:app_facul/app/entities/models/unreceived_payment_model.dart';
import 'package:app_facul/app/entities/models/received_payment_model.dart';
import 'package:app_facul/app/usecases/create_debt_usecase.dart';
import 'package:app_facul/app/usecases/get_received_payments_usecase.dart';
import 'package:app_facul/app/usecases/get_unreceived_payments_usecase.dart';
import 'package:app_facul/app/usecases/update_debt_usecase.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{
  GetReceivedPaymentsUseCase getReceivedPaymentsUseCase;
  GetUnreceivedPaymentsUseCase getUnreceivedPaymentsUseCase;
  CreateDebtUsecase createDebtUsecase;
  UpdateDebtUseCase updateDebtUseCase;

  HomePageProvider(this.getReceivedPaymentsUseCase, this.getUnreceivedPaymentsUseCase, this.createDebtUsecase, this.updateDebtUseCase){
    getReceivedPayments();
    getUnreceivedPayments();
  }

  List<ReceivedPaymentsModel> receivedPayments = [];
  List<ReceivedPaymentsModel> receivedPaymentsFiltered = [];
  List<UnreceivedPaymentsModel> unreceivedPayments = [];
  List<UnreceivedPaymentsModel> unreceivedPaymentsFiltered = [];
  bool receivedButtonOn = true;
  IconData icon = Icons.search;
  CreateDebtModel createDebtModel = CreateDebtModel();
  String? selectedDebtType;
  bool isDebtTypeSelected = true;

  Future<void> getReceivedPayments() async {
    final response = await getReceivedPaymentsUseCase.execute();
    receivedPayments = response;
    receivedPaymentsFiltered = receivedPayments;
    notifyListeners();
  }

  Future<void> getUnreceivedPayments() async {
    final response = await getUnreceivedPaymentsUseCase.execute();
    unreceivedPayments = response;
    unreceivedPaymentsFiltered = unreceivedPayments;
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
    receivedPaymentsFiltered = receivedPaymentsFiltered.where((element) => element.debtor.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }

  void filterUnreceivedPayments(String value) {
    unreceivedPaymentsFiltered = unreceivedPayments;
    unreceivedPaymentsFiltered = unreceivedPaymentsFiltered.where((element) => element.debtor.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }

  void resetFilterLists() {
    receivedPaymentsFiltered = receivedPayments;
    unreceivedPaymentsFiltered = unreceivedPayments;
    notifyListeners();
  }

  void createDebt(String? name, String? email, double? value, int? installments) {
    createDebtModel.debtor = name;
    createDebtModel.email = email;
    createDebtModel.totalValue = value;
    createDebtModel.numberOfInstallments = installments;
    createDebtModel.paymentMode = selectedDebtType;
    createDebtUsecase.execute(createDebtModel);
  }

  void updateDebt(UnreceivedPaymentsModel unreceivedPayment) {
    updateDebtUseCase.execute(unreceivedPayment);
  }

  void setEmptyDebtType() {
    isDebtTypeSelected = false;
    notifyListeners();
  }
}