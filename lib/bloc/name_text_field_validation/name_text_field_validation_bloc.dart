// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

part 'name_text_field_validation_event.dart';
part 'name_text_field_validation_state.dart';

class NameTextFieldValidationBloc
    extends Bloc<NameTextFieldValidationEvent, NameTextFieldValidationState> {
  NameTextFieldValidationBloc({
    required NameValidationRepository nameValidationRepository,
  })  : _nameValidationRepository = nameValidationRepository,
        super(const NameTextFieldValidationState.emptyField()) {
    on<NameTextFieldValidationStatusChanged>(_onValidationtatusChanged);

    _nameInputErrorStatusSubscription = _nameValidationRepository.status.listen(
      (status) => add(NameTextFieldValidationStatusChanged(status)),
    );
  }

  late StreamSubscription<NameInputError> _nameInputErrorStatusSubscription;

  final NameValidationRepository _nameValidationRepository;

  @override
  Future<void> close() {
    _nameInputErrorStatusSubscription.cancel();
    _nameValidationRepository.dispose();
    return super.close();
  }

  Future<void> _onValidationtatusChanged(
    NameTextFieldValidationStatusChanged event,
    Emitter<NameTextFieldValidationState> emit,
  ) async {
    switch (event.status) {
      case NameInputError.emptyField:
        return emit(const NameTextFieldValidationState.emptyField());
      case NameInputError.valid:
        // final user = await _tryGetUser();
        return emit(
          const NameTextFieldValidationState.valid(),
        );
      case NameInputError.includesInvalidCharacters:
        // ignore: lines_longer_than_80_chars
        return emit(
            const NameTextFieldValidationState.includesInvalidCharacters(),);
    }
  }
}
