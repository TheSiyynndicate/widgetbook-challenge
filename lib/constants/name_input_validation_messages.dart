// ignore_for_file: public_member_api_docs

import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

///
class NameInputValidationMessages {
  static const nameInputValidationMessages = {
    NameInputError.valid: 'valid_name_input_validation_message',
    NameInputError.includesInvalidCharacters:
        'includes_invalid_characters_name_input_validation_message',
    NameInputError.emptyField: 'empty_field_valid_name_input_validation_message'
  };
}
