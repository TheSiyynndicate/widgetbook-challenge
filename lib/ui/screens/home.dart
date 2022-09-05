// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:widgetbook_challenge/api/models/failure.dart';
import 'package:widgetbook_challenge/bloc/name_text_field_validation/name_text_field_validation_bloc.dart';
import 'package:widgetbook_challenge/bloc/submit_button/submit_button_bloc.dart';
import 'package:widgetbook_challenge/bloc/switch/switch_bloc.dart';
import 'package:widgetbook_challenge/bloc/theme/theme_bloc.dart';
import 'package:widgetbook_challenge/constants/submit_button_props.dart';
import 'package:widgetbook_challenge/localization/app_localizations.dart';
import 'package:widgetbook_challenge/ui/widgets/show_response.dart';
import 'package:widgetbook_challenge/utils/formz_validation/name_input_validation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///
  final _formKey = GlobalKey<FormState>();
  ///
  final _nameTextFieldTextEditingController = TextEditingController();
  ///
  final _nameTextFieldFocusNode = FocusNode();

  //TODO:segment widgets
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('home_title'),
          key:const Key('greetings_text'),

        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedBox(
                        child: Text(
                          AppLocalizations.of(context)!.translate('greetings'),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FittedBox(
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('first_ins'),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FittedBox(
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('second_ins'),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Row(
                              children: [
                                FittedBox(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('light'),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                BlocListener<SwitchBloc, bool>(
                                  listener: (context, state) {
                                    if (state) {
                                      BlocProvider.of<ThemeBloc>(context)
                                          .add(const SwitchToDarkTheme());
                                    } else {
                                      BlocProvider.of<ThemeBloc>(context)
                                          .add(const SwitchToLightTheme());
                                    }
                                  },
                                  child: Switch(
                                    value: BlocProvider.of<SwitchBloc>(context)
                                        .state,
                                    onChanged: (_) {
                                      BlocProvider.of<SwitchBloc>(context)
                                          .add(SwitchFlick(switchState: _));
                                    },
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('dark'),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: constraints.maxWidth,
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _nameTextFieldTextEditingController,
                            focusNode: _nameTextFieldFocusNode,
                            cursorColor: Colors.green,
                            decoration: const InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 5,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 5,
                                ),
                              ),
                            ),
                            onChanged: (changedVal) {
                              final repo =
                                  BlocProvider.of<NameTextFieldValidationBloc>(
                                context,
                              );

                              final nameInputValidation =
                                  NameInputValidation.dirty(value: changedVal);

                              if (!nameInputValidation.valid) {
                                repo.add(
                                  NameTextFieldValidationStatusChanged(
                                    nameInputValidation.error!,
                                  ),
                                );
                              } else {
                                repo.add(
                                  const NameTextFieldValidationStatusChanged(
                                    NameInputError.valid,
                                  ),
                                );
                              }
                            },
                            maxLength: 80,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(),
                            validator: (val) {
                              return null;
                            },
                          ),
                        ),
                      ),
                      BlocBuilder<NameTextFieldValidationBloc,
                          NameTextFieldValidationState>(
                        builder: (context, state) {
                          return AnimatedPhysicalModel(
                            shadowColor: SubmitButtonProps
                                .props[state.status]!['color']! as Color,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                              SubmitButtonProps
                                      .props[state.status]!['borderRadius']!
                                  as double,
                            ),
                            color: SubmitButtonProps
                                .props[state.status]!['color']! as Color,
                            duration: const Duration(milliseconds: 750),
                            elevation: SubmitButtonProps
                                .props[state.status]!['elevation']! as double,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tight(
                                Size(constraints.maxWidth, 50),
                              ),
                              //TODO: use bloc selector
                              child:
                                  state.status != NameInputError.emptyField &&
                                          state.status !=
                                              NameInputError
                                                  .includesInvalidCharacters
                                      ? InkWell(
                                          onTap: () async {
//TODO: add barrier after click

                                            sendRequest(context: context);
                                          },
                                        )
                                      : Container(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ShowResponse()
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void sendRequest({required BuildContext context}) {

    final submitButtonBloc = BlocProvider.of<SubmitButtonBloc>(context);
    try {
      submitButtonBloc.add(
        SubmitButtonPressed(
          name: _nameTextFieldTextEditingController.text,
        ),
      );
    } on Failure catch (failure) {
      submitButtonBloc.add(
        SubmitButtonPressed(
          name: failure.message,
        ),
      );
    }
  }
}
