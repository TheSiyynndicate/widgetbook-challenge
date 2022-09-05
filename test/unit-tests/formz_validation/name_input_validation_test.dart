import 'package:formz/formz.dart';
import 'package:test/test.dart';
import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

void main() {
  test('Check formz', () {
    const nameInputValidation3 = NameInputValidation.dirty();
    expect(nameInputValidation3.status, FormzInputStatus.invalid);
  });
}
