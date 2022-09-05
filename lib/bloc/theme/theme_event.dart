// ignore_for_file: public_member_api_docs

part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class SwitchToLightTheme extends ThemeEvent {
  const SwitchToLightTheme();

  @override
  // TODO: implement props
  List<Object?> get props => [AppTheme.light];
}

class SwitchToDarkTheme extends ThemeEvent {
  const SwitchToDarkTheme();

  @override
  // TODO: implement props
  List<Object?> get props => [AppTheme.dark];
}
