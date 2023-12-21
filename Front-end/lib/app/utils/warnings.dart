import 'package:app_facul/app/entities/models/notification_popup.dart';
import 'package:app_facul/app/entities/models/popup_model.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Warnings{
  static const couldntFindData = PopUp(
    title: 'Erro',
    description: 'Não foi possível encontrar os dados',
  );

  static const couldntUpdateData = PopUp(
    title: 'Erro',
    description: 'Não foi possível atualizar os dados',
  );

  static const couldntCreateData = PopUp(
    title: 'Erro',
    description: 'Não foi possível criar os dados',
  );
}

class ShowPopUp{
  static Future<bool?> alertPopUp(PopUp? popUp) async {
    popUp ??= Warnings.couldntFindData;
    return showDialog<bool>(
      barrierDismissible: false,
      context: globals.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return NotificationPopUp(popUp: popUp!); 
      }    
    );
  
  }
}