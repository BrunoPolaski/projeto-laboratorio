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
    return showDialog<bool>
    (
      context: globals.navigatorKey.currentState!.overlay!.context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(popUp!.title),
        content: Text(popUp.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}