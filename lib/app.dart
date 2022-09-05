// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/bloc/name_text_field_validation/name_text_field_validation_bloc.dart';
import 'package:widgetbook_challenge/bloc/submit_button/submit_button_bloc.dart';

import 'package:widgetbook_challenge/bloc/switch/switch_bloc.dart';
import 'package:widgetbook_challenge/bloc/theme/theme_bloc.dart';
import 'package:widgetbook_challenge/localization/app_localizations.dart';
import 'package:widgetbook_challenge/ui/screens/home.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.nameValidationRepository})
      : super(key: key);
  final NameValidationRepository nameValidationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<SwitchBloc>(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider<NameTextFieldValidationBloc>(
          create: (context) => NameTextFieldValidationBloc(
              nameValidationRepository: nameValidationRepository,),
        ),
        BlocProvider<SubmitButtonBloc>(
          create: (context) => SubmitButtonBloc(),
        ),
      ],
      child: RepositoryProvider(
        create: (context) => nameValidationRepository,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              theme: state.themeData,
              // List all of the app's supported locales here
              supportedLocales: const [
                Locale('en', ''),
                Locale('de', ''),
                Locale('es', ''),
              ],
              // These delegates make sure that the localization data for the proper language is loaded
              localizationsDelegates: const [
                // A class which loads the translations from JSON files
                AppLocalizations.delegate,
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              // Returns a locale which will be used by the app
              localeResolutionCallback: (locale, supportedLocales) {
                // Check if the current device locale is supported
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                // If the locale of the device is not supported, use the first one
                // from the list (English, in this case).
                return supportedLocales.first;
              },

              routes: {'/': (context) => const Home(key:  Key('home'),)},
            );
          },
          buildWhen: (previousState, currentState) {
            if (currentState != previousState) {
              return true;
            } else {
              return false;
            }
          },
        ),
      ),
    );
  }
}
