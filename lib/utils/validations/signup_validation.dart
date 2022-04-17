import 'package:brota_ai_app/models/signup_model.dart';
import 'package:brota_ai_app/utils/regexp.dart';
import 'package:brota_ai_app/utils/validations/validation.dart';

class SignUpValidation extends Validation {
  List<String> validate(SignUpRequestModel input) {
    List<String> returnErrors = [];

    if (!requiredField(input.name)) {
      returnErrors.add('Campo nome vazio');
    } else {
      if (!regExp(RegExpValidations.name, input.name)) {
        returnErrors.add('Nome inválido');
      }
    }

    if (!requiredField(input.email)) {
      returnErrors.add('Campo e-mail vazio');
    } else {
      if (!regExp(RegExpValidations.email, input.email)) {
        returnErrors.add('E-mail inválido');
      }
    }

    if (!requiredField(input.cpf)) {
      returnErrors.add('Campo CPF vazio');
    }

    if (!requiredField(input.password) ||
        !requiredField(input.confirmPassword)) {
      returnErrors.add('Campo de senha vazio');
    } else if (input.password != input.confirmPassword) {
      returnErrors.add('As senha não coincidêm');
    }

    if (input.gender == null) {
      returnErrors.add('Campo data de nascimento vazio');
    }

    return returnErrors.map((item) => '- ' + item).toList();
  }
}
