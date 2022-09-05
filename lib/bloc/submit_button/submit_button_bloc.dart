// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/models/failure.dart';
import 'package:widgetbook_challenge/api/models/message.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';

part 'submit_button_event.dart';
part 'submit_button_state.dart';

class SubmitButtonBloc extends Bloc<SubmitButtonEvent, SubmitButtonState> {
  SubmitButtonBloc() : super(SubmitButtonInitial()) {
    on<SubmitButtonPressed>((event, emit) async {
      await _emitStatus(emit: emit, name: event.name);
    });

  }

  Future<void> _emitStatus({
    required Emitter<SubmitButtonState> emit,
    required String name,
  }) async {
    emit(SubmitButtonLoading());
    await Task(() => NameValidationRepository().getResponseFromApi(name: name))
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) {
      emit(SubmitButtonLoaded(message: value as Either<Failure, Message>));
    });
  }
}
