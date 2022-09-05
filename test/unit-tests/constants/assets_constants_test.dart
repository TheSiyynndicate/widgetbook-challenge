import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/constants/assets_constants.dart';

void main() {
  test('Check "assets_constants.dart" for alterations', () {
    expect(
      AssetsConstants.lang['en'],
      'assets/json/lang/en.json',
    );
    expect(
      AssetsConstants.lang['es'],
      'assets/json/lang/es.json',
    );
    expect(
      AssetsConstants.lang['de'],
      'assets/json/lang/de.json',
    );
  });
}
