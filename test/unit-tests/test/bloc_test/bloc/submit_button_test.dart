import 'package:bloc_test/bloc_test.dart';

import 'package:test/test.dart';

import 'package:widgetbook_challenge/bloc/submit_button/submit_button_bloc.dart';

void main() {
  group('SubmitButtonBloc', () {
    late SubmitButtonBloc submitButtonBloc;

    setUp(() async {
      submitButtonBloc = SubmitButtonBloc();
    });

    blocTest<SubmitButtonBloc, SubmitButtonState>(
      'Change the status of the submit button to valid',
      build: () => submitButtonBloc,
      act: (bloc) => bloc.add(
        const SubmitButtonPressed(
          name: 'Mohammed',
        ),
      ),
      expect: () => [SubmitButtonLoading()],
    );

    tearDown(() => submitButtonBloc.close());
  });
}
