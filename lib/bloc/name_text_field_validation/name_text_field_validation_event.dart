// ignore_for_file: public_member_api_docs

part of 'name_text_field_validation_bloc.dart';

abstract class NameTextFieldValidationEvent extends Equatable {
  const NameTextFieldValidationEvent();
}

// ignore: lines_longer_than_80_chars
class NameTextFieldValidationStatusChanged
    extends NameTextFieldValidationEvent {
  const NameTextFieldValidationStatusChanged(this.status);

  final NameInputError status;

  @override
  List<Object> get props => [status];
}
