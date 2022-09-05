/// ignore_for_file: public_member_api_docs



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/app.dart';

void main() {
  final nameValidationRepository = NameValidationRepository();
  runApp(App(
    nameValidationRepository: nameValidationRepository,
  ),);
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('${bloc.runtimeType} $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('${bloc.runtimeType} $transition');
    }
  }
}
