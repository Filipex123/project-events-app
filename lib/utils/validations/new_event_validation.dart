import 'package:brota_ai_app/models/event_model.dart';

import 'package:brota_ai_app/utils/validations/validation.dart';

class NewEventValidation extends Validation {
  List<String> validate(EventRequestModel input) {
    List<String> returnErrors = [];

    if (!requiredField(input.name)) {
      returnErrors.add('Campo nome do evento vazio');
    }

    if (!requiredField(input.sport)) {
      returnErrors.add('Campo esporte vazio');
    }

    if (!requiredField(input.locale)) {
      returnErrors.add('Campo localização vazio');
    }

    // if(!requiredFieldDate(input.initialDateTime)){
    //   returnErrors.add('Campo de data e hora vazio');
    // }

    if (!requiredField(input.gender)) {
      returnErrors.add('Campo de gênero vazio');
    }

    return returnErrors.map((item) => '- ' + item).toList();
  }
}
