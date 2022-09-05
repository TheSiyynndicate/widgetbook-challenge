import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/api/repositories/name_validation_repository.dart';
import 'package:widgetbook_challenge/app.dart';


void main() {
  late NameValidationRepository nameValidationRepository;
  setUp(() {
    nameValidationRepository=NameValidationRepository();
  });
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.

  testWidgets('Home widget mounted', (tester) async {

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( App(nameValidationRepository: nameValidationRepository));

    await tester.pumpAndSettle();
    expect(find.byKey(const Key('home')), findsOneWidget);
  });
}
