import 'package:app_facul/app/entities/models/popup_model.dart';
import 'package:flutter/material.dart';

class NotificationPopUp extends StatelessWidget {
  final PopUp popUp;

  const NotificationPopUp({Key? key, required this.popUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(popUp.title),
        content: Text(popUp.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      );
  }
}