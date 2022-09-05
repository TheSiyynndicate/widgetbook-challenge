import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:widgetbook_challenge/bloc/theme/theme_bloc.dart';
import 'package:widgetbook_challenge/themes/app_themes.dart';

void main() {
  group('ThemeBloc', () {
    late ThemeBloc themeBloc;
    setUp(() {
      themeBloc = ThemeBloc();
    });

    blocTest<ThemeBloc, ThemeState>(
      'Changes the theme to light',
      build: () => themeBloc,
      act: (bloc) => bloc.add(const SwitchToLightTheme()),
      expect: () => [ThemeLight(themeData: appThemeData[AppTheme.light]!)],
    );

    blocTest<ThemeBloc, ThemeState>(
      'Changes the theme to dark',
      build: () => themeBloc,
      act: (bloc) => bloc.add(const SwitchToDarkTheme()),
      expect: () => [ThemeDark(themeData: appThemeData[AppTheme.dark]!)],
    );

    tearDown(() => themeBloc.close());
  });
}
