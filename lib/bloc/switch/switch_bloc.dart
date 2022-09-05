// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
///
class SwitchBloc extends Bloc<SwitchEvent, bool> {
  SwitchBloc() : super(false) {
    on<SwitchFlick>((event, emit) {
      emit(!state);
    });
  }
}
