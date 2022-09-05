import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/constants/name_input_validation_messages.dart';
import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

void main() {
  test('Check "name_inputs_validation_messages_test.dart" for alteration(s)',
      () {
    expect(
      NameInputValidationMessages
          .nameInputValidationMessages[NameInputError.valid],
      'valid_name_input_validation_message',
    );
    expect(
      NameInputValidationMessages.nameInputValidationMessages[
          NameInputError.includesInvalidCharacters],
      'includes_invalid_characters_name_input_validation_message',
    );
    expect(
      NameInputValidationMessages
          .nameInputValidationMessages[NameInputError.emptyField],
      'empty_field_valid_name_input_validation_message',
    );
  });
}
