// ignore_for_file: public_member_api_docs

part of 'submit_button_bloc.dart';

abstract class SubmitButtonState extends Equatable {
  const SubmitButtonState();
}

class SubmitButtonInitial extends SubmitButtonState {
  @override
  List<Object> get props => [];
}

class SubmitButtonLoading extends SubmitButtonState {
  @override
  List<Object> get props => [];
}

class SubmitButtonLoaded extends SubmitButtonState {
  const SubmitButtonLoaded({required this.message});
  final Either<Failure, Message> message;
  @override
  List<Object> get props => [message];
}
