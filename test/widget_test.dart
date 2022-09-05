import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/app.dart';


void main() {
  testWidgets('$App contains reminder', (WidgetTester tester) async {

    final nameValidationRepository = NameValidationRepository();
    // ignore: lines_longer_than_80_chars
    await tester
        .pumpWidget(App(nameValidationRepository: nameValidationRepository));

    await tester.pumpAndSettle();
    expect(find.byKey(Key('greetings_text')), findsOneWidget);

  });
}
