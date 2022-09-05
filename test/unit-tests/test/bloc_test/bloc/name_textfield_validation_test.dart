import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/bloc/name_text_field_validation/name_text_field_validation_bloc.dart';
import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

void main() {
  group('NameTextFieldValidationBloc', () {
    late NameTextFieldValidationBloc nameTextFieldValidationBloc;
    late NameValidationRepository nameValidationRepository;

    setUp(() {
      nameValidationRepository = NameValidationRepository();
      nameTextFieldValidationBloc = NameTextFieldValidationBloc(
          nameValidationRepository: nameValidationRepository,);
    });

    blocTest<NameTextFieldValidationBloc, NameTextFieldValidationState>(
      'Change the status of the submit button to valid',
      build: () => nameTextFieldValidationBloc,
      act: (bloc) => bloc.add(
          const NameTextFieldValidationStatusChanged(NameInputError.valid),),
      expect: () => [const NameTextFieldValidationState.valid()],
    );
    blocTest<NameTextFieldValidationBloc, NameTextFieldValidationState>(
      'Change the status of the submit button to includesInvalidCharacters',
      build: () => nameTextFieldValidationBloc,
      act: (bloc) => bloc.add(
        const NameTextFieldValidationStatusChanged(
          NameInputError.includesInvalidCharacters,
        ),
      ),
      expect: () =>
          [const NameTextFieldValidationState.includesInvalidCharacters()],
    );
    blocTest<NameTextFieldValidationBloc, NameTextFieldValidationState>(
      'Change the status of the submit button to emptyField',
      build: () => nameTextFieldValidationBloc,
      act: (bloc) => bloc.add(const NameTextFieldValidationStatusChanged(
          NameInputError.emptyField,),),
      expect: () => [const NameTextFieldValidationState.emptyField()],
    );

    tearDown(() => nameTextFieldValidationBloc.close());
  });
}
