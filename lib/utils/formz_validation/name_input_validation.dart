// ignore_for_file: public_member_api_docs

import 'package:formz/formz.dart';

enum NameInputError { emptyField, includesInvalidCharacters, valid }

class NameInputValidation extends FormzInput<String, NameInputError> {
  const NameInputValidation.pure() : super.pure('');

  const NameInputValidation.dirty({String value = ''}) : super.dirty(value);

  @override
  NameInputError? validator(String value) {
    /// Checks if the input is empty
    if (value.isEmpty) {
      return NameInputError.emptyField;
    }

    /// Checks if the input contains any characters not
    /// within the range [A-Za-z]
    if (!value.contains(RegExp(r'^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$'))) {
      return NameInputError.includesInvalidCharacters;
    }

    // If everything is fine, return null
    return null;
  }
}
