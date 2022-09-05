// ignore_for_file: public_member_api_docs

part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
}

class SwitchFlick extends SwitchEvent {
  const SwitchFlick({required this.switchState}) : super();
  final bool switchState;

  @override
  // TODO: implement props
  List<Object?> get props => [!switchState];
}
