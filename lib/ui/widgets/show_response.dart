// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/models/failure.dart';
import 'package:widgetbook_challenge/api/models/message.dart';
import 'package:widgetbook_challenge/bloc/submit_button/submit_button_bloc.dart';

class ShowResponse extends StatelessWidget {
  const ShowResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubmitButtonBloc, SubmitButtonState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case SubmitButtonLoaded:
            final apiResponse = state.props.first! as Either<Failure, Message>;
            apiResponse.fold(
              (failure) => _showDialog(
                message: failure.toString(),
                context: context,
              ),
              (message) => _showDialog(
                message: message.toString(),
                context: context,
              ),
            );
            break;
        }
      },
      builder: (context, state) {
        if (state.runtimeType == SubmitButtonLoading) {
          return const CircularProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }

// ignore: lines_longer_than_80_chars
  Future<void> _showDialog(
      {required String message, required BuildContext context,}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Result'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
