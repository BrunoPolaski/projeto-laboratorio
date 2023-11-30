import 'package:app_facul/app/entities/models/popup_model.dart';
import 'package:app_facul/app/utils/warnings.dart';

class ApiException implements Exception {
  final PopUp? message;

  ApiException({this.message}){
    ShowPopUp.alertPopUp(message);
  }
}