// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_challenge/themes/app_themes.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(themeData: appThemeData[AppTheme.light]!)) {
    on<SwitchToDarkTheme>((event, emit) async {
      await _setThemeToDark(emit: emit);
    });
    on<SwitchToLightTheme>((event, emit) async {
      await _setThemeToLight(emit: emit);
    });
  }

  Future<void> _setThemeToLight({required Emitter<ThemeState> emit}) async {
    emit(ThemeLight(themeData: appThemeData[AppTheme.light]!));
  }

  Future<void> _setThemeToDark({required Emitter<ThemeState>  emit}) async {
    emit(ThemeDark(themeData: appThemeData[AppTheme.dark]!));
  }
}
