// ignore_for_file: public_member_api_docs

part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState({required this.themeData});
  final ThemeData themeData;
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required ThemeData themeData})
      : super(themeData: themeData);

  @override
  String toString() => 'ThemeInitial { ThemeInitial: $themeData }';

  @override
  List<Object> get props => [themeData];
}

class ThemeDark extends ThemeState {
  const ThemeDark({required ThemeData themeData}) : super(themeData: themeData);

  @override
  String toString() => 'ThemeInitial { ThemeDark: $themeData }';

  @override
  List<Object> get props => [themeData];
}

class ThemeLight extends ThemeState {

  const ThemeLight({required ThemeData themeData})
      : super(themeData: themeData);

  @override
  String toString() => 'ThemeInitial { ThemeLight: $themeData }';

  @override
  List<Object> get props => [themeData];
}
