import 'package:app_facul/app/entities/models/popup_model.dart';
import 'package:app_facul/app/entities/models/notification_popup.dart';

class ApiException implements Exception {
  final PopUp? message;

  ApiException({this.message}){
    NotificationPopUp(popUp: message!);
  }
}