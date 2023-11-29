import 'package:app_facul/app/entities/models/popup_model.dart';

class Warnings{
  static const couldntFindData = PopUp(
    title: 'Erro',
    description: 'Não foi possível encontrar os dados',
  );

  static const couldntUpdateData = PopUp(
    title: 'Erro',
    description: 'Não foi possível atualizar os dados',
  );
}