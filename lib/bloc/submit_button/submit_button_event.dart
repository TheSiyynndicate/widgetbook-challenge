// ignore_for_file: public_member_api_docs

part of 'submit_button_bloc.dart';

abstract class SubmitButtonEvent extends Equatable {
  const SubmitButtonEvent();
}

class SubmitButtonPressed extends SubmitButtonEvent {

  const SubmitButtonPressed({required this.name});

// final Either<Failure,Message> message;
  final String name;

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

