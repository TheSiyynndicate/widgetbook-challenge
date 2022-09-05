// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

class SubmitButtonProps {
  static const props = {
    NameInputError.emptyField: {
      'color': Colors.grey,
      'elevation': .5,
      'borderRadius': 10.0,
    },
    NameInputError.valid: {
      'color': Colors.green,
      'elevation': 50.0,
      'borderRadius': 20.0,
    },
    NameInputError.includesInvalidCharacters: {
      'color': Colors.red,
      'elevation': 10.0,
      'borderRadius': 15.0,
    }
  };
}
