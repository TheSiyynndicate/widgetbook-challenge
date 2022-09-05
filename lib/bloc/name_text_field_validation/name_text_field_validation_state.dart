// ignore_for_file: public_member_api_docs

part of 'name_text_field_validation_bloc.dart';


class NameTextFieldValidationState extends Equatable {
  const NameTextFieldValidationState._({
    this.status = NameInputError.emptyField,
  });

  const NameTextFieldValidationState.valid()
      : this._(
          status: NameInputError.valid,
        );

  const NameTextFieldValidationState.emptyField()
      : this._(
          status: NameInputError.emptyField,
        );


  const NameTextFieldValidationState.includesInvalidCharacters()
      : this._(status: NameInputError.includesInvalidCharacters);

  final NameInputError status;

  @override
  List<Object> get props => [status];
}
