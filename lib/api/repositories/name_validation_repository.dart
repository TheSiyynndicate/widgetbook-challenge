// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:widgetbook_challenge/api/models/failure.dart';
import 'package:widgetbook_challenge/api/models/message.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

///Will act as a service to provide
///to retrieve and convert response
///from the API
class NameValidationRepository {
  final _controller = StreamController<NameInputError>();

  ///will get the status of the field to be verified
  Stream<NameInputError> get status async* {
    yield NameInputError.emptyField;
    yield* _controller.stream;
  }

  ///gets the response from the API
  ///and handles exceptions
  Future<Message> getResponseFromApi({required String name}) async {
    try {
      // ignore: lines_longer_than_80_chars
      final apiResponse =
          await WidgetbookApi().welcomeToWidgetbook(message: name);
      return Message(apiResponse);
    } on UnexpectedException {
      throw const Failure('Something happened, not quite sure what?!');
    } on SocketException {
      throw const Failure('No Internet connection');
    } on FormatException {
      throw const Failure('Bad response format');
    }
  }

  ///Validates the string
  ///returns true if the string is valid
  NameInputValidation? validate({required String name}) {
    final nameInputValidation = NameInputValidation.dirty(value: name);
    return nameInputValidation;
  }


  void dispose() => _controller.close();
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    // ignore: unnecessary_this
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj as Exception;
        }
      }),
    );
  }
}
