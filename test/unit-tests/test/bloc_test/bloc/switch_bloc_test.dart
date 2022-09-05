import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:widgetbook_challenge/bloc/switch/switch_bloc.dart';

void main() {
  group('SwitchBloc', () {
    late SwitchBloc switchBloc;
    setUp(() {
      switchBloc = SwitchBloc();
    });

    blocTest<SwitchBloc, bool>(
      'Alternates the value of the switch',
      build: () => switchBloc,
      act: (bloc) => bloc.add(const SwitchFlick(switchState: true)),
      expect: () => [true],
    );

    tearDown(() => switchBloc.close());
  });
}
